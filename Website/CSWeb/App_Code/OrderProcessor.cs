using CSBusiness;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CSWebBase;


namespace CSWeb
{
    public class OrderProcessor
    {
        /// <summary>
        /// Loads all orders and processes them for gateway and fullfilment.
        /// </summary>
        public static void ProcessAllOrders()
        {
            try
            {
                Hashtable AllItems = new OrderManager().GetBatchProcessOrders();
                List<Order> orders = (List<Order>)AllItems["allOrders"];
                foreach (Order orderItem in orders)
                {
                    ProcessOrder(orderItem.OrderId);
                }
            }
            catch (Exception ex)
            {
                CSCore.CSLogger.Instance.LogException("Batch error - OrderProcessor ", ex);
                OrderHelper.SendFullFillmentBatchFailedEmail(ex);
            }
        }

        public static void ProcessOrderAndRedirect(int orderId)
        {
            if (ProcessOrder(orderId))
                HttpContext.Current.Response.Redirect("receipt");
            else
                HttpContext.Current.Response.Redirect("carddecline");
        }

        public static bool ProcessOrder(int orderId)
        {
            try
            {
                if (orderId <= 0) throw new Exception("Invalid Order ID!");

                Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);

                if (orderData.OrderStatusId == 2)
                {
                    return true;
                } //throw new Exception("Order Already Processed!"); ;

                if (orderData.OrderStatusId != 5)
                {
                    if (OrderHelper.IsCustomerOrderFlowCompleted(orderData.OrderId)) return true;
                }
                //Calculate order tax
                //Simpova.CalculateTax(orderId);

                if (orderData.OrderStatusId == 5)
                {
                    decimal tax = new DuplicateOrderDAL().CalculateTax(orderData);
                    CSResolve.Resolve<IOrderService>().UpdateOrderTax(orderId, tax);
                }

                string[] testCreditCards;
                testCreditCards = ResourceHelper.GetResoureValue("TestCreditCard").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); ;
                foreach (string word in testCreditCards)
                {
                    if (orderData.CreditInfo.CreditCardNumber.Equals(word))
                    {
                        CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderData.OrderId, 7);
                        return true;
                    }
                }
                bool authSuccess = false;
                // Check if payment gateway service is enabled or not.
                if (CSFactory.GetCacheSitePref().PaymentGatewayService)
                {
                    try
                    {
                        authSuccess = orderData.OrderStatusId == 4
                            || orderData.OrderStatusId == 5 // fulfillment failure (fulfillment was attempted after payment success), so don't charge again.
                            || OrderHelper.AuthorizeOrder(orderId);
                        if (!authSuccess)
                            OrderHelper.SendOrderDeclinedEmail(orderId);
                    }
                    catch (Exception ex)
                    {
                        CSLogger.Instance.LogException("AuthorizeOrder - auth error - orderid: " + Convert.ToString(orderId), ex);
                    }
                }
                else
                {
                    authSuccess = true;
                }

                string[] successCards;
                successCards = ResourceHelper.GetResoureValue("SuccessCard").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); ;
                foreach (string successCard in successCards)
                {
                    if (orderData.CreditInfo.CreditCardNumber.Equals(successCard))
                    {
                        authSuccess = true;
                    }
                }

                if (authSuccess)
                {
                    // Check if fulfillment gateway service is enabled or not.
                    if (CSFactory.GetCacheSitePref().FulfillmentHouseService)
                    {
                        try
                        {
                            new FulfillmentHouse.MVISOrderLogix().PostOrder(orderId);
                            //Add fullfillment Order Post method
                        }
                        catch (Exception ex)
                        {
                            CSLogger.Instance.LogException("Fullfilment Error - orderid: " + Convert.ToString(orderId), ex);
                            OrderHelper.SendEmailToAdmins(orderId);
                        }
                        try
                        {
                            string token = CSWeb.App_Code.Yotpo.Authentication();
                            var result = CSWeb.App_Code.Yotpo.Subscribe(orderId, token);
                        }
                        catch
                        { }
                        return true;
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                CSLogger.Instance.LogException("Batch error - ProcessOrder OrderID " + orderId.ToString(), ex);
                //OrderHelper.SendOrderFailedEmail(orderId,"custom",ex.Message);
            }
            return false;
        }
    }
}