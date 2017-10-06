using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Mobile
{
    public partial class megavolumecollection : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.RedirectMobile();
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("mobile_b2") || OrderHelper.GetVersionName().ToLower().Equals("mobile_b4"))
            {
                OrderHelper.ChangeCart("130");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("mobile_e2") || OrderHelper.GetVersionName().ToLower().Contains("get"))
            {
                OrderHelper.ChangeCart("135");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("mobile_h2") || OrderHelper.GetVersionName().ToLower().Equals("mobile_ee2"))
            {
                OrderHelper.ChangeCart("155");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("mobile_i2") || OrderHelper.GetVersionName().ToLower().Equals("mobile_j2")
                     || OrderHelper.GetVersionName().ToLower().Equals("mobile_k2")
                || OrderHelper.GetVersionName().ToLower().Equals("mobile_jj2"))
            {
                OrderHelper.ChangeCart("157");
            }
            else
            {
                OrderHelper.ChangeCart("122");
            }
            Response.Redirect("shine-angel-brush");
        }
    }
}