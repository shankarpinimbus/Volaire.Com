using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using CSBusiness.OrderManagement;
using System.Collections;
using CSBusiness;
using CSCore.Utils;
using CSCore.DataHelper;
using CSBusiness.Resolver;
using CSBusiness.FulfillmentHouse;
using System.Xml.Linq;
using CSBusiness.Attributes;

namespace CSWeb.FulfillmentHouse
{
    public class Konnektive
    {
        XmlNode config = null;
        public Konnektive()
        {
            config = GetConfig();
        }
        private XmlNode GetConfig()
        {
            return OrderHelper.GetDefaultFulFillmentHouseConfig();
        }
        public string GetRequest(Order orderItem)
        {
            String strXml = String.Empty;

            Hashtable prms = new Hashtable();
            prms.Add("loginId", config.Attributes["login"].Value);
            prms.Add("password", config.Attributes["password"].Value);             
            prms.Add("firstName", orderItem.CustomerInfo.BillingAddress.FirstName);
            prms.Add("lastName", orderItem.CustomerInfo.BillingAddress.LastName);
            prms.Add("address1", orderItem.CustomerInfo.BillingAddress.Address1 );
            prms.Add("address2", orderItem.CustomerInfo.BillingAddress.Address2);
            prms.Add("postalCode", orderItem.CustomerInfo.BillingAddress.ZipPostalCode);
            prms.Add("city", orderItem.CustomerInfo.BillingAddress.City);
            prms.Add("state", StateManager.GetState(orderItem.CustomerInfo.BillingAddress.StateProvinceId).Abbreviation.ToUpper());
            prms.Add("country", orderItem.CustomerInfo.BillingAddress.CountryCode.Trim());
            prms.Add("emailAddress", orderItem.Email);
            prms.Add("phoneNumber", orderItem.CustomerInfo.BillingAddress.PhoneNumber);
            prms.Add("ipAddress", orderItem.IpAddress);

            string billShipSame="0";
            if ((orderItem.CustomerInfo.BillingAddress.Address1.Equals(orderItem.CustomerInfo.ShippingAddress.Address1)) && (orderItem.CustomerInfo.BillingAddress.City.Equals(orderItem.CustomerInfo.ShippingAddress.City))
                 && (orderItem.CustomerInfo.BillingAddress.ZipPostalCode.Equals(orderItem.CustomerInfo.ShippingAddress.ZipPostalCode)))
            {
                billShipSame="1"; // If Bill To Address = Ship To Address
            }
            else
            {
                billShipSame="0"; // If Bill To Address != Ship To Address
            }
            prms.Add("billShipSame", billShipSame);
            if(billShipSame.Equals("0"))
            {
                prms.Add("shipFirstName", orderItem.CustomerInfo.ShippingAddress.FirstName);
                prms.Add("shipLastName", orderItem.CustomerInfo.ShippingAddress.LastName);                
                prms.Add("shipAddress1", orderItem.CustomerInfo.ShippingAddress.Address1);
                prms.Add("shipAddress2", orderItem.CustomerInfo.ShippingAddress.Address2);
                prms.Add("shipPostalCode", orderItem.CustomerInfo.ShippingAddress.ZipPostalCode);
                prms.Add("shipCity", orderItem.CustomerInfo.ShippingAddress.City );
                prms.Add("shipState", StateManager.GetState(orderItem.CustomerInfo.ShippingAddress.StateProvinceId).Abbreviation.ToUpper());
                prms.Add("shipCountry", orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim());                
            }
            // Payment Information
            prms.Add("paySource", config.Attributes["paySource"].Value);
            prms.Add("cardNumber", orderItem.CreditInfo.CreditCardNumber);
            prms.Add("cardMonth",orderItem.CreditInfo.CreditCardExpired.ToString("MM"));            
            prms.Add("cardYear",orderItem.CreditInfo.CreditCardExpired.ToString("yyyy"));
            prms.Add("cardSecurityCode", orderItem.CreditInfo.CreditCardCSC);                        
            prms.Add("preAuthBillerId", config.Attributes["PreAuthBillerID"].Value);
            prms.Add("preAuthMerchantTxnId", orderItem.CreditInfo.TransactionCode);

            prms.Add("campaignId", config.Attributes["CampaignID"].Value);
            // prms.Add("forceQA", config.Attributes["ForceQA"].Value);
            // SKU Information
            int counter = 1;
            foreach (Sku s in orderItem.SkuItems)
            {
                prms.Add("product"+counter.ToString()+"_id", s.SkuCode);
                prms.Add("product"+counter.ToString()+"_qty", s.Quantity);                
                // prms.Add("product"+counter.ToString()+"_price", (s.InitialPrice * s.Quantity));
                // prms.Add("product"+counter.ToString()+"_shipPrice", );
                counter++;
            }            
            //if(config.Attributes["ShippingProfileID"].Value.Equals("") == false)
            //{
            //    prms.Add("shippingProfileId", config.Attributes["ShippingProfileID"].Value);
            //}
            prms.Add("salesTax", orderItem.Tax.ToString("N2"));
            prms.Add("custom1", orderItem.OrderId);

            String postdata = string.Empty;
            foreach (DictionaryEntry prm in prms)
            {
                postdata += prm.Key + "=" + prm.Value + "&";
            }
            postdata = postdata.TrimEnd('&');
            strXml = postdata.TrimEnd('&');

            return strXml;
        }
        public bool PostOrder(int orderId)
        {
            bool result = false;
            Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);
            string req = GetRequest(orderItem);
            string res = CommonHelper.HttpPost(config.Attributes["transactionUrl"].Value, req);

            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(CommonHelper.Encrypt(req)));
            orderAttributes.Add("Response", new CSBusiness.Attributes.AttributeValue(res));
            if (res.ToUpper().Contains("SUCCESS"))
            {
                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
                result = true;
            }
            else
            {
                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                result = false;
                //sending email to admins
                OrderHelper.SendEmailToAdmins(orderId);
            }
            return result;
        }
    }
}