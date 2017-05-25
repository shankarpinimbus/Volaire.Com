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
            string version = OrderHelper.GetVersionName().ToLower();
            if (!version.Equals("mobile_aa1") && !version.Equals("mobile_a1") && !version.Equals("mobile_f2"))
            {
                if (Request.QueryString.Count > 0)
                    Response.Redirect("/mobile_a1/mega-volume-collection?" + Request.QueryString);
                else
                {
                    Response.Redirect("/mobile_a1/mega-volume-collection");
                }
            }
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            if (OrderHelper.GetVersionName().ToLower().Equals("mobile_b2"))
            {
                OrderHelper.ChangeCart("130");
            }
            else if (OrderHelper.GetVersionName().ToLower().Equals("mobile_e2"))
            {
                OrderHelper.ChangeCart("135");
            }
            else
            {
                OrderHelper.ChangeCart("122");
            }
            Response.Redirect("shine-angel-brush");
        }
    }
}