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
using System.Text;
using CSWeb.InnotracWS;
using CSWebBase;
using System.Xml.Serialization;
using CSBusiness.Cache;

namespace CSWeb.FulfillmentHouse
{
    public class Innotrac
    {
        public XmlNode config = null;
        public Innotrac()
        {
            config = GetConfig();
        }

        private XmlNode GetConfig()
        {
            return OrderHelper.GetDefaultFulFillmentHouseConfig();
        }

        //private decimal GetSkuTaxCost(CSBusiness.CustomerManagement.Address shippingAddress, Sku sku)
        //{
        //    decimal taxToReturn = 0;
        //    SitePreference list = CSFactory.GetCartPrefrence();
        //    decimal taxableAmount = sku.FullPrice;

        //    //If this returns a value, it means country has states and we need to 
        //    //find tax for states
        //    if (shippingAddress.CountryId > 0)
        //    {
        //        //CodeReview By Sri on 09/15: Need to change TaxRegionCache Object
        //        TaxRegion countryRegion = null, stateRegion = null, zipRegion = null;

        //        //Comments on 11/2: pulling data from Cache object
        //        TaxregionCache cache = new TaxregionCache(HttpContext.Current);
        //        List<TaxRegion> taxRegions = (List<TaxRegion>)cache.Value;

        //        countryRegion = taxRegions.FirstOrDefault(t => t.CountryId == shippingAddress.CountryId && t.StateId == 0 && string.IsNullOrEmpty(t.ZipCode));
        //        stateRegion = taxRegions.FirstOrDefault(t => t.CountryId == shippingAddress.CountryId && t.StateId == shippingAddress.StateProvinceId && string.IsNullOrEmpty(t.ZipCode));
        //        zipRegion = taxRegions.FirstOrDefault(t => t.CountryId == shippingAddress.CountryId && t.StateId == shippingAddress.StateProvinceId
        //            && t.ZipCode == shippingAddress.ZipPostalCode);

        //        //Tax regions are always returned by country
        //        //taxRegions = CSFactory.GetTaxByCountry(cart.ShippingAddress.CountryId);
        //        if (zipRegion != null)
        //        {
        //            taxToReturn = taxableAmount * zipRegion.Value / 100;
        //        }
        //        else if (stateRegion != null)
        //        {
        //            taxToReturn = taxableAmount * stateRegion.Value / 100;
        //        }
        //        else if (countryRegion != null)
        //        {
        //            taxToReturn = taxableAmount * countryRegion.Value / 100;
        //        }
        //    }
        //    return Math.Round(taxToReturn, 2);

        //}
        //private bool IsContinental(string state)
        //{
        //    if (stateCode.Contains("AK")
        //        || stateCode.Contains("HI")
        //        || stateCode.Contains("PR")
        //        || stateCode.Contains("GU"))
        //        return false;
        //    if (state.Contains("Alaska")
        //        || state.Contains("Hawaii")
        //        || state.Contains("Puerto Rico")
        //        || state.Contains("Guam"))
        //        return false;
        //    return true;
        //}
        private Sku GetShippingSku(Order orderItem)
        {
            SkuManager skuManager = new SkuManager();
            foreach (Sku sku in orderItem.SkuItems)
            {
                if (skuManager.GetSkuByID(sku.SkuId).CategoryId == 14)
                {
                    //if (!IsContinental(orderItem.CustomerInfo.ShippingAddress.StateProvinceName))
                    //    sku.SkuCode = sku.SkuCode + "1";
                    return sku;
                }
            }
            return null;
        }
        private int GetTransmissionBatchID()
        {
            int Batchid = 0; // InnotracDAL.GetInnoTracLogBatchID() + 1; // Or Add DateTimeStamp with each sequence
            return Batchid;
        }

        private string GetContinuityFlag(Order orderItem)
        {
            //SkuManager skuManager = new SkuManager();
            //foreach (Sku sku in orderItem.SkuItems)
            //{
            //    if (skuManager.GetSkuByID(sku.SkuId).CategoryId == 13)
            //        return "Y";
            //}
            return "N";
        }

        private string GetPaymentPlan(Order orderItem)
        {
            string PaymentPlan = "";
            //foreach (Sku Item in orderItem.SkuItems)
            //{
            //    Item.LoadAttributeValues();
            //    if (Item.AttributeValues.ContainsKey("innotrac_paymentplan") && !Item.AttributeValues["innotrac_paymentplan"].Value.Equals(""))
            //    {
            //        PaymentPlan = Item.AttributeValues["innotrac_paymentplan"].Value.ToString().ToUpper();
            //    }
            //}
            return PaymentPlan;
        }

