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
    public class ResponseParse
    {
       

        public static string GetResponse(string s)
        {
            RootObject ro = JsonConvert.DeserializeObject<RootObject>(s);
            
            var o = new RootObject
            {
                
            };

            var jsonConf = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
                ContractResolver = new CamelCasePropertyNamesContractResolver()
            };

            var json = JsonConvert.SerializeObject(o, jsonConf);
            return json;
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

        public class RootObject
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