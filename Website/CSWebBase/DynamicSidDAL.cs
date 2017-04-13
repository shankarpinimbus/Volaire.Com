using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using CSBusiness.OrderManagement;
using CSBusiness.Web;
using CSCore.DataHelper;
using System.Data.SqlClient;
using System.Xml;
using CSBusiness;
using CSWeb;

namespace CSWebBase
{
    public class DynamicSidDAL
    {
        
        public static Dictionary<string,string> GetDynamicsid(string sid)
        {
            //string xmlData = "";
            Dictionary<string, string> dict = new Dictionary<string,string>();
            string connectionString = ConfigHelper.GetDBConnection();
            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            CSBusiness.Version item =
                 list.Find(x => x.Title.ToLower() == CSBasePage.GetVersionName().ToLower());

            int versionName = 43;
            if (item != null)
                versionName = item.VersionId;
            String ProcName = "pr_site_get_dynamic_sid";
            SqlParameter[] ParamVal = new SqlParameter[6];
            ParamVal[0] = new SqlParameter("sid", sid ?? string.Empty);
            ParamVal[1] = new SqlParameter("@versionid", versionName);
            bool hasRecord = false;
            using (SqlDataReader reader = BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal))
            {
                while (reader.Read())
                {
                    dict.Add("sid",sid);
                    dict.Add("source",reader["source"].ToString());
                    dict.Add("media",reader["media"].ToString());
                    dict.Add("ProjectCode", reader["ProjectCode"].ToString());
                    dict.Add("PhoneNumber",reader["PhoneNumber"].ToString());
                    //xmlData = reader["DataXML"].ToString();
                    hasRecord = true;
                }
            }


            //if (!hasRecord)
            //{
            //    string sid1 = GetDynamicVersionData("sid");
            //    ProcName = "pr_site_get_dynamic_sid";
            //    SqlParameter[] ParamVal1 = new SqlParameter[6];
            //    ParamVal1[0] = new SqlParameter("sid", sid1 ?? string.Empty);
            //    ParamVal1[1] = new SqlParameter("@versionid", versionName);
            //    using (SqlDataReader reader = BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal1))
            //    {
            //        while (reader.Read())
            //        {
            //            dict.Add("sid", sid);
            //            dict.Add("source", reader["source"].ToString());
            //            dict.Add("media", reader["media"].ToString());
            //            dict.Add("ProjectCode", reader["ProjectCode"].ToString());
            //            dict.Add("PhoneNumber", reader["PhoneNumber"].ToString());
            //        }
            //    }


            //}
            return dict;
        }

        public static string GetDynamicVersionData(string dataName)
        {
            string radioVersionData = "";
            ClientCartContext context = (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];
            if (context.OrderAttributeValues != null && context.OrderAttributeValues.ContainsKey("dynamicveriondata"))
            {
                radioVersionData = context.OrderAttributeValues["dynamicveriondata"].Value;
            }
            else if (context.OrderAttributeValues != null && context.OrderAttributeValues.ContainsKey("DynamicVerionData"))
            {
                radioVersionData = context.OrderAttributeValues["DynamicVerionData"].Value;
            }
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(radioVersionData);
            doc.SelectSingleNode("version");

            string returnData = "";
            switch (dataName)
            {
                case "phone":
                    returnData = doc.SelectSingleNode("Version")["Phone"].InnerText;
                    break;

                case "image1":
                    returnData = doc.SelectSingleNode("Version")["Image1"].InnerText;
                    break;

                case "MainKitBlack":
                    returnData = doc.SelectSingleNode("Version")["MainKitBlack"].InnerText;
                    break;

                case "MainKitDarkGray":
                    returnData = doc.SelectSingleNode("Version")["MainKitDarkGray"].InnerText;
                    break;

                case "MainKitLightGray":
                    returnData = doc.SelectSingleNode("Version")["MainKitLightGray"].InnerText;
                    break;

                case "imageSelector":
                    returnData = doc.SelectSingleNode("Version")["imageSelector"].InnerText;
                    break;

                case "homepageimage":
                    returnData = doc.SelectSingleNode("Version")["Image1"].InnerText;
                    break;

                case "ctaimage":
                    returnData = doc.SelectSingleNode("Version")["Image2"].InnerText;
                    break;

                case "cartimage":
                    returnData = doc.SelectSingleNode("Version")["Image3"].InnerText;
                    break;
                case "sid":
                    returnData = doc.SelectSingleNode("Version")["sid"].InnerText;
                    break;
            }
            return returnData;
        }