        public PostOrderBatchRequest GetRequest(Order orderItem)
        {
            String strXml = String.Empty;
            orderItem.LoadAttributeValues();

            string ShippingStateProvinceAbbreviation = "";
            string BillingStateProvinceAbbreviation = "";
            List<StateProvince> states = StateManager.GetAllStates(0);
            StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
            if (itemShippingStateProvince != null)
            {
                ShippingStateProvinceAbbreviation = itemShippingStateProvince.Abbreviation.Trim();
            }
            StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
            if (itemBillingStateProvince != null)
            {
                BillingStateProvinceAbbreviation = itemBillingStateProvince.Abbreviation.Trim();
            }

            Sku ShippingSku = GetShippingSku(orderItem);
            //string ShipCodeService = GetShippingSku(orderItem).SkuCode;

            PostOrderBatchRequest PostOrderBatchRequest1 = new PostOrderBatchRequest();
            InnotracWS.WSAuthorization WSAuthorization1 = new InnotracWS.WSAuthorization();
            WSAuthorization1.Username = config.Attributes["Username"].Value;
            WSAuthorization1.Password = config.Attributes["Password"].Value;
            PostOrderBatchRequest1.WSAuthorization = WSAuthorization1;

            int TransmissionBatchID = 0; // GetTransmissionBatchID();

            PostOrderBatchRequestOrderBatch OrderBatch1 = new PostOrderBatchRequestOrderBatch();
            OrderBatch1.TransmissionBatchID = Convert.ToDouble(TransmissionBatchID);
            OrderBatch1.TransmissionSource = config.Attributes["TransmissionSource"].Value;
            OrderBatch1.TransmissionDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd H:mm:ss"));
            OrderBatch1.Telemarketer = config.Attributes["Telemarketer"].Value;
            OrderBatch1.RerunCount = Convert.ToInt32(config.Attributes["RerunCount"].Value);
            OrderBatch1.NumberOfOrders = Convert.ToInt32(config.Attributes["NumberOfOrders"].Value);
            OrderBatch1.CustomerInfoOnly = config.Attributes["CustomerInfoOnly"].Value;

            PostOrderBatchRequestOrderBatchCustomer Customer = new PostOrderBatchRequestOrderBatchCustomer();
            Customer.SerialID = config.Attributes["SerialID"].Value;
            Customer.Project = Convert.ToInt32(config.Attributes["Project"].Value);
            Customer.CustomerNo = Convert.ToInt32(config.Attributes["CustomerNo"].Value);
            Customer.CustomerNoSpecified = true;
            Customer.ClientCustomer = Convert.ToInt32(config.Attributes["ClientCustomer"].Value);
            Customer.ClientCustomerSpecified = true;
            Customer.FirstName = orderItem.CustomerInfo.BillingAddress.FirstName;
            Customer.LastName = orderItem.CustomerInfo.BillingAddress.LastName;
            Customer.Address1 = orderItem.CustomerInfo.BillingAddress.Address1;
            Customer.Address2 = orderItem.CustomerInfo.BillingAddress.Address2;
            Customer.City = orderItem.CustomerInfo.BillingAddress.City;

            Customer.State = BillingStateProvinceAbbreviation; //  orderItem.CustomerInfo.BillingAddress.StateProvinceName;
            Customer.Zip = orderItem.CustomerInfo.BillingAddress.ZipPostalCode;
            if (orderItem.CustomerInfo.BillingAddress.CountryId == 46)
            {
                Customer.Country = "CN";
            }
            else
            {
                Customer.Country = CountryManager.CountryCode(orderItem.CustomerInfo.BillingAddress.CountryId).Trim();
            }
            Customer.DayPhoneSpecified = true;
            Customer.DayPhone = Convert.ToDouble(OrderHelper.GetCleanPhoneNumber(orderItem.CustomerInfo.BillingAddress.PhoneNumber));

            PostOrderBatchRequestOrderBatchCustomerEmail CustomerEmail = new PostOrderBatchRequestOrderBatchCustomerEmail();
            CustomerEmail.EmailAddress = orderItem.Email;
            CustomerEmail.EmailFlag = config.Attributes["EmailFlag"].Value;
            Customer.Email = new PostOrderBatchRequestOrderBatchCustomerEmail[1];
            Customer.Email[0] = CustomerEmail;

            Customer.CustomerMailFlag = config.Attributes["CustomerMailFlag"].Value;
            Customer.RentNameFlag = config.Attributes["RentNameFlag"].Value;
            Customer.OrderEmailsFlag = config.Attributes["OrderEmailsFlag"].Value;
            string MarketingEmailsFlag = "N";
            //if (orderItem.AttributeValues.ContainsAttribute("sendoffers") && orderItem.AttributeValues["sendoffers"].Value != null)
            //{
            //    if (orderItem.AttributeValues["sendoffers"].Value.Equals("1"))
            //    {
            //        MarketingEmailsFlag = "Y";
            //    }
            //    else
            //    {
            //        MarketingEmailsFlag = "N";
            //    }
            //}
            Customer.MarketingEmailsFlag = MarketingEmailsFlag.ToUpper();
            Customer.Language = config.Attributes["Language"].Value;

            PostOrderBatchRequestOrderBatchCustomerOrder CustomerOrder = new PostOrderBatchRequestOrderBatchCustomerOrder();
            CustomerOrder.ServiceBeforeShip = config.Attributes["ServiceBeforeShip"].Value;
            CustomerOrder.OrderNo = Convert.ToInt32(config.Attributes["OrderNo"].Value);
            CustomerOrder.OrderNoSpecified = true;
            CustomerOrder.PurchaseOrder = config.Attributes["OrderIdPrefix"].Value + orderItem.OrderId.ToString();             
            CustomerOrder.Promotion = config.Attributes["Promotion"].Value;
                                 
            
            string Media = config.Attributes["MediaCode"].Value;
            //if (orderItem.AttributeValues.ContainsAttribute("mediacode") && orderItem.AttributeValues["mediacode"].Value != null && !orderItem.AttributeValues["mediacode"].Value.Equals(""))
            //{
            //    Media = orderItem.AttributeValues["mediacode"].Value;
            //}
            CustomerOrder.Media = Media;
            //CustomerOrder.BackEndCode = config.Attributes["BackEndCode"].Value;
            CustomerOrder.BaseContinuityOrderFlag = GetContinuityFlag(orderItem);// config.Attributes["BaseContinuityOrderFlag"].Value;
            CustomerOrder.OrderCategory = config.Attributes["OrderCategory"].Value;
            CustomerOrder.OrderDate = Convert.ToDateTime(orderItem.CreatedDate.ToString("yyyy-MM-dd H:mm:ss")); // .ToString("MM/dd/yy hh:mm:ss"));            
            // These should instead have a T separating date from time, like this: <inoc:OrderDate>2014-05-13T19:24:02</inoc:OrderDate>
            CustomerOrder.OrderReferenceNo1 = config.Attributes["OrderIdPrefix"].Value + orderItem.OrderId.ToString();
            CustomerOrder.UserId = config.Attributes["UserId"].Value;
            CustomerOrder.ShipFeeService = ShippingSku.SkuCode;// ShipFeeService; //  GetShipFeeService(orderItem);
            CustomerOrder.ShipCodeService = ShippingSku.SkuCode;// ShipCodeService; // GetShipCodeService(orderItem);
            CustomerOrder.ResidentialCommercialFlag = config.Attributes["ResidentialCommercialFlag"].Value;
            CustomerOrder.PricingCalculationMethod = config.Attributes["PricingCalculationMethod"].Value;
            CustomerOrder.ShippingCalculationMethod = config.Attributes["ShippingCalculationMethod"].Value;
            CustomerOrder.PaymentPlan = GetPaymentPlan(orderItem);
            CustomerOrder.Language = config.Attributes["Language"].Value;

            PostOrderBatchRequestOrderBatchCustomerOrderOrderShipTo OrderOrderShipTo = new PostOrderBatchRequestOrderBatchCustomerOrderOrderShipTo();
            OrderOrderShipTo.ShipToFirstName = orderItem.CustomerInfo.ShippingAddress.FirstName;
            OrderOrderShipTo.ShipToLastName = orderItem.CustomerInfo.ShippingAddress.LastName;
            OrderOrderShipTo.ShipToAddress1 = orderItem.CustomerInfo.ShippingAddress.Address1;
            OrderOrderShipTo.ShipToAddress2 = orderItem.CustomerInfo.ShippingAddress.Address2;
            OrderOrderShipTo.ShipToCity = orderItem.CustomerInfo.ShippingAddress.City;
            OrderOrderShipTo.ShipToState = ShippingStateProvinceAbbreviation; // orderItem.CustomerInfo.ShippingAddress.StateProvinceName;
            OrderOrderShipTo.ShipToZip = orderItem.CustomerInfo.ShippingAddress.ZipPostalCode;
            if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
            {
                OrderOrderShipTo.ShipToCountry = "CN";
            }
            else
            {
                OrderOrderShipTo.ShipToCountry = CountryManager.CountryCode(orderItem.CustomerInfo.ShippingAddress.CountryId).Trim();
            }
            OrderOrderShipTo.ShipFeeService = ShippingSku.SkuCode; // GetShipFeeService(orderItem);
            OrderOrderShipTo.ShipCodeService = ShippingSku.SkuCode; // GetShipCodeService(orderItem);

            OrderOrderShipTo.OrderItems = new PostOrderBatchRequestOrderBatchCustomerOrderOrderShipToOrderItems[orderItem.SkuItems.Count];
            PostOrderBatchRequestOrderBatchCustomerOrderOrderShipToOrderItems OrderShipToOrderItems;
            int LineNo = 1;
            int arrayCounter = 0;
            decimal ItemPrice = 0;
            SkuManager skuManager = new SkuManager();
            List<Sku> SkuItems1 = new List<Sku>();            
            foreach (Sku Item in orderItem.SkuItems)
            {
                // Add BASE SKU for Sending to Innotrac
                //if (skuManager.GetSkuByID(Item.SkuId).CategoryId == 1)
                //{
                    SkuItems1.Add(Item);
                //}
            }
            // Add FREEGIFT at LAST for SEnding to Innotrac
            //foreach (Sku Item in orderItem.SkuItems)
            //{
            //    // FREEGIFT CategoryId 16
            //    if (skuManager.GetSkuByID(Item.SkuId).CategoryId == 16)
            //    {
            //        SkuItems1.Add(Item);
            //    }
            //}
            foreach (Sku Item in SkuItems1)
            {
                //if (skuManager.GetSkuByID(Item.SkuId).CategoryId == 1)
                //{
                    //ItemPricing ItemPricing1 = ItemPricingBySkuID[Item.SkuId];
                    OrderShipToOrderItems = new PostOrderBatchRequestOrderBatchCustomerOrderOrderShipToOrderItems();
                    OrderShipToOrderItems.SKU = Item.SkuCode;
                    //if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
                    //{
                    //    Item.LoadAttributeValues();
                    //    if (Item.GetAttributeValue<string>("skucode_canada", string.Empty) != string.Empty)
                    //    {
                    //        OrderShipToOrderItems.SKU = Item.GetAttributeValue<string>("skucode_canada", string.Empty);
                    //    }
                    //}
                    OrderShipToOrderItems.Quantity = Item.Quantity;
                    OrderShipToOrderItems.LineNumber = LineNo;
                    OrderShipToOrderItems.LineNumberSpecified = true;

                    PostOrderBatchRequestOrderBatchCustomerOrderOrderShipToOrderItemsItemPricing OrderItemsItemPricing = new PostOrderBatchRequestOrderBatchCustomerOrderOrderShipToOrderItemsItemPricing();
                    ItemPrice = 0;
                    ItemPrice = Item.FullPrice * Item.Quantity;
                    //Pass P for PricingCalculationMethod (M). you need to remove the ItemPricing section, since we will be calculating each of the prices for you, at the line level.
                    //OrderItemsItemPricing.ExtendedPrice = Convert.ToDecimal(ItemPrice.ToString("N2"));
                    //OrderItemsItemPricing.ExtendedPriceSpecified = true;
                    //OrderItemsItemPricing.ExtendedShipFee =(decimal)0;//ItemPricing1.SKU_Shipping_Price.ToString("N2"));
                    //OrderItemsItemPricing.ExtendedShipFeeSpecified = true;
                    //OrderItemsItemPricing.ExtendedTax = GetSkuTaxCost(orderItem.CustomerInfo.ShippingAddress, Item);// ItemPricing1.SKU_Total_Tax.ToString("N2"));
                    //OrderItemsItemPricing.ExtendedTaxSpecified = true;
                    OrderShipToOrderItems.ItemPricing = OrderItemsItemPricing;
                    OrderOrderShipTo.OrderItems[arrayCounter] = OrderShipToOrderItems;
                    LineNo++;
                    arrayCounter++;
                // }
            }
             
            // IF order contains more than one unique SKU -AND- is trying to do an install payment, flag as 'Y'
            //string InstallPaymentPlanCode = config.Attributes["InstallPaymentPlanCode"].Value.ToUpper();
            //if (LineNo > 2 && CustomerOrder.PaymentPlan.ToUpper().Equals(InstallPaymentPlanCode))
            //{
            //    CustomerOrder.ServiceBeforeShip = "Y";
            //}
            //else
            //{
                CustomerOrder.ServiceBeforeShip = config.Attributes["ServiceBeforeShip"].Value;            
            //}
            
            CustomerOrder.OrderShipTo = new PostOrderBatchRequestOrderBatchCustomerOrderOrderShipTo[1];
            CustomerOrder.OrderShipTo[0] = OrderOrderShipTo;

            PostOrderBatchRequestOrderBatchCustomerOrderPayment OrderPayment = new PostOrderBatchRequestOrderBatchCustomerOrderPayment();
            PostOrderBatchRequestOrderBatchCustomerOrderPaymentCreditCard PaymentCreditCard = new PostOrderBatchRequestOrderBatchCustomerOrderPaymentCreditCard();
            PaymentCreditCard.SequenceNo = Convert.ToInt32(config.Attributes["SequenceNo"].Value);
            PaymentCreditCard.CreditCardNumber = orderItem.CreditInfo.CreditCardNumber;
            PaymentCreditCard.ExpirationDate = orderItem.CreditInfo.CreditCardExpired.ToString("MMyy");
            if ((orderItem.CustomerInfo.BillingAddress.Address1.Equals(orderItem.CustomerInfo.ShippingAddress.Address1)) && (orderItem.CustomerInfo.BillingAddress.City.Equals(orderItem.CustomerInfo.ShippingAddress.City))
                 && (orderItem.CustomerInfo.BillingAddress.ZipPostalCode.Equals(orderItem.CustomerInfo.ShippingAddress.ZipPostalCode)))
            {
                PaymentCreditCard.CardHolderFlag = CardHolderFlag.S; // If Bill To Address = Ship To Address, then S - Otherwise M  
            }
            else
            {
                PaymentCreditCard.CardHolderFlag = CardHolderFlag.M; // If Bill To Address = Ship To Address, then S - Otherwise M  
            }
            PaymentCreditCard.CVV2Code = "";

            PostOrderBatchRequestOrderBatchCustomerOrderPaymentCreditCardBillingAddress CreditCardBillingAddress = new PostOrderBatchRequestOrderBatchCustomerOrderPaymentCreditCardBillingAddress();
            CreditCardBillingAddress.BillingFirstName = orderItem.CustomerInfo.BillingAddress.FirstName;
            CreditCardBillingAddress.BillingLastName = orderItem.CustomerInfo.BillingAddress.LastName;
            CreditCardBillingAddress.BillingAddress1 = orderItem.CustomerInfo.BillingAddress.Address1;
            CreditCardBillingAddress.BillingAddress2 = orderItem.CustomerInfo.BillingAddress.Address2;
            CreditCardBillingAddress.BillingCity = orderItem.CustomerInfo.BillingAddress.City;
            CreditCardBillingAddress.BillingState = BillingStateProvinceAbbreviation; // orderItem.CustomerInfo.BillingAddress.StateProvinceName;
            CreditCardBillingAddress.BillingZip = orderItem.CustomerInfo.BillingAddress.ZipPostalCode;
            if (orderItem.CustomerInfo.BillingAddress.CountryId == 46)
            {
                CreditCardBillingAddress.BillingCountry = "CN";
            }
            else
            {
                CreditCardBillingAddress.BillingCountry = orderItem.CustomerInfo.BillingAddress.CountryCode.Trim();
            }
            PaymentCreditCard.BillingAddress = CreditCardBillingAddress;
            OrderPayment.CreditCard = new PostOrderBatchRequestOrderBatchCustomerOrderPaymentCreditCard[1];
            OrderPayment.CreditCard[0] = PaymentCreditCard;
            OrderPayment.CurrencyCode = config.Attributes["CurrencyCode"].Value;
            CustomerOrder.Payment = OrderPayment;

            PostOrderBatchRequestOrderBatchCustomerOrderOrderSourceTotals OrderOrderSourceTotals = new PostOrderBatchRequestOrderBatchCustomerOrderOrderSourceTotals();
            decimal SubTotalFullPrice_ContinuityProducts = 0; // GetFullPriceSubTotal_ContinuitySKU(orderItem);
            OrderOrderSourceTotals.ProductTotal = Convert.ToDecimal(String.Format("{0:.00}", orderItem.FullPriceSubTotal - SubTotalFullPrice_ContinuityProducts)); // SubTotal)); // FullPriceSubTotal));
            if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
            {
                // setup the tax as a flat 10% for Canadian orders
                // it would be best if you sent the 10 percent charge as S&H as that is the way we display it in our CRM and the customer pack slip.
                OrderOrderSourceTotals.TaxTotal = Convert.ToDecimal(String.Format("{0:.00}", "0.00"));
                OrderOrderSourceTotals.ShipFeeTotal = orderItem.ShippingCost + orderItem.AdditionalShippingCharge + orderItem.FullPriceTax;
            }
            else
            {
                OrderOrderSourceTotals.TaxTotal = Convert.ToDecimal(String.Format("{0:.00}", orderItem.FullPriceTax));
                OrderOrderSourceTotals.ShipFeeTotal = orderItem.ShippingCost + orderItem.AdditionalShippingCharge;  // ShippingSku.FullPrice + orderItem.AdditionalShippingCharge;// Convert.ToDecimal(String.Format("{0:.00}", orderItem.ShippingCost));
            }
            OrderOrderSourceTotals.GiftCertificateTotalSpecified = true;
            OrderOrderSourceTotals.GiftCertificateTotal = 0;
            CustomerOrder.OrderSourceTotals = OrderOrderSourceTotals;
            CustomerOrder.ShipCompleteFlag = "";
            Customer.Order = new PostOrderBatchRequestOrderBatchCustomerOrder[1];
            Customer.Order[0] = CustomerOrder;
            OrderBatch1.Customer = new PostOrderBatchRequestOrderBatchCustomer[1];
            OrderBatch1.Customer[0] = Customer;
            PostOrderBatchRequest1.OrderBatch = OrderBatch1;
            return PostOrderBatchRequest1; // strXml;
        }

