using CSPaymentProvider;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;
using CSBusiness;
using CSBusiness.Preference;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using RestSharp.Deserializers;

namespace CSWeb.App_Code.Tokenization
{
    public class RequestGenerator
    {
       

        public static string GetRequest(Request request)
        {
            SitePreference sitePreference = CSFactory.GetCacheSitePref();
            sitePreference.LoadAttributeValues();
            string GatewayName = sitePreference.GetAttributeValue<string>("gatewayname", string.Empty, string.Empty);
            string GatewayLogin = sitePreference.GetAttributeValue<string>("gatewaylogin", string.Empty, string.Empty);
            string GatewayPassword = sitePreference.GetAttributeValue<string>("gatewaypassword", string.Empty, string.Empty);
            string apiKey = ConfigurationManager.AppSettings["APIKey"];
            string tokenExID = ConfigurationManager.AppSettings["TokenExID"];
            var o = new RootObject
            {
                APIKey = apiKey,
                TokenExID = tokenExID,
                TransactionType = 1,
                TransactionRequest = new TransactionRequest()
                                     {
                                         gateway = new Gateway()
                                                   {
                                                       login = GatewayLogin,
                                                       name = GatewayName

                                                   },
                                         credit_card = new CreditCard()
                                                       {
                                                           number = request.CardNumber,
                                                           month = request.ExpireDate.Month.ToString(),
                                                           first_name = request.FirstName,
                                                           last_name = request.LastName,
                                                           verification_value = request.CardCvv,
                                                           year = request.ExpireDate.Year.ToString()

                                                       },
                                                       transaction = new Transaction()
                                                                     {
                                                                         amount = (request.Amount).ToString().Replace(".0",""),
                                                                         order_id = request.InvoiceNumber,
                                                                         billing_address = new BillingAddress()
                                                                                           {
                                                                                               address1 = request.Address1,
                                                                                               city = request.City,
                                                                                               state = request.State,
                                                                                               zip = request.ZipCode
                                                                                           },
                                                                     },
                                     },
            };

            var jsonConf = new JsonSerializerSettings();

            var json = JsonConvert.SerializeObject(o, jsonConf);
            return json;
        }

        #region Request Structure
        public class Gateway
        {
            public string name { get; set; }
            public string login { get; set; }
        }

        public class CreditCard
        {
            public string number { get; set; }
            public string month { get; set; }
            public string year { get; set; }
            public string verification_value { get; set; }
            public string first_name { get; set; }
            public string last_name { get; set; }
        }

        public class BillingAddress
        {
            public string address1 { get; set; }
            public string city { get; set; }
            public string state { get; set; }
            public string zip { get; set; }
        }

        public class Transaction
        {
            public string amount { get; set; }
            public string order_id { get; set; }
            public BillingAddress billing_address { get; set; }
        }

        public class TransactionRequest
        {
            public Gateway gateway { get; set; }
            public CreditCard credit_card { get; set; }
            public Transaction transaction { get; set; }
        }

        public class RootObject
        {
            public string APIKey { get; set; }
            public string TokenExID { get; set; }
            public int TransactionType { get; set; }
            public TransactionRequest TransactionRequest { get; set; }
        }
        #endregion
    }
}