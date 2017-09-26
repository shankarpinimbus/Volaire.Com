using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class tvintroductoryoffer : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.RedirectDesktop();
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("b2") || OrderHelper.GetVersionName().ToLower().Equals("b3") || OrderHelper.GetVersionName().ToLower().Equals("b4"))
            {
                OrderHelper.ChangeCart("128");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("h2")
                || OrderHelper.GetVersionName().ToLower().Equals("ee2"))
            {
                OrderHelper.ChangeCart("133");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("i2") || OrderHelper.GetVersionName().ToLower().Equals("j2")
                     || OrderHelper.GetVersionName().ToLower().Equals("jj2"))
            {
                OrderHelper.ChangeCart("159");
            }
            else
            {
                OrderHelper.ChangeCart("120");
            }

            if (OrderHelper.GetVersionName().ToLower().Equals("c2") || OrderHelper.GetVersionName().ToLower().Equals("b3"))
            {
                Response.Redirect("cart");
            }
            else
            {
                Response.Redirect("mega-volume-collection");
            }
            
        }

        protected void btnAddtoCartE2_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            Button btn = (Button)(sender);
            string btnArgs = btn.CommandArgument;
            OrderHelper.ChangeCart(btnArgs);
            if (OrderHelper.GetVersionName().ToLower().Equals("e3"))
            {
                Response.Redirect("cart");
            }
            else
            {
                Response.Redirect("mega-volume-collection");
            }
            //Response.Redirect("mega-volume-collection");
        }
    }
}