        //public ContinuityBatch GetContBatch(Order orderItem)
        //{
        //    //String strXml = String.Empty;
        //    orderItem.LoadAttributeValues();

        //    string ShippingStateProvinceAbbreviation = "";
        //    string BillingStateProvinceAbbreviation = "";
        //    List<StateProvince> states = StateManager.GetAllStates(0);
        //    StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
        //    if (itemShippingStateProvince != null)
        //    {
        //        ShippingStateProvinceAbbreviation = itemShippingStateProvince.Abbreviation.Trim();
        //    }
        //    StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
        //    if (itemBillingStateProvince != null)
        //    {
        //        BillingStateProvinceAbbreviation = itemBillingStateProvince.Abbreviation.Trim();
        //    }

        //    Sku ShippingSku = GetShippingSku(orderItem);
        //    CustomerElement custElement = new CustomerElement();
        //    //PostOrderBatchRequestOrderBatchCustomer Customer = new PostOrderBatchRequestOrderBatchCustomer();
            
        //    custElement.Project = Convert.ToInt32(config.Attributes["Project"].Value);            
        //    custElement.Customer = Convert.ToInt32(config.Attributes["CustomerNo"].Value);
        //    custElement.ClientCustomer = Convert.ToInt32(config.Attributes["ClientCustomer"].Value);
        //    custElement.First = orderItem.CustomerInfo.ShippingAddress.FirstName;
        //    custElement.Last = orderItem.CustomerInfo.ShippingAddress.LastName;
        //    custElement.Address = orderItem.CustomerInfo.ShippingAddress.Address1;
        //    custElement.Address2 = orderItem.CustomerInfo.ShippingAddress.Address2;
        //    custElement.City = orderItem.CustomerInfo.ShippingAddress.City;
        //    custElement.State = BillingStateProvinceAbbreviation; //  orderItem.CustomerInfo.BillingAddress.StateProvinceName;
        //    custElement.Zip = orderItem.CustomerInfo.ShippingAddress.ZipPostalCode;
        //    if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
        //    {
        //        custElement.Country = "CN";
        //    }
        //    else
        //    {
        //        custElement.Country = orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim();
        //    }
        //    custElement.TmPhone = 0;
        //    custElement.DayPhone = (long)Convert.ToDouble(OrderHelper.GetCleanPhoneNumber(orderItem.CustomerInfo.ShippingAddress.PhoneNumber));
        //    custElement.NightPhone = (long)Convert.ToDouble(OrderHelper.GetCleanPhoneNumber(orderItem.CustomerInfo.ShippingAddress.PhoneNumber));
        //    custElement.CreationDate = DateTime.Now;
        //    custElement.CreationDate = DateTime.Now;
        //    custElement.CreationDate = DateTime.Now;

