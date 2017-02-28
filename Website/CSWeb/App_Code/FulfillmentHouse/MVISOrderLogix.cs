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
            string DNIS_SNAPCLEAN = config.Attributes["DNIS_SNAPCLEAN"].Value.ToUpper();
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
                    xml.WriteStartElement("OrderImport");
                    xml.WriteStartElement("Order");
                    xml.WriteElementString("CUSTOMER_NUMBER", CustomerNumber); // Store Billing Address ID as Customer Number
                    xml.WriteElementString("BILL_COMPANY", "");
                    xml.WriteElementString("BILL_FIRST_NAME", orderItem.CustomerInfo.BillingAddress.FirstName);
                    xml.WriteElementString("BILL_LAST_NAME", orderItem.CustomerInfo.BillingAddress.LastName);
                    xml.WriteElementString("BILL_ADDRESS1", orderItem.CustomerInfo.BillingAddress.Address1);
                    xml.WriteElementString("BILL_ADDRESS2", orderItem.CustomerInfo.BillingAddress.Address2);
                    xml.WriteElementString("BILL_CITY", orderItem.CustomerInfo.BillingAddress.City);
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
                    xml.WriteElementString("SHIP_TO_FIRST_NAME", orderItem.CustomerInfo.ShippingAddress.FirstName);
                    xml.WriteElementString("SHIP_TO_LAST_NAME", orderItem.CustomerInfo.ShippingAddress.LastName);
                    xml.WriteElementString("SHIP_TO_ADDRESS1", orderItem.CustomerInfo.ShippingAddress.Address1);
                    xml.WriteElementString("SHIP_TO_ADDRESS2", orderItem.CustomerInfo.ShippingAddress.Address2);
                    xml.WriteElementString("SHIP_TO_CITY", orderItem.CustomerInfo.ShippingAddress.City);
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
                    // xml.WriteElementString("KEY_CODE", "");
                    xml.WriteElementString("EMP_NUMBER", EmpNumber);

                    xml.WriteElementString("PAYMENT_TYPE", PaymentType);  // AUTH or SALE or Blank
                    xml.WriteElementString("AMOUNT_ALREADY_PAID", "");
                    xml.WriteElementString("MERCHANT_TRANSACTION_ID", "");
                    xml.WriteElementString("PAYMENT_METHOD", PaymentMethod); // "CC" for credit card or "CK" for check/check by phone

                    xml.WriteElementString("CC_TYPE", GetCCType(orderItem.CreditInfo.CreditCardName));
                    xml.WriteElementString("CC_NUMBER", orderItem.CreditInfo.CreditCardNumber);
                    xml.WriteElementString("EXP_DATE", orderItem.CreditInfo.CreditCardExpired.ToString("MM/yy"));
                    xml.WriteElementString("CVV_CODE", orderItem.CreditInfo.CreditCardCSC);

                    xml.WriteElementString("SHIPPING_METHOD", GetShipMethod(orderItem));

                    // We have both Trial as well as One Pay “In the case set Use prices and use shipping to "N."
                    string useShipping = config.Attributes["useShipping"].Value.ToUpper();
                    string usePrices = config.Attributes["usePrices"].Value.ToUpper();

                    xml.WriteElementString("USE_SHIPPING", useShipping);
                    xml.WriteElementString("SHIPPING", Math.Round(orderItem.ShippingCost + orderItem.AdditionalShippingCharge, 2).ToString("N2"));
                    xml.WriteElementString("ORDER_STATE_SALES_TAX", Math.Round(orderItem.Tax, 2).ToString("N2"));
                    xml.WriteElementString("USE_PRICES", usePrices);

                    int count = 1;
                    SkuManager skuManager = new SkuManager();
                    string fieldnamePRODUCT = "PRODUCT";
                    // string fieldnameDESCRIPTION = "DESCRIPTION" + count.ToString();
                    string fieldnameQUANTITY = "QUANTITY";
                    string fieldnamePRICE = "PRICE";
                    string fieldnameDISCOUNT = "DISCOUNT";
                    string fieldnameCOUPON_CODE = "COUPON_CODE";
                    foreach (Sku Item in orderItem.SkuItems)
                    {
                        Sku sku = skuManager.GetSkuByID(Item.SkuId);
                        string counter = zeropad(count.ToString(), 2);
                        fieldnamePRODUCT = "PRODUCT" + counter;
                        // string fieldnameDESCRIPTION = "DESCRIPTION" + count.ToString();
                        fieldnameQUANTITY = "QUANTITY" + counter;
                        fieldnamePRICE = "PRICE" + counter;
                        fieldnameDISCOUNT = "DISCOUNT" + counter;
                        fieldnameCOUPON_CODE = "COUPON_CODE" + counter;
                        xml.WriteElementString(fieldnamePRODUCT, sku.SkuCode);
                        // xml.WriteElementString(fieldnameDESCRIPTION, _drOrderSKU["SKUCode"].ToString());
                        xml.WriteElementString(fieldnameQUANTITY, Item.Quantity.ToString());
                        xml.WriteElementString(fieldnamePRICE, sku.InitialPrice.ToString("N2"));
                        xml.WriteElementString(fieldnameDISCOUNT, "");
                        xml.WriteElementString(fieldnameCOUPON_CODE, "");
                        count++;
                    }
                    xml.WriteEndElement();
                    xml.WriteEndElement();
                    strXml = str.ToString();
                }
            }
            return strXml;
        }
        public bool PostOrder(int orderId)
        {
            bool orderSubmitted = false;
            string resultCode = "";
            string orderID_OLCC = "0";
            string customerID_OLCC = "";
            string errorDetail = "";
            try
            {
                Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);
                string req = new MVISOrderLogix().GetRequest(orderItem);

                string Parameters = "user=" + config.Attributes["login"].Value + "&pwd=" + config.Attributes["password"].Value + "&token=" + config.Attributes["MVISTOKEN"].Value + "&inXMLDoc=" + req;
                string res = CommonHelper.HttpPost(config.Attributes["transactionUrl"].Value, Parameters);
                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
                orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(req));
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
                        if (orderID_OLCC.ToUpper().Equals("") && customerID_OLCC.ToUpper().Equals(""))
                        {
                            orderSubmitted = false;
                        }
                        else
                        {
                            orderSubmitted = true;
                        }
                    }
                }
                orderAttributes.Add("MVISOrderID", new CSBusiness.Attributes.AttributeValue(orderID_OLCC));

                if (orderSubmitted == true)
                {   
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
                    // MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 2, res, Convert.ToInt32(orderID_OLCC));
                }
                else
                {                    
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                    OrderHelper.SendOrderFailedEmail(orderId, "custom", res);
                    // MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 5, res, 0);
                }
            }
            catch (Exception ex)
            {
                string errormessage = ex.InnerException + " StackTrace:: " + ex.StackTrace;
                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderId, 5);
                orderSubmitted = false;
                OrderHelper.SendOrderFailedEmail(orderId, "custom", errormessage);
                // MVISOrderLogixDAL.InsertMVISOrderLogixLog(orderId, 5, errormessage, 0);
            }
            return orderSubmitted;
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
            string ShipMethod = "REG";
            //SkuManager skuManager = new SkuManager();
            //foreach (Sku Item in orderItem.SkuItems)
            //{
            //    Sku sku = skuManager.GetSkuByID(Item.SkuId);
            //    if (sku.CategoryId == 13)
            //    {
            //        sku.LoadAttributeValues();
            //        if (sku.AttributeValues.ContainsKey("mvis_shipmethod"))
            //        {
            //            ShipMethod = sku.AttributeValues["mvis_shipmethod"].Value;
            //        }
            //        break;
            //    }
            //}
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