using CSBusiness;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

                if (orderData.OrderStatusId == 2) throw new Exception("Order Already Processed!"); ;

                if (OrderHelper.IsCustomerOrderFlowCompleted(orderData.OrderId)) return true;

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
                if (CSFactory.GetCacheSitePref().PaymentGatewayService | orderData.CreditInfo.CreditCardName == "PayWithAmazon")
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

                if (authSuccess)
                {
                    // Check if fulfillment gateway service is enabled or not.
                    if (CSFactory.GetCacheSitePref().FulfillmentHouseService)
                    {
                        try
                        {
                            //Add fullfillment Order Post method
                        }
                        catch (Exception ex)
                        {
                            CSLogger.Instance.LogException("Fullfilment Error - orderid: " + Convert.ToString(orderId), ex);
                            OrderHelper.SendEmailToAdmins(orderId);
                        }
                        return true;
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                CSLogger.Instance.LogException("Batch error - ProcessOrder OrderID " + orderId.ToString(), ex);
                OrderHelper.SendOrderFailedEmail(orderId);
            }
            return false;
        }
    }
}