        //    Sku ContinuitySKU = GetContinuitySKU(orderItem);
        //    ContinuityTemplate contTemplate = new ContinuityTemplate();
        //    contTemplate.ContinuityPlan = ContinuitySKU.AttributeValues["continuityplan"].Value; // "CN60"; // config.Attributes["ContinuityPlan"].Value;
        //    contTemplate.ContinuityShipCode = "0";
        //    contTemplate.ContinuityFirst = orderItem.CustomerInfo.ShippingAddress.FirstName;
        //    contTemplate.ContinuityLast = orderItem.CustomerInfo.ShippingAddress.LastName;
        //    contTemplate.ContinuityAddress = orderItem.CustomerInfo.ShippingAddress.Address1;
        //    contTemplate.ContinuityAddress2 = orderItem.CustomerInfo.ShippingAddress.Address2;
        //    contTemplate.ContinuityCity = orderItem.CustomerInfo.ShippingAddress.City;
        //    contTemplate.ContinuityState = ShippingStateProvinceAbbreviation; // BillingStateProvinceAbbreviation; //  orderItem.CustomerInfo.BillingAddress.StateProvinceName;
        //    contTemplate.ContinuityZip = orderItem.CustomerInfo.ShippingAddress.ZipPostalCode;
        //    if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46)
        //    {
        //        contTemplate.ContinuityCountry = "CN";
        //    }
        //    else
        //    {
        //        contTemplate.ContinuityCountry = orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim();
        //    }
        //    contTemplate.ContinuityPhone = (long)Convert.ToDouble(OrderHelper.GetCleanPhoneNumber(orderItem.CustomerInfo.ShippingAddress.PhoneNumber));
        //    contTemplate.ContinuityStatus = "A";
        //    contTemplate.ContinuityCreationUser = "XML";
        //    contTemplate.ContinuityCreationDate = DateTime.Now;
        //    contTemplate.ContinuityModifyDate = DateTime.Now;
        //    contTemplate.ContinuityWarehouse = 0;
        //    // The Continuity Post should not contain a Payment Plan ) of U3TP (<ContinuityPaymentPlan> ).  Only 02M is available as a payment plan for continuities.
        //    contTemplate.ContinuityPaymentPlan = "02M"; //  GetPaymentPlan(orderItem);
        //    if (orderItem.CreditInfo.CreditCardName.ToLower().Contains("americanexpress"))
        //        contTemplate.ContinuityPaymentCode = "X";
        //    else
        //        contTemplate.ContinuityPaymentCode = orderItem.CreditInfo.CreditCardName.Substring(0, 1);

