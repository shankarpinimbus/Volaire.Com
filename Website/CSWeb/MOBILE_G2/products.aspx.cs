using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using CSBusiness.Attributes;
using System.Web;
using CSBusiness.Web;
using CSWebBase;


namespace CSWeb.Mobile
{
    public partial class products : SiteBasePage
    {
        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

    }
}