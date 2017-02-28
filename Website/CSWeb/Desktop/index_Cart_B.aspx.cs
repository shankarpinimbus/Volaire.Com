using System;
using System.Collections;
using System.Collections.Generic;
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
    public partial class index_cart_B : SiteBasePage
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
                if (CSBasePage.GetClientDeviceType() == CSBusiness.Enum.DeviceType.Mobile)
                {
                    OrderHelper.MobileRedirect();
                }
            }
        }
    }
}