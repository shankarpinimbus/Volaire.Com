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
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("b2"))
            {
                OrderHelper.ChangeCart("128");
            }
            else
            {
                OrderHelper.ChangeCart("120");
            }

            if (OrderHelper.GetVersionName().ToLower().Equals("c2"))
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