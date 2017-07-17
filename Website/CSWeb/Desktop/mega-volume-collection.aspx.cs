using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class megavolumecollection : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.RedirectDesktop();
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("b2") || OrderHelper.GetVersionName().ToLower().Equals("b4"))
            {
                OrderHelper.ChangeCart("130");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("e2") || OrderHelper.GetVersionName().ToLower().Contains("get"))
            {
                OrderHelper.ChangeCart("135");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("h2"))
            {
                OrderHelper.ChangeCart("155");
            }
            else
            {
                OrderHelper.ChangeCart("122");
            }
            
            Response.Redirect("shine-angel-brush");
        }
    }
}