        public static Dictionary<string, string> GetDynamicsid(string sid, int orderId)
        {
            //string xmlData = "";
            Order orderItem = new OrderManager().GetBatchProcessOrder(orderId);
            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            Dictionary<string, string> dict = new Dictionary<string, string>();
            string connectionString = ConfigHelper.GetDBConnection();
            CSBusiness.Version item =
                   list.Find(x => x.Title.ToLower() == orderItem.VersionName.ToLower());
           
            int versionName = 43;
            if (item != null)
                versionName = item.VersionId;
            
            String ProcName = "pr_site_get_dynamic_sid";
            SqlParameter[] ParamVal = new SqlParameter[6];
            ParamVal[0] = new SqlParameter("sid", sid ?? string.Empty);
            ParamVal[1] = new SqlParameter("@versionid", versionName);
            using (SqlDataReader reader = BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal))
            {
                while (reader.Read())
                {
                    dict.Add("sid", sid);
                    dict.Add("source", reader["source"].ToString());
                    dict.Add("media", reader["media"].ToString());
                    dict.Add("ProjectCode", reader["ProjectCode"].ToString());
                    dict.Add("PhoneNumber", reader["PhoneNumber"].ToString());
                    //xmlData = reader["DataXML"].ToString();
                }
            }
            return dict;
        }

        public static string GetDynamicSidData(string data)
        {

            try
            {
                string returnData = "";
                if (HttpContext.Current.Response.Cookies["sid"] != null)
                {
                    Dictionary<string, string> SidData = GetDynamicsid(HttpContext.Current.Response.Cookies["sid"].Value);
                    switch (data)
                    {
                        case "phone":
                            if (SidData.ContainsKey("PhoneNumber") && SidData["PhoneNumber"] != null && SidData["PhoneNumber"].Length > 0 && !SidData["PhoneNumber"].Equals(string.Empty))
                            {
                                returnData = SidData["PhoneNumber"];
                            }
                            else
                            {
                                returnData = "(800) 413-5896";
                            }
                            break;

                        case "source":
                            if (SidData.ContainsKey("source") && SidData["source"] != null && SidData["source"].Length > 0 && !SidData["source"].Equals(string.Empty))
                            {
                                returnData = SidData["source"];
                            }
                            else
                            {
                                returnData = "ConSys";
                            }
                            break;

                        case "ProjectCode":
                            if (SidData.ContainsKey("ProjectCode") && SidData["ProjectCode"] != null && SidData["ProjectCode"].Length > 0 && !SidData["ProjectCode"].Equals(string.Empty))
                            {
                                returnData = SidData["ProjectCode"];
                            }
                            else
                            {
                                returnData = "Direct";
                            }
                            break;
                        case "media":
                            if (SidData.ContainsKey("media") && SidData["media"] != null && SidData["media"].Length > 0 && !SidData["media"].Equals(string.Empty))
                            {
                                returnData = SidData["media"];
                            }
                            else
                            {
                                returnData = "DeskA1";
                            }
                            break;

                        
                    }
                }

                return returnData;



            }
            catch
            {}

            return "";
        }


        public static string GetDynamicSidData(string data,string sid)
        {

            try
            {
                string returnData = "";
                //if (sid.Length > 0)
                //{
                    Dictionary<string, string> SidData = GetDynamicsid(sid);
                    switch (data)
                    {
                        case "phone":
                            if (SidData.ContainsKey("PhoneNumber") && SidData["PhoneNumber"] != null && SidData["PhoneNumber"].Length > 0 && !SidData["PhoneNumber"].Equals(string.Empty))
                            {
                                returnData = SidData["PhoneNumber"];
                            }
                            else
                            {
                                returnData = "(800) 413-5896";
                            }
                            break;

                        case "source":
                            if (SidData.ContainsKey("source") && SidData["source"] != null && SidData["source"].Length > 0 && !SidData["source"].Equals(string.Empty))
                            {
                                returnData = SidData["source"];
                            }
                            else
                            {
                                returnData = "ConSys";
                            }
                            break;

                        case "ProjectCode":
                            if (SidData.ContainsKey("ProjectCode") && SidData["ProjectCode"] != null && SidData["ProjectCode"].Length > 0 && !SidData["ProjectCode"].Equals(string.Empty))
                            {
                                returnData = SidData["ProjectCode"];
                            }
                            else
                            {
                                returnData = "Direct";
                            }
                            break;
                        case "media":
                            if (SidData.ContainsKey("media") && SidData["media"] != null && SidData["media"].Length > 0 && !SidData["media"].Equals(string.Empty))
                            {
                                returnData = SidData["media"];
                            }
                            else
                            {
                                returnData = "DeskA1";
                            }
                            break;


                    }
                
                return returnData;



            }
            catch
            {}
            return "";

        }

        public static string GetDynamicSidData(string data, string sid, int orderiD)
        {

            try
            {
                string returnData = "";
                //if (sid.Length > 0)
                //{
                    Dictionary<string, string> SidData = GetDynamicsid(sid,orderiD);
                    switch (data)
                    {
                        case "phone":
                            if (SidData.ContainsKey("PhoneNumber") && SidData["PhoneNumber"] != null && SidData["PhoneNumber"].Length > 0 && !SidData["PhoneNumber"].Equals(string.Empty))
                            {
                                returnData = SidData["PhoneNumber"];
                            }
                            else
                            {
                                returnData = "(800) 413-5896";
                            }
                            break;

                        case "source":
                            if (SidData.ContainsKey("source") && SidData["source"] != null && SidData["source"].Length > 0 && !SidData["source"].Equals(string.Empty))
                            {
                                returnData = SidData["source"];
                            }
                            else
                            {
                                returnData = "ConSys";
                            }
                            break;

                        case "ProjectCode":
                            if (SidData.ContainsKey("ProjectCode") && SidData["ProjectCode"] != null && SidData["ProjectCode"].Length > 0 && !SidData["ProjectCode"].Equals(string.Empty))
                            {
                                returnData = SidData["ProjectCode"];
                            }
                            else
                            {
                                returnData = "Direct";
                            }
                            break;
                        case "media":
                            if (SidData.ContainsKey("media") && SidData["media"] != null && SidData["media"].Length > 0 && !SidData["media"].Equals(string.Empty))
                            {
                                returnData = SidData["media"];
                            }
                            else
                            {
                                returnData = "DeskA1";
                            }
                            break;


                    }
                
                return returnData;



            }
            catch
            {}
            return "";

        }


    }
}

