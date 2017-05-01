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
            string version = OrderHelper.GetVersionName().ToLower();
            if (!version.Equals("b2") && !version.Equals("b3") && !version.Equals("aa1"))
            {
                if (Request.QueryString.Count > 0)
                    Response.Redirect("/b2/tv-introductory-offer?" + Request.QueryString);
                else
                {
                    Response.Redirect("/b2/tv-introductory-offer");
                }
            }
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("b2") || OrderHelper.GetVersionName().ToLower().Equals("b3"))
            {
                OrderHelper.ChangeCart("128");
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
    }
}