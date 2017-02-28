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
using CSBusiness.Preference;
using CSBusiness.FulfillmentHouse;
using System.Xml.Linq;
using CSBusiness.Attributes;
using CSWeb.FulfillmentHouse;
using CSWeb.AvaTax;
using System.Text;
using CSWebBase;
using System.Xml.Serialization;

namespace CSWeb
{
    public class Avalara
    {
        public static XmlNode GetTax_AvalaraConfig()
        {
            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();
            sitePrefCache.LoadAttributeValues();
            string TaxAvalaraSetting = sitePrefCache.AttributeValues["taxavalarasetting"].Value;
            if (!TaxAvalaraSetting.Equals(""))
            {
                XmlDocument doc = new XmlDocument();
                List<FulfillmentHouseProviderSetting> allSettings = FulfillmentHouseProviderManger.GetAllProvidersFromDB(true);
                doc.LoadXml(TaxAvalaraSetting);
                return doc.FirstChild;
            }
            return null;
        }

        public static int getTimeOutTax()
        {
            int timeout = 10000;
            try
            {
                // Read TimeOut value from Avalara Attributes in SitePref for Alavara Tax and Address Verification Request
                XmlNode config = null;
                config = GetTax_AvalaraConfig();
                timeout = Convert.ToInt32(config.Attributes["TimeOutTax"].Value);
            }
            catch
            {
                timeout = 10000;
            }

            return timeout;
        }
        public int getTimeOutAddressVerify()
        {
            int timeout = 10000;
            try
            {
                // Read TimeOut value from Avalara Attributes in SitePref for Alavara Tax and Address Verification Request
                XmlNode config = null;
                config = GetTax_AvalaraConfig();
                timeout = Convert.ToInt32(config.Attributes["TimeOutAddressVerify"].Value);
            }
            catch
            {
                timeout = 10000;
            }
            return timeout;
        }
        public bool ValidateAddress_Avalara(CSWeb.AvaTax.Address address)
        {
            bool IsValidAddress = false;
            XmlNode config = null;
            config = GetTax_AvalaraConfig();
            string accountNumber = config.Attributes["accountNumber"].Value;
            string licenseKey = config.Attributes["licenseKey"].Value;
            string serviceURL = config.Attributes["serviceURL"].Value;
            AddressSvc AddressSvc1 = new AddressSvc(accountNumber, licenseKey, serviceURL);

            // Check for Address Line1 and Zipcode Only
            address.Line2 = "";
            address.City = "";
            address.Region = "";
            int timeout = getTimeOutAddressVerify(); // This is for Request TimeOut
            ValidateResult result = AddressSvc1.Validate(address, timeout);
            if (result.ResultCode.Equals(SeverityLevel.Success) || result.ResultCode.Equals(SeverityLevel.Warning))
            {
                IsValidAddress = true;
            }
            else
            {
                IsValidAddress = false;
            }
            return IsValidAddress;
        }

