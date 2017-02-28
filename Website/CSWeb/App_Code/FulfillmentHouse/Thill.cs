using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using CSBusiness;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.FulfillmentHouse;
using CSBusiness.Attributes;
using CSCore.Utils;
using CSCore.DataHelper;
using System.Text;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace CSWeb.FulfillmentHouse
{
    public class Thill
    {
        XmlNode config = null;
        public Thill()
        {
            config = GetConfig();
        }
        private XmlNode GetConfig()
        {
            return OrderHelper.GetDefaultFulFillmentHouseConfig();
        }
        public string GetRequest(Order orderItem)
        {            
            orderItem.LoadAttributeValues();
            string blank = "";
            string RushProcessing = "N";
            string ShippingState = "";
            string BillingState = "";
            List<StateProvince> states = StateManager.GetAllStates(0);

            StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
            if (itemShippingStateProvince != null)
            {
                ShippingState = itemShippingStateProvince.Abbreviation;
            }
            else
            {
                ShippingState = "";
            }

            StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
            if (itemBillingStateProvince != null)
            {
                BillingState = itemBillingStateProvince.Abbreviation;
            }
            else
            {
                BillingState = "";
            }
            

            String strXml = String.Empty;            
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Newtonsoft.Json.Formatting.Indented;
                writer.WriteStartObject();
                writer.WritePropertyName("Test");
                writer.WriteValue(config.Attributes["Test"].Value);
                writer.WritePropertyName("Orders");
                writer.WriteStartArray();
                writer.WriteStartObject();

                writer.WritePropertyName("Order");
                writer.WriteStartObject();
                writer.WritePropertyName("Header");
                writer.WriteStartObject();
                writer.WritePropertyName("HeaderGroup");
                writer.WriteStartObject();
                writer.WritePropertyName("OrderNumber");
                writer.WriteValue(orderItem.OrderId.ToString());
                writer.WritePropertyName("CustNo");
                writer.WriteValue(orderItem.CustomerId.ToString());
                writer.WritePropertyName("EntryDate");
                writer.WriteValue(orderItem.CreatedDate.ToString("yyyyMMdd"));
                writer.WritePropertyName("CoDivision");
                writer.WriteValue(blank);
                writer.WritePropertyName("Source");
                writer.WriteValue(config.Attributes["SourceCode"].Value);
                writer.WritePropertyName("ProdDollars");
                writer.WriteValue(orderItem.SubTotal.ToString("N2"));
                writer.WritePropertyName("PHAmt");
                writer.WriteValue(orderItem.ShippingCost.ToString("N2"));
                writer.WritePropertyName("TaxAmt");
                writer.WriteValue(orderItem.Tax.ToString("N2"));
                writer.WritePropertyName("Tax-Exempt-No");
                writer.WriteValue(blank);
                writer.WritePropertyName("Tax-Exempt");
                writer.WriteValue(blank);
                writer.WritePropertyName("LabelComment");
                writer.WriteValue(blank);
                writer.WritePropertyName("DiscountComment");
                writer.WriteValue(blank);
                writer.WritePropertyName("HeaderStatus");
                writer.WriteValue(blank);
                writer.WritePropertyName("RushProcessing");
                writer.WriteValue(RushProcessing);
                writer.WritePropertyName("PayMethod");
                writer.WriteValue(GetCCType(orderItem.CreditInfo.CreditCardName));
                writer.WritePropertyName("EntireOrderInstallment");
                writer.WriteValue(blank);
                writer.WritePropertyName("WaitForCustomer");
                writer.WriteValue(blank);

                writer.WritePropertyName("AffiliateMarketing");
                writer.WriteStartObject();
                writer.WritePropertyName("MarketingInfo");
                writer.WriteStartObject();
                writer.WritePropertyName("Type");
                writer.WriteValue(blank);
                writer.WritePropertyName("Affiliate");
                writer.WriteValue(blank);
                writer.WritePropertyName("WebSite");
                writer.WriteValue(config.Attributes["Website"].Value);
                writer.WritePropertyName("Script");
                writer.WriteValue(blank);
                writer.WritePropertyName("TVMedia");
                writer.WriteValue(blank);
                writer.WritePropertyName("Number800");
                writer.WriteValue(blank);
                writer.WriteEndObject();
                writer.WriteEndObject();

                writer.WriteEndObject();
                writer.WriteEndObject();

                Order orderItem2 = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderItem.OrderId, false);
                if (orderItem2.DiscountCode!=null && !orderItem2.DiscountCode.Equals(""))
                {
                    writer.WritePropertyName("Coupons");
                    writer.WriteStartObject();
                    writer.WritePropertyName("Coupon");
                    writer.WriteStartObject();
                    writer.WritePropertyName("CouponType");
                    writer.WriteValue(config.Attributes["CouponType"].Value);
                    writer.WritePropertyName("DiscountCode");
                    writer.WriteValue(orderItem2.DiscountCode);
                    writer.WritePropertyName("CouponNumber");
                    writer.WriteValue(blank);
                    writer.WritePropertyName("DollarDiscountAmount");
                    writer.WriteValue(orderItem2.DiscountAmount.ToString("N2"));
                    writer.WritePropertyName("PercentageDiscount");
                    writer.WriteValue(blank);
                    writer.WriteEndObject();
                    writer.WriteEndObject();
                }

                writer.WritePropertyName("Billing");
                writer.WriteStartObject();
                writer.WritePropertyName("Billto");
                writer.WriteStartObject();
                writer.WritePropertyName("OrderNumber");
                writer.WriteValue(orderItem.OrderId.ToString());
                writer.WritePropertyName("FirstName");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.FirstName);
                writer.WritePropertyName("MiddleInitial");
                writer.WriteValue(blank);
                writer.WritePropertyName("LastName");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.LastName);
                writer.WritePropertyName("CompanyName");
                writer.WriteValue(blank);
                writer.WritePropertyName("Address1");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.Address1);
                writer.WritePropertyName("Address2");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.Address2);
                writer.WritePropertyName("Address3");
                writer.WriteValue(blank);
                writer.WritePropertyName("City");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.City);
                writer.WritePropertyName("State");
                writer.WriteValue(BillingState);
                // string ShippingState = "";                 
                writer.WritePropertyName("ZipCode");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.ZipPostalCode);
                writer.WritePropertyName("CountryCd");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.CountryCode.Trim());
                writer.WritePropertyName("Country");                
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.CountryCode.Trim());                
                writer.WritePropertyName("DayPhone");
                writer.WriteValue(orderItem.CustomerInfo.BillingAddress.PhoneNumber);
                writer.WritePropertyName("Email");
                writer.WriteValue(orderItem.Email);
                writer.WriteEndObject();
                writer.WriteEndObject();

                writer.WritePropertyName("CreditCardInfo");
                writer.WriteStartObject();
                writer.WritePropertyName("CreditCard");
                writer.WriteStartObject();
                writer.WritePropertyName("CreditCardNumber");
                writer.WriteValue(orderItem.CreditInfo.CreditCardNumber);
                writer.WritePropertyName("CreditCardExpDate");
                writer.WriteValue(orderItem.CreditInfo.CreditCardExpired.ToString("MMyy"));
                writer.WritePropertyName("CreditCardType");
                writer.WriteValue(GetCCType(orderItem.CreditInfo.CreditCardName));
                writer.WritePropertyName("CreditCardSecure");
                writer.WriteValue(blank);
                writer.WritePropertyName("CreditCardAuthorization");
                writer.WriteValue(orderItem.CreditInfo.AuthorizationCode);
                writer.WritePropertyName("RefNumber");
                writer.WriteValue(blank);
                writer.WritePropertyName("AuthSource");
                writer.WriteValue(blank);
                writer.WritePropertyName("AuthChar");
                writer.WriteValue(blank);                
                writer.WritePropertyName("TranID");
                writer.WriteValue(blank);
                writer.WritePropertyName("ValidationCode");
                writer.WriteValue(blank);
                writer.WritePropertyName("TransactionStatus");
                writer.WriteValue(blank);                               
                writer.WritePropertyName("LTTranID");
                writer.WriteValue(orderItem.CreditInfo.TransactionCode);
                writer.WritePropertyName("OP-TranID");
                writer.WriteValue(blank);
                writer.WritePropertyName("OP-MerchantRefNumber");
                writer.WriteValue(blank);
                writer.WritePropertyName("AN-TranID");
                writer.WriteValue(blank);
                writer.WritePropertyName("AN-InvoiceNumber");
                writer.WriteValue(blank);
                writer.WritePropertyName("CyberSource-TransID");
                writer.WriteValue(blank);
                writer.WritePropertyName("EC-RoutingNumber");
                writer.WriteValue(blank);
                writer.WritePropertyName("EC-BankAccount");
                writer.WriteValue(blank); 
                writer.WriteEndObject();
                writer.WriteEndObject();

                writer.WritePropertyName("ProductManifest");
                writer.WriteStartObject();
                writer.WritePropertyName("Product");
                writer.WriteStartArray();

                foreach (Sku Item in orderItem.SkuItems)
                {
                    writer.WriteStartObject();                    
                    writer.WritePropertyName("OrderNumber");
                    writer.WriteValue(orderItem.OrderId.ToString());
                    writer.WritePropertyName("LineNo");
                    writer.WriteValue(blank);
                    writer.WritePropertyName("ItemNo");
                    writer.WriteValue(Item.SkuCode);
                    writer.WritePropertyName("Status");
                    writer.WriteValue(blank);
                    writer.WritePropertyName("Amount");
                    writer.WriteValue(Item.InitialPrice.ToString("N2"));
                    writer.WritePropertyName("Quantity");
                    writer.WriteValue(Item.Quantity.ToString());
                    writer.WritePropertyName("Description");
                    writer.WriteValue(blank);
                    writer.WritePropertyName("Ship-Meth-Cd");
                    writer.WriteValue(GetShipMethodBySku(Item));
                    writer.WritePropertyName("BillTable");
                    writer.WriteValue(blank);
                    writer.WriteEndObject();
                }
                writer.WriteEndArray();    
                writer.WriteEndObject();

                writer.WritePropertyName("Shipping");
                writer.WriteStartObject();
                writer.WritePropertyName("Shipto");
                writer.WriteStartObject();
                writer.WritePropertyName("OrderNumber");
                writer.WriteValue(orderItem.OrderId.ToString());
                writer.WritePropertyName("FirstName");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.FirstName);
                writer.WritePropertyName("MiddleInitial");
                writer.WriteValue(blank);
                writer.WritePropertyName("LastName");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.LastName);
                writer.WritePropertyName("CompanyName");
                writer.WriteValue(blank);
                writer.WritePropertyName("Address1");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.Address1);
                writer.WritePropertyName("Address2");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.Address2);
                writer.WritePropertyName("Address3");
                writer.WriteValue(blank);
                writer.WritePropertyName("City");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.City);
                writer.WritePropertyName("State");
                writer.WriteValue(ShippingState);                              
                writer.WritePropertyName("ZipCode");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.ZipPostalCode);
                writer.WritePropertyName("CountryCd");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim());
                writer.WritePropertyName("Country");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim());
                writer.WritePropertyName("DayPhone");
                writer.WriteValue(orderItem.CustomerInfo.ShippingAddress.PhoneNumber);
                writer.WriteEndObject();
                writer.WriteEndObject();

                writer.WriteEndObject();
                writer.WriteEndObject();
                writer.WriteEndArray();
                
                writer.WriteEndObject();
            }
            strXml = sb.ToString();
            return strXml;
        }
                 
        public bool PostOrder(int orderId)
        {
            bool orderSubmitted = false;
            string Basic_Auth = "";
            string req = "";
            string res_basicAuth = "";
            string res = "";
            string Token = "";
            string success = "";
            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>(); 
            try
            {
                Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);

                // Basic Authentication and Get Token
                string AuthenticationUrl = config.Attributes["AuthenticationUrl"].Value;
                Basic_Auth = Convert.ToBase64String(Encoding.UTF8.GetBytes(config.Attributes["PublicKey"].Value + ":" + config.Attributes["SecretKey"].Value));
                HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(AuthenticationUrl);
                objRequest.Method = "POST";
                // objRequest.ContentType = "application/json";
                objRequest.Headers.Add("Authorization", "Basic " + Basic_Auth);
                HttpWebResponse response = (HttpWebResponse)objRequest.GetResponse();
                int StatusCode = (int) response.StatusCode;
                if (StatusCode == 200)
                {
                    StreamReader responseReader = new StreamReader(response.GetResponseStream());
                    res_basicAuth = responseReader.ReadToEnd();
                    if (res_basicAuth.ToLower().Contains("success") && res_basicAuth.ToLower().Contains("token"))
                    {
                        JToken token = JObject.Parse(res_basicAuth);
                        success = token["success"].ToString();
                        if (success.ToLower().Equals("true"))
                        {
                            Token = token["token"].ToString();
                        }
                    }
                    else
                    {
                        Token = res_basicAuth;
                    }
                }
                else
                {
                    Token = "";
                    OrderHelper.SendOrderFailedEmail(orderId, "custom", "Basic Authentication Empty Token StatusCode = " + StatusCode.ToString());
                }
                orderAttributes.Add("AuthenticationRequest", new CSBusiness.Attributes.AttributeValue(Basic_Auth));
                orderAttributes.Add("AuthenticationResponse", new CSBusiness.Attributes.AttributeValue(res_basicAuth));
                orderAttributes.Add("AuthenticationToken", new CSBusiness.Attributes.AttributeValue(Token));
                if (res_basicAuth.ToLower().Contains("success") && res_basicAuth.ToLower().Contains("token"))
                {
                    orderSubmitted = false;                    
                    HttpWebRequest objRequest2 = (HttpWebRequest) WebRequest.Create(config.Attributes["transactionUrl"].Value);
                    string authInfo = config.Attributes["PublicKey"].Value + ":" + Token;
                    authInfo = Convert.ToBase64String(Encoding.ASCII.GetBytes(authInfo));
                    objRequest2.PreAuthenticate = true;
                    objRequest2.Headers["X-Authorization"] = "Basic " + authInfo;                    
                    objRequest2.Headers["Authorization"] = "Basic " + Basic_Auth;
                                        
                    req = "orders=" + GetRequest(orderItem);
                    var req1 = Encoding.ASCII.GetBytes(req);                    
                    objRequest2.Method = "POST";
                    objRequest2.ContentType = "application/x-www-form-urlencoded";
                    objRequest2.ContentLength = req1.Length;                                       
                    using (var stream = objRequest2.GetRequestStream())
                    {
                        stream.Write(req1, 0, req1.Length);
                    }
                    
                    int statuscode;
                    try
                    {
                        using (var response2 = (HttpWebResponse)objRequest2.GetResponse())
                        using (var responseStream = new StreamReader(response2.GetResponseStream(), Encoding.UTF8))
                        {                            
                            statuscode = (int)response2.StatusCode;
                            res = responseStream.ReadToEnd();
                            if (res.ToLower().Contains("success"))
                            {
                                JToken token = JObject.Parse(res);
                                success = token["success"].ToString();
                                if (success.ToLower().Equals("true"))
                                {
                                    orderSubmitted = true;
                                }
                            }
                        }
                    }
                    catch (WebException ex1)
                    {
                        var errorResponse = (HttpWebResponse)ex1.Response;
                        statuscode = (int)errorResponse.StatusCode;
                        using (var responseStream = new StreamReader(errorResponse.GetResponseStream()))
                        {
                            res = responseStream.ReadToEnd();
                        }
                    }
                    orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(CommonHelper.Encrypt(req)));
                    orderAttributes.Add("Response", new CSBusiness.Attributes.AttributeValue(res));
                    if (orderSubmitted == true)
                    {
                        CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
                    }
                    else
                    {
                        CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                        OrderHelper.SendOrderFailedEmail(orderId, "custom", res);
                    }
                }
                else
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, null);
                }        
            }
            catch (Exception ex)
            {
                string errormessage = ex.InnerException + " StackTrace:: " + ex.StackTrace;
                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderId, 5);
                orderSubmitted = false;
                OrderHelper.SendOrderFailedEmail(orderId, "custom", errormessage);                
            }
            return orderSubmitted;
        }
        private string GetCCType(string CreditCardType)
        {
            string CreditCardTypeAbb = "";
            if (CreditCardType.ToLower().Equals("visa"))
            {
                CreditCardTypeAbb = "VI";
            }
            else if (CreditCardType.ToLower().Equals("mastercard"))
            {
                CreditCardTypeAbb = "MC";
            }
            else if (CreditCardType.ToLower().Equals("discover"))
            {
                CreditCardTypeAbb = "DI";
            }
            else if (CreditCardType.ToLower().Equals("americanexpress") || CreditCardType.ToLower().Equals("american express"))
            {
                CreditCardTypeAbb = "AX";
            }
            return CreditCardTypeAbb;
        }
        public string GetShipMethodBySku(Sku sku1)
        {
            string ShipMethod = "24";
            sku1.LoadAttributeValues();
            if (sku1.AttributeValues.ContainsKey("shipmethodcode"))
            {
                ShipMethod = sku1.AttributeValues["shipmethodcode"].Value;
            }
            return ShipMethod;
        }
        
    }
}