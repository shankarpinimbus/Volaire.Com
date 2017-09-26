using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CSBusiness;


namespace CSWeb.Mobile.Store
{
    public partial class receipt : ShoppingCartBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (OrderHelper.GetVersionName().ToLower().Contains("i2") || OrderHelper.GetVersionName().ToLower().Contains("j2")
                || OrderHelper.GetVersionName().ToLower().Contains("jj2"))
            {
                var mainKit = false;
                ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];
                foreach (Sku sku in clientData.CartInfo.CartItems)
                {
                    sku.LoadAttributeValues();
                    if (sku.GetAttributeValue<bool>("isMainKit", false) && sku.SkuId != 120)
                    {
                        mainKit = true;
                    }
                }
                if (mainKit)
                {
                    foreach (Control ctrl in Controls)
                    {
                        if (ctrl.ClientID == "steps_hdr_id")
                        {
                            ctrl.Visible = true;
                        }
                    }
                }
                else
                {
                    foreach (Control ctrl in Controls)
                    {
                        if (ctrl.ClientID == "steps_hdr_id")
                        {
                            ctrl.Visible = false;
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
