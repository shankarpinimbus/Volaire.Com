using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Dynamic;
using System.IO;
using System.Net;
using System.Text;
using CSBusiness;
using CSBusiness.Attributes;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSCore.Utils;

namespace CSWeb.App_Code
{
    public static class Yotpo
    {
        public static bool Subscribe(int orderId, string token)
        {

            OrderManager orderMgr = new OrderManager();
            Order orderData = orderMgr.GetOrderDetails(orderId, true);
            bool success = false;
            try
            {
                Uri uri = new Uri("https://api.yotpo.com/apps/" + "itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ" + "/purchases/");
                StringBuilder sb = new StringBuilder();
                StringWriter sq = new StringWriter(sb);

                using (JsonWriter writer = new JsonTextWriter(sq))
                {
                    writer.Formatting = Formatting.Indented;
                    writer.WriteStartObject();
                    writer.WritePropertyName("validate_data");
                    writer.WriteValue(true);
                    writer.WritePropertyName("platform");
                    writer.WriteValue("general");
                    writer.WritePropertyName("utoken");
                    writer.WriteValue(token);
                    writer.WritePropertyName("email");
                    writer.WriteValue(orderData.Email);
                    writer.WritePropertyName("customer_name");
                    writer.WriteValue(orderData.CustomerInfo.ShippingAddress.FirstName + " " + orderData.CustomerInfo.ShippingAddress.LastName);
                    writer.WritePropertyName("order_id");
                    writer.WriteValue(orderData.OrderId);
                    writer.WritePropertyName("order_date");
                    writer.WriteValue(orderData.CreatedDate.ToString("yyyy-MM-dd"));
                    writer.WritePropertyName("currency_iso");
                    writer.WriteValue("USD");
                    writer.WritePropertyName("products");
                    writer.WriteStartObject();
                    foreach (Sku item in orderData.SkuItems)
                    {
                        writer.WritePropertyName(item.OfferCode);
                        writer.WriteStartObject();
                        writer.WritePropertyName("url");
                        writer.WriteValue("https://www.volaire.com");
                        writer.WritePropertyName("name");
                        writer.WriteValue(item.OfferCode);
                        writer.WriteEndObject();

                    }
                    writer.WriteEndObject();
                    writer.WriteEnd();
                }

                var jsonSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                string json = sb.ToString();
                HttpWebRequest r = (HttpWebRequest)WebRequest.Create(uri);
                r.Method = "POST";
                r.ContentType = "application/json";
                string data = json;
                byte[] dataStream = Encoding.UTF8.GetBytes(data);
                r.ContentLength = dataStream.Length;
                // Assign the response object of 'WebRequest' to a 'WebResponse' variable.
                Stream s = r.GetRequestStream();
                // Send the data.
                s.Write(dataStream, 0, dataStream.Length);
                s.Close();

                HttpWebResponse resp = (HttpWebResponse)r.GetResponse();
                System.IO.StreamReader sr = null;
                string sResponse = null;
                sResponse = "";
                sr = new StreamReader(resp.GetResponseStream());
                sResponse = sr.ReadToEnd();
                dynamic responseObj = jsonSerializer.Deserialize<dynamic>(sResponse);
                success = true;
                //Save gateway transaction
                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
                orderAttributes.Add("yotporeq", new CSBusiness.Attributes.AttributeValue(
                    (data != null) ? data : "NULL"));
                orderAttributes.Add("yotpores", new CSBusiness.Attributes.AttributeValue(
                    (sResponse != null) ? sResponse : "NULL"));
                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderData.OrderId, orderAttributes, null);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                success = false;
            }
            return success;
        }

        public static string Authentication()
        {


            string outPut = "";
            try
            {
                Uri uri = new Uri("https://api.yotpo.com/oauth/token");

                var authRequest = new { client_id = "itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ", client_secret = "QeoLLyvnEiE9rjbNBs4296E2ayAMcEVFYvRf8hrI", grant_type = "client_credentials" };
                var jsonSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                string jsonReq = jsonSerializer.Serialize(authRequest);

                // Create a new request to the above mentioned URL.    
                HttpWebRequest r = (HttpWebRequest)WebRequest.Create(uri);
                r.Method = "POST";
                //r.Accept = "*/*";
                r.ContentType = "application/json";
                string data = jsonReq;
                byte[] dataStream = Encoding.UTF8.GetBytes(data);
                r.ContentLength = dataStream.Length;
                // Assign the response object of 'WebRequest' to a 'WebResponse' variable.
                Stream s = r.GetRequestStream();
                // Send the data.
                s.Write(dataStream, 0, dataStream.Length);
                s.Close();

                HttpWebResponse resp = (HttpWebResponse)r.GetResponse();
                System.IO.StreamReader sr = null;
                string sResponse = null;
                sResponse = "";
                sr = new StreamReader(resp.GetResponseStream());
                sResponse = sr.ReadToEnd();
                dynamic responseObj = jsonSerializer.Deserialize<dynamic>(sResponse);
                sResponse = responseObj["access_token"];
                // string res = CommonHelper.HttpPost(baseUrl, req);
                outPut = sResponse;

            }
            catch
            {

            }
            return outPut;
        }




    }
}