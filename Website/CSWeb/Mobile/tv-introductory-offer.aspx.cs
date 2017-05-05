using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Mobile
{
    public partial class tvintroductoryoffer : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string version = OrderHelper.GetVersionName().ToLower();
            if (!version.Equals("mobile_b2") && !version.Equals("mobile_b3") && !version.Equals("mobile_aa1") && !version.Equals("mobile_e2"))
            {
                if (Request.QueryString.Count > 0)
                    Response.Redirect("/mobile_b2/tv-introductory-offer?" + Request.QueryString);
                else
                {
                    Response.Redirect("/mobile_b2/tv-introductory-offer");
                }
            }
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("mobile_b2") || OrderHelper.GetVersionName().ToLower().Equals("mobile_b3"))
            {
                OrderHelper.ChangeCart("128");
            }
            else
            {
                OrderHelper.ChangeCart("120");
            }
            if (OrderHelper.GetVersionName().ToLower().Equals("mobile_c2") || OrderHelper.GetVersionName().ToLower().Equals("mobile_b3"))
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
            Response.Redirect("mega-volume-collection");
        }
    }
}