        public static decimal GetTax(int orderId, bool UpdateOrderTax, bool CartTax, ClientCartContext clientData)
        {
            decimal taxAmount = 0M;
            try
            {
                XmlNode config = null;
                config = GetTax_AvalaraConfig();
                string accountNumber = config.Attributes["accountNumber"].Value;
                string licenseKey = config.Attributes["licenseKey"].Value;
                string serviceURL = config.Attributes["serviceURL"].Value;
                
                TaxSvc taxSvc = new TaxSvc(accountNumber, licenseKey, serviceURL);

                GetTaxRequest getTaxRequest = GetTax_Request(orderId, UpdateOrderTax, CartTax, clientData);
                XmlSerializerNamespaces namesp = new XmlSerializerNamespaces();
                namesp.Add(string.Empty, string.Empty);
                XmlWriterSettings settings = new XmlWriterSettings();
                settings.OmitXmlDeclaration = true;
                XmlSerializer x1 = new XmlSerializer(getTaxRequest.GetType());
                StringBuilder sb = new StringBuilder();
                x1.Serialize(XmlTextWriter.Create(sb, settings), getTaxRequest, namesp);
                string req = sb.ToString();
                int timeout = getTimeOutTax(); // This is for Request TimeOut
                GetTaxResult getTaxResult = taxSvc.GetTax(getTaxRequest, timeout);

                XmlSerializer x2 = new XmlSerializer(getTaxResult.GetType());
                StringBuilder sb2 = new StringBuilder();
                x2.Serialize(XmlTextWriter.Create(sb2, settings), getTaxResult, namesp);
                string res = sb2.ToString();

                if (getTaxResult.ResultCode.Equals(SeverityLevel.Success))
                {
                    taxAmount = getTaxResult.TotalTax;
                }

                if (UpdateOrderTax && orderId > 0)
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderTax(orderId, taxAmount);
                    Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
                    orderAttributes.Add("TaxRequest", new CSBusiness.Attributes.AttributeValue(req));
                    orderAttributes.Add("TaxResponse", new CSBusiness.Attributes.AttributeValue(res));
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, null);
                }
            }
            catch
            {
            }
            return taxAmount;
        }
                 
        public static GetTaxRequest GetTax_Request(int orderId, bool UpdateOrderTax, bool CartTax, ClientCartContext clientData)
        {
            string ShippingStateProvinceAbbreviation = "";
            // string BillingStateProvinceAbbreviation = "";
            List<StateProvince> states = StateManager.GetAllStates(0);

            XmlNode config = null;
            config = GetTax_AvalaraConfig();

            GetTaxRequest getTaxRequest = new GetTaxRequest();
            List<Sku> OrderSkuItems = null;

            CSWeb.AvaTax.Address address1 = new CSWeb.AvaTax.Address();
            address1.AddressCode = "01";
            address1.Line1 = config.Attributes["address1Line1"].Value;
            address1.City = config.Attributes["City"].Value;
            address1.Region = config.Attributes["Region"].Value;

            CSWeb.AvaTax.Address address2 = new CSWeb.AvaTax.Address();
            address2.AddressCode = "02";

            if (orderId > 0 && CartTax == false)
            {
                CSBusiness.OrderManagement.Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);
                getTaxRequest.CustomerCode = orderItem.CustomerId.ToString(); // "ABC4335";
                //getTaxRequest.CompanyCode = config.Attributes["companyCode"].Value;
                getTaxRequest.DocDate = orderItem.CreatedDate.ToString("yyyy-MM-dd"); // "2014-07-23";
                address2.Line1 = orderItem.CustomerInfo.ShippingAddress.Address1; // "1999 Avenue of Stars"; // "118 N Clark St";
                address2.Line2 = orderItem.CustomerInfo.ShippingAddress.Address2; // "Suite 1830"; // "Suite 100";
                // address2.Line3 = "ATTN Accounts Payable";
                address2.City = orderItem.CustomerInfo.ShippingAddress.City; // "Los Angeles"; // "Chicago";

                StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
                if (itemShippingStateProvince != null)
                {
                    ShippingStateProvinceAbbreviation = itemShippingStateProvince.Abbreviation.Trim();
                }
                //StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
                //if (itemBillingStateProvince != null)
                //{
                //    BillingStateProvinceAbbreviation = itemBillingStateProvince.Abbreviation.Trim();
                //}
                address2.Region = ShippingStateProvinceAbbreviation; // "IL";
                address2.Country = orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim(); // "US";
                address2.PostalCode = orderItem.CustomerInfo.ShippingAddress.ZipPostalCode; //  "90067"; //  "60602";
                OrderSkuItems = orderItem.SkuItems;
            }
            else if (CartTax)
            {
                StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(clientData.CustomerInfo.ShippingAddress.StateProvinceId));
                if (itemShippingStateProvince != null)
                {
                    ShippingStateProvinceAbbreviation = itemShippingStateProvince.Abbreviation.Trim();
                }
                getTaxRequest.CustomerCode = "1"; // "ABC4335";
                //getTaxRequest.CompanyCode = config.Attributes["companyCode"].Value;
                getTaxRequest.DocDate = DateTime.Now.ToString("yyyy-MM-dd"); // "2014-07-23";
                address2.Line1 = clientData.CustomerInfo.ShippingAddress.Address1; // "1999 Avenue of Stars"; // "118 N Clark St";
                address2.Line2 = clientData.CustomerInfo.ShippingAddress.Address2; // "Suite 1830"; // "Suite 100";
                // address2.Line3 = "ATTN Accounts Payable";
                address2.City = clientData.CustomerInfo.ShippingAddress.City; // "Los Angeles"; // "Chicago";
                address2.Region = ShippingStateProvinceAbbreviation; // "IL";
                List<Country> countries = CountryManager.GetActiveCountry();
                Country ShipCountry = countries.First(x => x.CountryId == clientData.CustomerInfo.ShippingAddress.CountryId);
                // address2.Country = "US"; // clientData.CustomerInfo.ShippingAddress.CountryCode.Trim(); // "US";
                if (itemShippingStateProvince != null)
                {
                    address2.Country = ShipCountry.Code.Trim();
                }
                else
                {
                    address2.Country = "US";
                }
                address2.PostalCode = clientData.CustomerInfo.ShippingAddress.ZipPostalCode; //  "90067"; //  "60602"; 
                OrderSkuItems = clientData.CartInfo.CartItems;
            }

            CSWeb.AvaTax.Address[] addresses = { address1, address2 };
            getTaxRequest.Addresses = addresses;
            CSWeb.AvaTax.Line[] lines = new CSWeb.AvaTax.Line[OrderSkuItems.Count]; // orderItem.SkuItems.Count];             
            int LineNo = 1;
            foreach (Sku Item in OrderSkuItems) // orderItem.SkuItems)
            {
                Item.LoadAttributeValues();
                CSWeb.AvaTax.Line line1 = new CSWeb.AvaTax.Line();
                if (LineNo < 10)
                {
                    line1.LineNo = "0" + LineNo.ToString();
                }
                else
                {
                    line1.LineNo = LineNo.ToString();
                }
                line1.ItemCode = Item.SkuCode;
                line1.Qty = Item.Quantity;
                decimal SKUCost = Item.FullPrice * Item.Quantity; // 249.95M;

                //if (Item.AttributeValues.ContainsKey("isrushshipsku"))
                //{
                //    if (Item.AttributeValues["isrushshipsku"].Value.ToString().Equals("1"))
                //    {                        
                //        if (Item.AttributeValues.ContainsKey("shippingcost_display"))
                //        {
                //            SKUCost = Convert.ToDecimal(Item.AttributeValues["shippingcost_display"].Value.ToString().Trim());                             
                //        }
                //    }
                //}

                line1.Amount = SKUCost;
                line1.OriginCode = "01";
                line1.DestinationCode = "02";
                lines[LineNo - 1] = line1; //  Add it Array of Lines                                
                LineNo = LineNo + 1;
            }
            getTaxRequest.Lines = lines;
            getTaxRequest.CompanyCode = config.Attributes["companyCode"].Value;

            return getTaxRequest;
        }

    }
}
 
