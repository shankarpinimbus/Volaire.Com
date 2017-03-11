using System;
using System.Text;
using CSBusiness.Attributes;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSBusiness.Web;
using CSWebBase;

namespace CSWeb.Mobile.Store
{
    public partial class index : SiteBasePage
    {
        public string Version = "mobile";
        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

        protected void lb_Clicked(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx?PId="+GetDynamicVersionData("mainkit")+"&CId="+(int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.SetDynamicLandingPageVersion(OrderHelper.GetVersionName(), ClientOrderData);
            if (CartContext != null && CartContext.RequestParam.Equals(""))
            {
                if (Request.QueryString.Count > 0)
                    CartContext.RequestParam = CommonHelper.GetQueryString(Request.RawUrl);
                else if (Response.Cookies["sid"] != null && Response.Cookies["sid"].Value != null)
                {
                    CartContext.RequestParam = "?sid=" + Response.Cookies["sid"].Value;
                }
            }
            ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];
            if (!Page.IsPostBack)
            {

                SitePreference sitePrefCache = CSFactory.GetCacheSitePref();
                if (!sitePrefCache.GeoLocationService)
                {
                    string GeoCoountry = "";
                    GeoCoountry = CommonHelper.GetGeoTargetLocation(CommonHelper.IpAddress(HttpContext.Current));                    
                }

                if (Request["versionlp"] != null)
                {
                    Version = Request["versionlp"].ToString();
                    if (clientData.OrderAttributeValues != null)
                    {
                        if (clientData.OrderAttributeValues.ContainsKey("DynamicVerionName"))
                        {
                            Version = clientData.OrderAttributeValues["DynamicVerionName"].Value;
                        }
                        else
                        {
                            clientData.OrderAttributeValues.Add("DynamicVerionName", new AttributeValue(Version));
                        }
                    }
                }
                OrderHelper.SetDynamicLandingPageVersion(Version, clientData);

                if (CartContext != null && CartContext.RequestParam.Equals(""))
                {
                    if (Request.QueryString.Count > 0)
                        CartContext.RequestParam = CommonHelper.GetQueryString(Request.RawUrl);
                    else if (Response.Cookies["sid"] != null)
                    {
                        CartContext.RequestParam = "?sid=" + Response.Cookies["sid"].Value;
                    }
                }
                else if (CartContext != null && Request.QueryString.Count > 0 && !CartContext.RequestParam.ToLower().Equals(CommonHelper.GetQueryString(Request.RawUrl).ToLower()))
                {
                    CartContext.RequestParam = CommonHelper.GetQueryString(Request.RawUrl);
                }
                OrderHelper.SetDynamicLandingPageVersion(OrderHelper.GetVersionName(), ClientOrderData);
                var qs = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                if (Request["sid"] != null)
                {
                    string sid = Request["sid"].ToLower();
                    string newSid = OrderHelper.getMobileSid(sid);
                    if (!sid.Equals(newSid))
                    {
                        CommonHelper.SetCookie("sid", newSid, new TimeSpan(1, 24, 1, 1));
                        qs.Remove("sid");
                        qs.Set("sid", newSid);
                        if (Request.RawUrl.Contains("?"))
                            Response.Redirect(Request.RawUrl.Substring(0, Request.RawUrl.IndexOf('?')) + "?" + qs);
                        else
                        {
                            Response.Redirect(Request.RawUrl + "?" + qs);
                        }
                    }

                }

                
                if (Request["sid"] == null || Request["sid"].Equals(""))
                {
                    string sid = OrderHelper.GetDynamicVersionData("sid");
                    if (sid.Length > 0)
                    {
                        CommonHelper.SetCookie("sid", sid, new TimeSpan(1, 24, 1, 1));
                        qs.Set("sid", sid);
                        Response.Redirect(Request.RawUrl + "?" + qs);
                    }
                }
                else if (Response.Cookies["sid"] != null && Response.Cookies["sid"].Value.Equals("1"))
                {
                    string sid = OrderHelper.GetDynamicVersionData("sid");
                    if (sid.Length > 0)
                    {
                        CommonHelper.SetCookie("sid", sid, new TimeSpan(1, 24, 1, 1));
                        qs.Set("sid", sid);
                        Response.Redirect(Request.RawUrl + "?" + qs);
                    }
                }
                else if (Request["sid"] != null && DynamicSidDAL.GetDynamicsid(Request["sid"].ToLower()).Count == 0)
                {
                    string sid = OrderHelper.GetDynamicVersionData("sid");
                    if (sid.Length > 0)
                    {
                        CommonHelper.SetCookie("sid", sid, new TimeSpan(1, 24, 1, 1));
                        qs.Set("sid", sid);
                        Response.Redirect(Request.RawUrl + "?" + qs);
                    }
                }
                else if (Request["sid"] != null && DynamicSidDAL.GetDynamicsid(Request["sid"].ToLower()).Count == 0 && !Request["sid"].ToLower().Equals(OrderHelper.GetDynamicVersionData("sid").ToLower()))
                {
                    string sid = OrderHelper.GetDynamicVersionData("sid");
                    if (sid.Length > 0)
                    {
                        CommonHelper.SetCookie("sid", sid, new TimeSpan(1, 24, 1, 1));
                        qs.Remove("sid");
                        qs.Set("sid", sid);
                        if (Request.RawUrl.Contains("?"))
                            Response.Redirect(Request.RawUrl.Substring(0, Request.RawUrl.IndexOf('?')) + "?" + qs);
                        else
                        {
                            Response.Redirect(Request.RawUrl + "?" + qs);
                        }
                    }

                }
                

            }

        }

        public string GetCleanPhoneNumber(string data)
        {
            return OrderHelper.GetCleanPhoneNumber(data);
        }
    
       

        public string GetDynamicVersionData(string data)
        {
            return OrderHelper.GetDynamicVersionData(data);
        }
    }
}