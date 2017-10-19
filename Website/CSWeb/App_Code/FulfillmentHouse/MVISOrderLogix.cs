using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Collections;
using System.Net;
using System.Text;
using CSBusiness;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.FulfillmentHouse;
using CSBusiness.Attributes;
using CSCore.Utils;
using CSCore.DataHelper;
using CSWebBase;

namespace CSWeb.FulfillmentHouse
{
    public class MVISOrderLogix
    {
        XmlNode config = null;
        public MVISOrderLogix()
        {
            config = GetConfig();
        }
        public string GetRequest(Order orderItem)
        {
            string Prefix = config.Attributes["MVISPrefix"].Value.ToUpper();
            string DNIS = config.Attributes["DNIS"].Value.ToUpper();
            string NoSoliciting = config.Attributes["NO_SOLICITING"].Value.ToUpper();
            string PaymentType = config.Attributes["PaymentType"].Value.ToUpper(); // AUTH OR SALE or BLANK
            string PaymentMethod = config.Attributes["PAYMENT_METHOD"].Value.ToUpper(); // CC or CK (Check)
            string EmpNumber = config.Attributes["EmpNumber"].Value.ToUpper();

            string CustomerNumber = Prefix + "-" + orderItem.CustomerId; // BillingAddress.AddressId.ToString();
            List<StateProvince> states = StateManager.GetAllStates(0);
            String strXml = String.Empty;
            string lineItems = String.Empty;
            orderItem.LoadAttributeValues();
            using (StringWriter str = new StringWriter())
            {
                using (XmlTextWriter xml = new XmlTextWriter(str))
                {
                    string sid = "default";
                    string afid = string.Empty;
                    string cid = string.Empty;
                    string adid = string.Empty;
                    if (orderItem.CustomFiledInfo != null)
                    {
                        if (orderItem.CustomFiledInfo.Count > 0)
                        {
                            try
                            {
                                if (orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "afid") != null)
                                {
                                    afid = orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "afid").FieldValue.ToString();
                                }
                                if (orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "sid") != null)
                                {
                                    sid = orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "sid").FieldValue.ToString();
                                }
                                if (orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "adid") != null)
                                {
                                    adid = orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "adid").FieldValue.ToString();
                                }
                                if (orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "cid") != null)
                                {
                                    cid = orderItem.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "cid").FieldValue.ToString();
                                }

                            }
                            catch { }
                        }
                    }

                    sid = orderItem.GetAttributeValue<string>("sid", string.Empty);

                    xml.WriteStartElement("OrderImport");
                    xml.WriteStartElement("Order");
                    xml.WriteElementString("CUSTOMER_NUMBER", CustomerNumber); // Store Billing Address ID as Customer Number
                    xml.WriteElementString("BILL_COMPANY", "");
                    xml.WriteElementString("BILL_FIRST_NAME", orderItem.CustomerInfo.BillingAddress.FirstName.Replace("&amp;","").Replace(" &","").Replace("'",""));
                    xml.WriteElementString("BILL_LAST_NAME", orderItem.CustomerInfo.BillingAddress.LastName.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("BILL_ADDRESS1", orderItem.CustomerInfo.BillingAddress.Address1.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("BILL_ADDRESS2", orderItem.CustomerInfo.BillingAddress.Address2.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("BILL_CITY", orderItem.CustomerInfo.BillingAddress.City.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("CUSTOM_2", sid);
                    xml.WriteElementString("CUSTOM_1", DynamicSidDAL.GetDynamicSidData("ProjectCode", sid, orderItem.OrderId));
                    StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
                    if (itemBillingStateProvince != null)
                    {
                        xml.WriteElementString("BILL_STATE", itemBillingStateProvince.Abbreviation);
                    }
                    else
                    {
                        xml.WriteElementString("BILL_STATE", string.Empty);
                    }

                    xml.WriteElementString("BILL_ZIPCODE", orderItem.CustomerInfo.BillingAddress.ZipPostalCode);
                    if (orderItem.CustomerInfo.BillingAddress.CountryId == 231)
                    {
                        xml.WriteElementString("COUNTRY", "USA");
                    }
                    else if (orderItem.CustomerInfo.BillingAddress.CountryId == 46)
                    {
                        xml.WriteElementString("COUNTRY", "CAN");
                    }
                    xml.WriteElementString("BILL_PHONE_NUMBER", orderItem.CustomerInfo.BillingAddress.PhoneNumber);
                    xml.WriteElementString("BILL_PHONE_2", "");
                    xml.WriteElementString("EMAIL", orderItem.Email);
                    xml.WriteElementString("NO_SOLICITING", NoSoliciting);

                    xml.WriteElementString("SHIP_TO_COMPANY", "");
                    xml.WriteElementString("SHIP_TO_FIRST_NAME", orderItem.CustomerInfo.ShippingAddress.FirstName.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("SHIP_TO_LAST_NAME", orderItem.CustomerInfo.ShippingAddress.LastName.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("SHIP_TO_ADDRESS1", orderItem.CustomerInfo.ShippingAddress.Address1.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("SHIP_TO_ADDRESS2", orderItem.CustomerInfo.ShippingAddress.Address2.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    xml.WriteElementString("SHIP_TO_CITY", orderItem.CustomerInfo.ShippingAddress.City.Replace("&amp;", "").Replace("&", "").Replace("'", ""));
                    StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
                    if (itemShippingStateProvince != null)
                    {
                        xml.WriteElementString("SHIP_TO_STATE", itemShippingStateProvince.Abbreviation);
                    }
                    else
                    {
                        xml.WriteElementString("SHIP_TO_STATE", string.Empty);
                    }
                    xml.WriteElementString("SHIP_TO_ZIPCODE", orderItem.CustomerInfo.ShippingAddress.ZipPostalCode);
                    if (orderItem.CustomerInfo.ShippingAddress.CountryId == 231)
                    {
                        xml.WriteElementString("SCOUNTRY", "USA");
                    }
                    else if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
                    {
                        xml.WriteElementString("SCOUNTRY", "CAN");
                    }
                    xml.WriteElementString("SHIP_TO_PHONE", orderItem.CustomerInfo.BillingAddress.PhoneNumber);
                    xml.WriteElementString("SHIP_TO_PHONE2", "");

                    xml.WriteElementString("ORDER_DATE", orderItem.CreatedDate.ToString("MM/dd/yy"));
                    xml.WriteElementString("ORDER_NUMBER", Prefix + orderItem.OrderId.ToString());
                    xml.WriteElementString("DNIS", DNIS);
                    xml.WriteElementString("EMP_NUMBER", EmpNumber);
                    if (!string.IsNullOrEmpty(orderItem.CreditInfo.TransactionCode))
                    {
                        xml.WriteElementString("PAYMENT_TYPE", PaymentType);  // AUTH or SALE or Blank
                        xml.WriteElementString("AMOUNT_ALREADY_PAID", (orderItem.Total).ToString("N2"));
                        if (orderItem.CreditInfo.CreditCardNumber.Equals("4000000000000002") &&
                            string.IsNullOrEmpty(orderItem.CreditInfo.TransactionCode))
                        {
                            xml.WriteElementString("MERCHANT_TRANSACTION_ID", "Test");
                        }
                        else
                        {
                            xml.WriteElementString("MERCHANT_TRANSACTION_ID", orderItem.CreditInfo.TransactionCode);
                        }
                    }
                    xml.WriteElementString("PAYMENT_METHOD", PaymentMethod); // "CC" for credit card or "CK" for check/check by phone
                    xml.WriteElementString("CC_TYPE", GetCCType(orderItem.CreditInfo.CreditCardName));
                    xml.WriteElementString("CC_NUMBER", orderItem.CreditInfo.CreditCardNumber);
                    xml.WriteElementString("EXP_DATE", orderItem.CreditInfo.CreditCardExpired.ToString("MM/yy"));
                    xml.WriteElementString("CVV_CODE", orderItem.CreditInfo.CreditCardCSC);

                    xml.WriteElementString("SHIPPING_METHOD", "REG");
                    xml.WriteElementString("SHIPPING_CARRIER", "");
                    // We have both Trial as well as One Pay “In the case set Use prices and use shipping to "N."
                    string useShipping = config.Attributes["useShipping"].Value.ToUpper();
                    string usePrices = config.Attributes["usePrices"].Value.ToUpper();
                    string useTaxes = config.Attributes["useTaxes"].Value.ToUpper();

                    xml.WriteElementString("USE_SHIPPING", useShipping);
                    xml.WriteElementString("SHIPPING", Math.Round(orderItem.ShippingCost + orderItem.AdditionalShippingCharge, 2).ToString("N2"));
                    xml.WriteElementString("ORDER_STATE_SALES_TAX", Math.Round(orderItem.Tax, 2).ToString("N2"));
                    xml.WriteElementString("USE_PRICES", usePrices);
                    xml.WriteElementString("USE_TAXES", useTaxes);
                    xml.WriteElementString("ORDER_SUBTOTAL", Math.Round(orderItem.FullPriceSubTotal - orderItem.DiscountAmount, 2).ToString("N2"));
                    xml.WriteElementString("ORDER_TOTAL", Math.Round(orderItem.FullPriceSubTotal + orderItem.ShippingCost + orderItem.AdditionalShippingCharge + orderItem.Tax - orderItem.DiscountAmount, 2).ToString("N2"));


                    int count = 1;
                    SkuManager skuManager = new SkuManager();
                    string fieldnamePRODUCT = "PRODUCT";
                    // string fieldnameDESCRIPTION = "DESCRIPTION" + count.ToString();
                    string fieldnameQUANTITY = "QUANTITY";
                    string fieldnamePRICE = "PRICE";
                    string fieldnameDISCOUNT = "DISCOUNT";
                    string fieldnameCOUPON_CODE = "COUPON_CODE";
                    string fieldnameTAXRATE = "TAX_RATE";
                    string fieldnamePAIDPRICE = "PAID_PRICE_PROD";
                    string fieldnameSHIPPING = "SHIPPING";
                    //PAID_PRICE
                    Order orderCouponInfo = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderItem.OrderId, true);
                    foreach (Sku Item in orderItem.SkuItems)
                    {
                        Sku sku = skuManager.GetSkuByID(Item.SkuId);
                        sku.LoadAttributeValues();
                        if (!sku.GetAttributeValue<bool>("FreeSku", false))
                        {
                            string counter = zeropad(count.ToString(), 2);
                            fieldnamePRODUCT = "PRODUCT" + counter;
                            fieldnameQUANTITY = "QUANTITY" + counter;
                            fieldnamePRICE = "PRICE" + counter;
                            fieldnameDISCOUNT = "DISCOUNT" + counter;
                            fieldnameCOUPON_CODE = "COUPON_CODE" + counter;
                            fieldnamePAIDPRICE = "PAID_PRICE_PROD" + counter;
                            fieldnameTAXRATE = "TAX_RATE" + counter;
                            fieldnameSHIPPING = "SHIPPING" + counter;
                            xml.WriteElementString(fieldnamePRODUCT, GetSkuCode(sku.SkuId, orderItem.CustomerInfo.ShippingAddress.CountryId));
                            xml.WriteElementString(fieldnameQUANTITY, Item.Quantity.ToString());
                            xml.WriteElementString(fieldnamePRICE, sku.FullPrice.ToString("N2"));
                            xml.WriteElementString(fieldnameDISCOUNT, "");
                            xml.WriteElementString(fieldnameCOUPON_CODE, "");
                            xml.WriteElementString(fieldnameTAXRATE, SiteBasePage.CalculateTaxRate(orderItem.OrderId, Item.FullPrice).ToString());
                            xml.WriteElementString(fieldnamePAIDPRICE, (sku.InitialPrice * Item.Quantity).ToString("N2"));
                            if (count == 1)
                            {
                                if (orderCouponInfo.DiscountCode.Length > 0)
                                {
                                    xml.WriteElementString(fieldnameDISCOUNT, orderCouponInfo.DiscountAmount.ToString("n2"));
                                    xml.WriteElementString(fieldnameCOUPON_CODE, orderCouponInfo.DiscountCode);
                                }
                                xml.WriteElementString(fieldnameSHIPPING, orderItem.ShippingCost.ToString("N2"));
                                xml.WriteElementString("PAID_SHIPPING_PROD01", orderItem.ShippingCost.ToString("N2"));
                                xml.WriteElementString("PAID_TAX_PROD01", Math.Round(orderItem.Tax, 2).ToString("N2"));
                            }
                            count++;
                        }

                    }
                     
                    //if (orderCouponInfo.DiscountCode.Length > 0)
                    //{
                    //    string counter = zeropad(count.ToString(), 2);
                    //    fieldnamePRODUCT = "PRODUCT" + counter;
                    //    fieldnameQUANTITY = "QUANTITY" + counter;
                    //    fieldnamePRICE = "PRICE" + counter;
                    //    fieldnameDISCOUNT = "DISCOUNT" + counter;
                    //    fieldnameCOUPON_CODE = "COUPON_CODE" + counter;
                    //    //fieldnamePAIDPRICE = "PAID_PRICE_PROD" + counter;
                    //    //fieldnameTAXRATE = "TAX_RATE" + counter;
                    //    //fieldnameSHIPPING = "SHIPPING" + counter;
                    //    xml.WriteElementString(fieldnamePRODUCT, orderCouponInfo.DiscountCode);
                    //    xml.WriteElementString(fieldnameQUANTITY, "1");
                    //    xml.WriteElementString(fieldnamePRICE, "0");
                    //    xml.WriteElementString(fieldnameDISCOUNT, orderCouponInfo.DiscountAmount.ToString("n2"));
                    //    xml.WriteElementString(fieldnameCOUPON_CODE, orderCouponInfo.DiscountCode);
                    //    //xml.WriteElementString(fieldnameTAXRATE, "0");
                    //    //xml.WriteElementString(fieldnamePAIDPRICE, "0");
                    //    //if (count == 1)
                    //    //{
                    //    //    //xml.WriteElementString(fieldnameSHIPPING, orderItem.ShippingCost.ToString("N2"));
                    //    //    xml.WriteElementString("PAID_SHIPPING_PROD01", orderItem.ShippingCost.ToString("N2"));
                    //    //    xml.WriteElementString("PAID_TAX_PROD01", Math.Round(orderItem.Tax, 2).ToString("N2"));
                    //    //}
                    //    count++;
                    //}
                    xml.WriteEndElement();
                    xml.WriteStartElement("Settings");
                    xml.WriteElementString("MATCH_FIRST_NAME", "");
                    xml.WriteElementString("MATCH_LAST_NAME", "");
                    xml.WriteElementString("MATCH_ADDRESS", "");
                    xml.WriteElementString("MATCH_ADDRESS_2", "");
                    xml.WriteElementString("MATCH_CITY", "");
                    xml.WriteElementString("MATCH_STATE", "");
                    xml.WriteElementString("MATCH_ZIP", "");
                    xml.WriteElementString("MATCH_PHONE", "");
                    xml.WriteElementString("MATCH_EMAIL", "");
                    xml.WriteElementString("MATCH_CLIENT", "");
                    xml.WriteElementString("MATCH_CAMPAIGN", "");
                    xml.WriteElementString("API_LAYOUT_VERSION", "2");
                    xml.WriteElementString("TAX_CALCULATION_METHOD", "ITEM");
                    xml.WriteEndElement();
                    xml.WriteEndElement();
                    strXml = str.ToString();
                }
            }
            return strXml;
        }
        public static string HttpPost(string uri, string parameters, string login, string pass)
        {
            // parameters: name1=value1&name2=value2	
            WebRequest webRequest = WebRequest.Create(uri);
            webRequest.Credentials = new NetworkCredential(login, pass);
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.Method = "POST";
            byte[] bytes = Encoding.ASCII.GetBytes(parameters);
            Stream os = null;
            try
            { // send the Post
                webRequest.ContentLength = bytes.Length;   //Count bytes to send
                os = webRequest.GetRequestStream();
                os.Write(bytes, 0, bytes.Length);         //Send it
            }
            catch (WebException ex)
            {
                Console.WriteLine("HttpPost: request error" + ex.Message);
            }
            finally
            {
                if (os != null)
                {
                    os.Close();
                }
            }

            try
            { // get the response
                WebResponse webResponse = webRequest.GetResponse();
                if (webResponse == null)
                { return null; }
                StreamReader sr = new StreamReader(webResponse.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                Console.WriteLine("HttpPost: Response error" + ex.Message);
            }
            return null;
        }
        public bool PostOrder(int orderId)
        {
            bool orderSubmitted = false;
            string resultCode = "";
            string orderID_OLCC = "";
            string customerID_OLCC = "";
            string errorDetail = "";
            try
            {
                //Order orderItem = new OrderManager().GetBatchProcessOrders(orderId);
                Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);
                string req = new MVISOrderLogix().GetRequest(orderItem);

                string Parameters = "user=" + config.Attributes["login"].Value + "&pwd=" + config.Attributes["password"].Value + "&token=" + config.Attributes["MVISTOKEN"].Value + "&inXMLDoc=" + req;
                string res = HttpPost(config.Attributes["transactionUrl"].Value, Parameters, config.Attributes["logincred"].Value, config.Attributes["passwordcred"].Value);
                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
                orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(CommonHelper.Encrypt(req)));
                orderAttributes.Add("Response", new CSBusiness.Attributes.AttributeValue(res));

                if (res == null)
                {
                    res = "Response was null";
                    orderSubmitted = false;
                }
                else if (res.ToLower().Contains("httpposterror"))
                {
                    orderSubmitted = false;
                }
                else
                {
                    resultCode = getfromto(res, "<RESULT_CODE>", "</RESULT_CODE>");
                    if (!resultCode.ToUpper().Equals("SUCCESS"))
                    {
                        orderSubmitted = false;
                    }
                    else
                    {
                        orderID_OLCC = getfromto(res, "<ORDER_ID>", "</ORDER_ID>");
                        customerID_OLCC = getfromto(res, "<CUSTOMER_ID>", "</CUSTOMER_ID>");
                        errorDetail = getfromto(res, "<ERROR_DETAIL>", "</ERROR_DETAIL>");
                        if (orderID_OLCC.ToUpper().Equals("") && customerID_OLCC.ToUpper().Equals("") && !errorDetail.ToUpper().Contains("DUPLICATE"))
                        {
                            orderSubmitted = false;
                        }
                        else
                        {
                            orderSubmitted = true;
                        }

                        if (errorDetail.ToUpper().Contains("DUPLICATE"))
                        {
                            orderID_OLCC = "0";
                        }
                    }
                }

                if (orderSubmitted == true)
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
                    MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 2, res, Convert.ToInt32(orderID_OLCC));
                }
                else
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                    OrderHelper.SendOrderFailedEmail(orderId, "custom", res);
                    MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 5, res, 0);
                }
            }
            catch (Exception ex)
            {
                string errormessage = ex.InnerException + " StackTrace:: " + ex.StackTrace;
                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderId, 5);
                orderSubmitted = false;
                OrderHelper.SendOrderFailedEmail(orderId, "custom", errormessage);
                MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 5, errormessage, 0);
            }
            return orderSubmitted;
        }
        public string GetSkuCode(int skuId, int countryId)
        {
            Sku st = new SkuManager().GetSkuByID(skuId);
            st.LoadAttributeValues();
            if (countryId == 46)
            {
                if (st.GetAttributeValue<string>("skucodeca", string.Empty) != string.Empty)
                {
                    return st.GetAttributeValue<string>("skucodeca", string.Empty);
                }
                else
                {
                    return st.SkuCode;
                }
            }
            else
            {
                return st.SkuCode;
            }
            //return "";
        }

        public string GetSkuCode(int skuId, int countryId, string versionName)
        {
            Sku st = new SkuManager().GetSkuByID(skuId);
            st.LoadAttributeValues();
            bool isVersionE2 = versionName.ToUpper().Contains("E2") || versionName.ToUpper().Contains("GET");
            if (!isVersionE2)
            {
                if (countryId == 46)
                {
                    if (st.GetAttributeValue<string>("skucodeca", string.Empty) != string.Empty)
                    {
                        return st.GetAttributeValue<string>("skucodeca", string.Empty);
                    }
                    else
                    {
                        return st.SkuCode;
                    }
                }
                else
                {
                    return st.SkuCode;
                }
            }
            else
            {
                if (countryId == 46)
                {
                    if (st.GetAttributeValue<string>("E2_SKUCODECA", string.Empty) != string.Empty)
                    {
                        return st.GetAttributeValue<string>("E2_SKUCODECA", string.Empty);
                    }
                    else if (st.GetAttributeValue<string>("skucodeca", string.Empty) != string.Empty)
                    {
                        return st.GetAttributeValue<string>("skucodeca", string.Empty);
                    }
                    else
                    {
                        return st.SkuCode;
                    }
                }
                else
                {
                    if (st.GetAttributeValue<string>("E2_SKUCODE", string.Empty) != string.Empty)
                    {
                        return st.GetAttributeValue<string>("E2_SKUCODE", string.Empty);
                    }
                    else
                    {
                        return st.SkuCode;
                    }
                    
                }
            }
            
            //return "";
        }

        private string GetCCType(string CreditCardType)
        {
            string CreditCardTypeAbb = "";
            if (CreditCardType.ToLower().Equals("visa"))
            {
                CreditCardTypeAbb = "V";
            }
            else if (CreditCardType.ToLower().Equals("mastercard"))
            {
                CreditCardTypeAbb = "MC";
            }
            else if (CreditCardType.ToLower().Equals("discover"))
            {
                CreditCardTypeAbb = "D";
            }
            else if (CreditCardType.ToLower().Equals("americanexpress") || CreditCardType.ToLower().Equals("american express"))
            {
                CreditCardTypeAbb = "A";
            }
            return CreditCardTypeAbb;
        }
        public string GetShipMethod(Order orderItem)
        {
            string ShipMethod = "fedex";

            return ShipMethod;
        }
        private string getfromto(string s22, string sa22, string sb22)
        {
            string s;
            string sa;
            string sb;

            s = s22.ToLower();
            sa = sa22.ToLower();
            sb = sb22.ToLower();


            string s1 = s;
            s1 = s1.Replace(sa, ((char)(200)).ToString());
            s1 = s1.Replace(sb, ((char)(201)).ToString());

            bool b = false;
            bool c = false;
            string s2 = "";
            for (int i = 0; i < s1.Length; i++)
            {
                if (c == false)
                {
                    if (s1[i].ToString() == ((char)(200)).ToString()) { b = true; c = true; }
                }
                if (s1[i].ToString() == ((char)(201)).ToString()) { b = false; }

                if (b == true)
                {
                    if ((s1[i].ToString() != ((char)(200)).ToString()) && (s1[i].ToString() != ((char)(201)).ToString()))
                    {
                        s2 += s1[i];
                    }
                }
            }

            s2 = s2.Replace("\r", "").Replace("\n", "").Trim();
            return s2;

        }
        public string zeropad(string s, int i)
        {
            string s1 = s;
            while (s1.Length < i)
            {
                s1 = "0" + s1;
            }
            return s1;
        }
        private XmlNode GetConfig()
        {
            return OrderHelper.GetDefaultFulFillmentHouseConfig();
        }
    }
}