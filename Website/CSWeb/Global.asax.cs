using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using CSBusiness.Resolver;
using System.Configuration;
using CSCore.Utils;
using CSBusiness.DynamicVersion.Campaigns;



namespace CSWeb
{
    public class Global : CSBusiness.Web.CSBaseGlobal
    {
        public override void Application_Start(object sender, EventArgs e)
        {
            Routing.RegisterRoutes();            
            //CampaignManager.InitializeCampaigns();
            base.Application_Start(sender, e);
        }

        public void Application_BeginRequest(object sender, EventArgs e)
        {
            if (Request.RawUrl.Equals("/") || Request.RawUrl.Equals("/i2/") || Request.RawUrl.Equals("/i2"))
            {
                Response.Redirect("/i2/index");
            }
            if (Request.RawUrl.Equals("/mobile_i2/") || Request.RawUrl.Equals("/mobile_i2"))
            {
                Response.Redirect("/mobile_i2/index");
            }
            //Redirect to https if request is already in http
            if (!CommonHelper.IsHttps(HttpContext.Current))
                CommonHelper.EnsureSsl();

            if (Request["sid"] != null && !Request["sid"].Equals(""))
            {
                CommonHelper.SetCookie("sid", Request["sid"].ToLower(), new TimeSpan(1, 24, 1, 1));
                //clientOrderData.OrderAttributeValues.AddOrUpdateAttributeValue("sid",
                //  new AttributeValue(Request["sid"].ToLower()));
            }
            if (Request["subid"] != null && !Request["subid"].Equals(""))
            {
                CommonHelper.SetCookie("subid", Request["subid"].ToLower(), new TimeSpan(1, 24, 1, 1));
            }
        }

    }
}
