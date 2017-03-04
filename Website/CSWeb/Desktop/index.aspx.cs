using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSBusiness.Web;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class index_cart_C : SiteBasePage
    {
        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                //if (CSBasePage.GetClientDeviceType() == CSBusiness.Enum.DeviceType.Mobile)
                //{
                //    OrderHelper.MobileRedirect();
                //}

                OrderHelper.SetDynamicLandingPageVersion(OrderHelper.GetVersionName(), ClientOrderData);
                var qs = HttpUtility.ParseQueryString(Request.QueryString.ToString());
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
                else if (Response.Cookies["sid"] != null && Response.Cookies["sid"].Value != null && Response.Cookies["sid"].Value.Equals("1"))
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
    }
}