        //    contTemplate.ContinuityCCNo_Check = orderItem.CreditInfo.CreditCardNumber;
        //    contTemplate.ContinuityExpDate = (long)Convert.ToDecimal(orderItem.CreditInfo.CreditCardExpired.ToString("MMyy"));
        //    contTemplate.ContinuityNo = 1;
        //    if (contTemplate.ContinuityPlan.ToUpper().Equals("CN60"))
        //    {
        //        // CN60	Order Date + 60 Days // <NextShipDate> that reflects Order Date + 60 Days when using Continuity Plan CN60
        //        contTemplate.NextShipDate = orderItem.CreatedDate.AddDays(60);
        //    }
        //    else
        //    {
        //        // Order Date + 30 Days
        //        contTemplate.NextShipDate = orderItem.CreatedDate.AddDays(30);
        //    }
        //    // contTemplate.NextShipDate = DateTime.Now.AddMonths(1);
        //    //TODO: get from sku attribute (must be set)
        //    contTemplate.DaysBetweenShipment = Convert.ToInt32(ContinuitySKU.AttributeValues["contdays"].Value); // 60;
        //    contTemplate.FreeOrder = 0;
        //    contTemplate.ContinuityConfirmation = 0;
        //    // The Ship Service (<ContinuityShpCodeService>, <ContinuityShipFeeService>) for continuities is always Standard, yet I saw some continuities with R or E.  Please default these 2 fields to S on continuity posts.
        //    contTemplate.ContinuityShpCodeService = "S"; // GetShippingSku(orderItem).SkuCode;
        //    contTemplate.ContinuityShipFeeService = "S"; // contTemplate.ContinuityShpCodeService;
        //    contTemplate.ContinuityPurchaseOrder = config.Attributes["OrderIdPrefix"].Value + orderItem.OrderId.ToString();
        //    contTemplate.ContinuityClientOrderNo = 0;
        //    contTemplate.OriginalTelemarketer = config.Attributes["Telemarketer"].Value;             
        //    contTemplate.ContinuityPromotionalOffer = config.Attributes["Promotion"].Value + "C";                
        //    contTemplate.PricingCalculationMethod = "P";
        //    contTemplate.ShippingCalculationMethod = "P";
        //    contTemplate.ContinuityContact = contTemplate.ContinuityFirst + " " + contTemplate.ContinuityLast;
        //    contTemplate.ContinuityModifyUser = string.Empty;
        //    contTemplate.ContinuityMedia = "";
        //    contTemplate.ContinuityBackEndCode = "";
        //    contTemplate.ContinuityBankName = "";
        //    contTemplate.ContinuityBankState = "";
        //    contTemplate.ContinuityBankTown = "";
        //    contTemplate.ContinuityCheckSavingsFlag = "";
        //    contTemplate.ContinuityConfirmation = 0;
        //    contTemplate.ContinuityMICR = "";
        //    contTemplate.ContinuityOrderCat = "";
        //    contTemplate.PrePay = "";

