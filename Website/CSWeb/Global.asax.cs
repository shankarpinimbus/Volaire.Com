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
            //Redirect to https if request is already in http
            if (!CommonHelper.IsHttps(HttpContext.Current))
                CommonHelper.EnsureSsl();
        }

    }
}
