using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using System.Web.UI;
using CSData;
using CSBusiness.CustomerManagement;
using CSWeb.Shared.UserControls;
using CSBusiness.ShoppingManagement;
using CSCore.DataHelper;
using CSBusiness.Resolver;
using CSBusiness.OrderManagement;
using CSBusiness.Web;
using CSBusiness.Attributes;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class index_cart_A : SiteBasePage
    {
        //private int skuId = 30; // TODO: update for client
        
        //private int qId = 1;

        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

        protected override bool DisableBrowserCache
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