        //    ContinuityItem[] contItems = new ContinuityItem[orderItem.SkuItems.Count];

        //    int currentItem = 0;
        //    SkuManager skuManager = new SkuManager();
        //    int ContinuitySkuId = InnotracDAL.GetInnotracContinuitySKU(orderItem.OrderId);
        //    if (ContinuitySkuId > 0)
        //    {
        //        //foreach (Sku Item in orderItem.SkuItems)
        //        //{
        //            Sku sku = skuManager.GetSkuByID(ContinuitySkuId);
        //            if (sku.CategoryId == 13)
        //            {
        //                sku.LoadAttributeValues();
        //                ContinuityItem contItem = new ContinuityItem();
        //                contItem.ContinuitySKU = sku.SkuCode;                        
        //                contItem.ContinuityQtyOrdered = 1; // Item.Quantity;
        //                contItem.ExtendedPrice = (double)sku.FullPrice;
        //                contItem.ExtendedShipping = 0;//ItemPricing1.SKU_Shipping_Price.ToString("N2"));
        //                contItem.ExtendedTax = (double)GetSkuTaxCost(orderItem.CustomerInfo.ShippingAddress, sku) ; // Item);
        //                contItems[currentItem++] = contItem;

        //            }
        //        // }
        //    }

        //    contTemplate.ContinuityItems = contItems.Take<ContinuityItem>(currentItem).ToArray<ContinuityItem>();
        //    custElement.ContinuityTemplates = new ContinuityTemplate[] { contTemplate };
        //    ContinuityBatch contBatch = new ContinuityBatch();
        //    contBatch.CustomerElement = new CustomerElement[] { custElement };

