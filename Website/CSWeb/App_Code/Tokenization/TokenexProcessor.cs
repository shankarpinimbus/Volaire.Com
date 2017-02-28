using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CSPaymentProvider;
using CSBusiness;
using System.IO;
using System.Xml;
using CSBusiness.OrderManagement;
using CSWeb.TokenEx_Test;
using CSWeb.App_Code.Tokenization;
using CSData;
using CSBusiness.Preference;
using System.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using RestSharp;

namespace CSWeb.Tokenization
{
    [Serializable]
    public class TokenexProcessor
    {
        //API parameters
        string APIKey = string.Empty;
        string TokenExID = string.Empty;
        //Setting up required values for each call
        public TokenexProcessor()
        {
            //Load Tokenex credentials from web.config            
            APIKey = ConfigurationManager.AppSettings["APIKey"];
            TokenExID = ConfigurationManager.AppSettings["TokenExID"];
        }

        /// <summary>
        /// Instance can only be obtained from this method, which uses cache if possible.
        /// </summary>
        /// <returns>New instance of the class</returns>
        public static TokenexProcessor GetInstance()
        {
            if (HttpContext.Current.Session != null && HttpContext.Current.Session["Tokenex"] != null)
                return (TokenexProcessor)HttpContext.Current.Session["Tokenex"];
            else
            {
                TokenexProcessor tp = new TokenexProcessor();
                if (HttpContext.Current.Session != null)
                HttpContext.Current.Session["Tokenex"] = tp;
                return tp;
            }
        }

        /// <summary>
        /// Sends the encrypted card number to Tokenex for tokenization
        /// </summary>
        /// <returns>Token ID</returns>
        public string Tokenize(string encryptedValue)
        {
            //create our client
            var client = new TokenServicesClient();
            //create our token action
            var action = new TokenizeFromEncryptedValueAction();

            action.APIKey = APIKey;
            action.TokenExID = TokenExID;
            action.EcryptedData = encryptedValue;
            action.TokenScheme = TokenTypeEnum.fourTOKENfour;

            //call to Tokenize Method
            var result = client.TokenizeFromEncryptedValue(action);
            if (result.Success)
                return result.Token;
            else
                return "";
        }

        /// <summary>
        /// Performs a Process Transaction request on First Data Gateway.
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public Response PerformAuthRequest(Request request)
        {
            RestClient _client;
            _client = new RestClient(ConfigurationManager.AppSettings["TokenExPaymentUrl"]);
            _client.AddDefaultHeader("Content-Type", "application/json");
            string requestXML = RequestGenerator.GetRequest(request);
            var req = new RestRequest();
            req.AddParameter("application/json", requestXML, ParameterType.RequestBody);
            var res = _client.Post(req);
            var jsonConf = new JsonSerializerSettings();
            string authCode = "";
            string transactionCode = "";
            string cvvCode = "";
            string avsCode = "";
            Response1 response1 = JsonConvert.DeserializeObject<Response1>(res.Content);
            foreach (Param param in response1.Params)
            {
                if (param.Key.ToLower().Equals("auth_code"))
                {
                    authCode = param.Value;
                }

                if (param.Key.ToLower().Equals("ref_num"))
                {
                    transactionCode = param.Value;
                }
                //avs_result_code
                if (param.Key.ToLower().Equals("avs_result_code"))
                {
                    avsCode = param.Value;
                }

                //cvv2_result_code
                if (param.Key.ToLower().Equals("cvv2_result_code"))
                {
                    cvvCode = param.Value;
                }
            }
            Response response = new Response();
            response.GatewayRequestRaw = requestXML;
            response.GatewayResponseRaw = res.Content;
            response.MerchantDefined1 = avsCode;
            response.MerchantDefined2 = cvvCode;
            Hashtable addinfo = new Hashtable();
            SitePreference sitePreference = CSFactory.GetCacheSitePref();
            sitePreference.LoadAttributeValues();
            addinfo.Add("merchantId",sitePreference.GetAttributeValue<string>("gatewaymerchantid", string.Empty, string.Empty));
            response.AdditionalInfo = addinfo;
            response.AuthCode = authCode;
            response.TransactionID = transactionCode;
            if (response1.TransactionResult)
            {
                response.ResponseType = TransactionResponseType.Approved;
            }
            else
            {
                response.ResponseType = TransactionResponseType.Denied;
            }
            return response;
        }

        #region Response Structure
        public class AVSResult
        {
            public string Code { get; set; }
            public string Message { get; set; }
            public string PostalMatch { get; set; }
            public string StreetMatch { get; set; }
        }

        public class CVVResult
        {
            public string Code { get; set; }
            public string Message { get; set; }
        }

        public class Param
        {
            public string Key { get; set; }
            public string Value { get; set; }
        }

        public class Response1
        {
            public string Error { get; set; }
            public string ReferenceNumber { get; set; }
            public bool Success { get; set; }
            public AVSResult AVS_Result { get; set; }
            public string Authorization { get; set; }
            public CVVResult CVV_Result { get; set; }
            public string Message { get; set; }
            public List<Param> Params { get; set; }
            public bool Test { get; set; }
            public bool TransactionResult { get; set; }
        }
        #endregion
    }
}