        //    InnotracCWS.WSAuthorization auth = new InnotracCWS.WSAuthorization();
        //    auth.Username = config.Attributes["Username"].Value;
        //    auth.Password = config.Attributes["Password"].Value;
        //    contBatch.Authorization = auth;

        //    return contBatch;
        //}

        public bool IsMainOrderPosted(int orderId)
        {
            bool IsPosted = false;
            string Response1 = "";
            string InotracOrderNo = "";
            Order orderItem = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);
            if (orderItem.OrderStatusId == 5)
            {
                orderItem.LoadAttributeValues();

                if (orderItem.AttributeValues.ContainsAttribute("response") && orderItem.AttributeValues["response"].Value != null)
                {
                    Response1 = orderItem.AttributeValues["response"].Value;
                    PostOrderBatchResponse PostOrderBatchResponse1 = FromXml<PostOrderBatchResponse>(Response1);
                    InotracOrderNo = PostOrderBatchResponse1.Orders[0].orderNumber.ToString();
                    if (InotracOrderNo.Length >= 8)
                    {
                        // base orders should never be re-posted if our 8-digit order number is returned in the response.
                        IsPosted = true;
                    }
                }
            }
            return IsPosted;
        }
        //public bool SearchByExternalOrderId(int orderId, int OrderStatusId)
        //{
        //    bool result = false;
        //    Order orderItem = new OrderManager().GetBatchProcessOrders(orderId);
        //    string OrderReferenceNo1 = config.Attributes["OrderIdPrefix"].Value + orderId.ToString();

        //    CSWeb.InnotracWebSelfHelp.WSAuthorization WSAuthorization1 = new CSWeb.InnotracWebSelfHelp.WSAuthorization();
        //    WSAuthorization1.Username = config.Attributes["Username"].Value;
        //    WSAuthorization1.Password = config.Attributes["Password"].Value;

        //    ExternalOrderIDSearchRequest ExternalOrderIDSearchRequest1 = new ExternalOrderIDSearchRequest();
        //    ExternalOrderIDSearchRequest1.authorization = WSAuthorization1;
        //    ExternalOrderIDSearchRequest1.externalOrderNo = OrderReferenceNo1;
        //    try
        //    {
        //        CSWeb.InnotracWebSelfHelp.WebSelfHelpSoapClient WebSelfHelpSoapClient1 = new WebSelfHelpSoapClient();
        //        ExternalOrderIDSearchResponse ExternalOrderIDSearchResponse1 = WebSelfHelpSoapClient1.ExternalOrderIdSearch(ExternalOrderIDSearchRequest1);
        //        // -1	Error  and  -100	More than one customer identified.  API Documentation                
        //        if (ExternalOrderIDSearchResponse1.ExternalOrderIDCustomer != null && ExternalOrderIDSearchResponse1.ExternalOrderIDCustomer.orderNo > 0 && (ExternalOrderIDSearchResponse1.requestStatus.StatusCode == 0 || ExternalOrderIDSearchResponse1.requestStatus.StatusCode == -100))
        //        {
        //            if (IsMainOrderPosted(orderId) == false)
        //            {
        //                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
        //                orderAttributes.Add("innotrac_orderno", new CSBusiness.Attributes.AttributeValue(ExternalOrderIDSearchResponse1.ExternalOrderIDCustomer.orderNo.ToString()));
        //                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
        //            }
        //            else if (OrderStatusId != 2)
        //            {
        //                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderId, 2);
        //            }
        //            result = true;
        //        }
        //        else
        //        {
        //            result = false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        //InnotracDAL.InsertInnoTracLog(orderId, 8);
        //        string errormessage = "WebSelfHelp :: " + ex.Message + " StackTrace:: " + ex.StackTrace;
        //        result = true; // Just Assume it was found
        //        OrderHelper.SendOrderFailedEmail(orderItem.OrderId, "custom", errormessage);
        //    }
        //    return result;
        //}
        protected T FromXml<T>(String xml)
        {
            T returnedXmlClass = default(T);
            using (TextReader reader = new StringReader(xml))
            {
                try
                {
                    returnedXmlClass =
                        (T)new XmlSerializer(typeof(T)).Deserialize(reader);
                }
                catch (InvalidOperationException)
                {
                    // String passed is not XML, simply return defaultXmlClass
                }
            }
            return returnedXmlClass;
        }
        public bool PostOrder(int orderId)
        {
            bool result = false;
            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            try
            {
                Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);

                bool MainOrderPosted = false;

                // This is Duplicate Order Check with Innotrac CRM Production. If you want enable it please add below web services.
                // https://gateway.west.innotrac.com:8443/invoke/INOC_ATS_CRMS.SOA.WebSelfHelp.DM:wsdl
                //if (SearchByExternalOrderId(orderItem.OrderId, orderItem.OrderStatusId))
                //{
                //    // Order found in Innotrac CRM  WEBSelfHelp                    
                //    MainOrderPosted = true;
                //    result = true;
                //} 
                // else 
                if (IsMainOrderPosted(orderItem.OrderId))
                {
                    // Order was posted by Conversion Systems to Innotrac successfully previously
                    MainOrderPosted = true;
                    result = true;
                }                
                if (MainOrderPosted == false)
                {
                    InnotracWS.InocOrdersSoapClient RequestOrder = new InnotracWS.InocOrdersSoapClient();
                    //RequestOrder.Timeout = 30000; // Time outs of 30 seconds should be implemented for every web service call.
                    PostOrderBatchRequest PostOrderBatchRequest1 = GetRequest(orderItem);
                    XmlSerializer serializer = new XmlSerializer(typeof(PostOrderBatchRequest));
                    StringWriter writer = new StringWriter();
                    serializer.Serialize(writer, PostOrderBatchRequest1);
                    writer.Close();
                    string req = writer.ToString();

                    PostOrderBatchResponse PostOrderBatchResponse1 = RequestOrder.PostOrderBatch(PostOrderBatchRequest1);


                    string res = "";
                    XmlSerializer serializer2 = new XmlSerializer(typeof(PostOrderBatchResponse));
                    StringWriter writer2 = new StringWriter();
                    serializer2.Serialize(writer2, PostOrderBatchResponse1);
                    writer2.Close();
                    res = writer2.ToString();
                    // orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(req));
                    orderAttributes.Add("Response", new CSBusiness.Attributes.AttributeValue(res));
                    if (PostOrderBatchResponse1.Orders[0].OrderStatus[0].Code == 0 || PostOrderBatchResponse1.Orders[0].OrderStatus[0].Code >= 100)
                    {
                        //InnotracDAL.InsertInnoTracLog(orderId, 2);
                        CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
                        result = true;
                    }
                    else
                    {
                        //InnotracDAL.InsertInnoTracLog(orderId, 8);
                        CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                        result = false;
                        OrderHelper.SendOrderFailedEmail(orderId, "main", "");
                    }
                }

                // Below code is for Posting Orders with Continuity Products. 
                //if (result == true)
                //{
                //    if (GetContinuityFlag(orderItem) == "Y")
                //        PostOrderContinuity(orderItem);
                //}
            }
            catch (Exception ex)
            {
                //InnotracDAL.InsertInnoTracLog(orderId, 8);
                string errormessage = ex.Message + " StackTrace:: " + ex.StackTrace;
                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderId, 5);
                result = false;
                OrderHelper.SendOrderFailedEmail(orderId, "custom", errormessage);
            }
            return result;
        }

        // Below code is for Posting Continuity Orders. Please add below web services for Production and Development Testing
        // Development https://gatewaytest.west.innotrac.com:8453/invoke/INOC_ATS_CRMS.SOA.BToCContinuity_NET.DMACCEPT:wsdl
        // Production https://gateway.west.innotrac.com:8443/invoke/INOC_ATS_CRMS.SOA.BToCContinuity_NET.DM:BToCContinuity
        //public bool PostOrderContinuity(Order orderItem)
        //{
        //    bool result = false;
        //    Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
        //    try
        //    {
        //        InnotracCWS.BToCContinuityServiceSoapClient contService = new InnotracCWS.BToCContinuityServiceSoapClient();
        //        ContinuityBatch contBatch = GetContBatch(orderItem);

        //        XmlSerializer serializer = new XmlSerializer(typeof(ContinuityBatch));
        //        StringWriter writer = new StringWriter();
        //        serializer.Serialize(writer, contBatch);
        //        writer.Close();
        //        string req = writer.ToString();
        //        string res = "";
        //        try
        //        {
        //            if (contService.SaveContinuities(contBatch))
        //                res = "Success";
        //            else
        //                res = "Failure";
        //        }
        //        catch (Exception ex)
        //        {
        //            res = "Error: " + ex.Message;
        //        }
        //        // orderAttributes.Add("ContRequest", new CSBusiness.Attributes.AttributeValue(req));
        //        orderAttributes.Add("ContResponse", new CSBusiness.Attributes.AttributeValue(res));

        //        if (res.ToLower().Equals("success"))
        //        {
        //            CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderItem.OrderId, orderAttributes, 2);
        //            result = true;
        //        }
        //        else if (res.ToLower().Equals("failure") || res.ToLower().Contains("error"))
        //        {
        //            CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderItem.OrderId, orderAttributes, 5);
        //            result = false;
        //            OrderHelper.SendOrderFailedEmail(orderItem.OrderId, "continuity", "");

        //            // If you receive this error on the continuity post, you do not need to attempt to re-post.
        //            string error = "Violation of PRIMARY KEY constraint 'PK_trnCntHdr_1__11'";
        //            if (res.ToLower().Contains(error.ToLower()))
        //            {
        //                CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderItem.OrderId, 2);
        //            }
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        //InnotracDAL.InsertInnoTracLog(orderId, 8);
        //        string errormessage = ex.Message + " StackTrace:: " + ex.StackTrace;
        //        CSResolve.Resolve<IOrderService>().UpdateOrderStatus(orderItem.OrderId, 5);
        //        result = false;
        //        OrderHelper.SendOrderFailedEmail(orderItem.OrderId, "custom", errormessage);
        //    }
        //    return result;
        //}

        //public Sku GetContinuitySKU(Order orderItem)
        //{
        //    SkuManager skuManager = new SkuManager();
        //    foreach (Sku Item in orderItem.SkuItems)
        //    {
        //        Sku sku = skuManager.GetSkuByID(Item.SkuId);
        //        if (sku.CategoryId == 13)
        //        {
        //            sku.LoadAttributeValues();
        //            return sku;
        //        }
        //    }
        //    return null;
        //}
        //public decimal GetFullPriceSubTotal_ContinuitySKU(Order orderItem)
        //{
        //    decimal SubTotalFullPrice_ContinuityProducts = 0;
            //SkuManager skuManager = new SkuManager();
            //foreach (Sku Item in orderItem.SkuItems)
            //{
            //    Sku sku = skuManager.GetSkuByID(Item.SkuId);
            //    if (sku.CategoryId == 13)
            //    {
            //        SubTotalFullPrice_ContinuityProducts = SubTotalFullPrice_ContinuityProducts + Item.FullPrice;
            //    }
            //}
        //    return SubTotalFullPrice_ContinuityProducts;
        //}        
    }
}