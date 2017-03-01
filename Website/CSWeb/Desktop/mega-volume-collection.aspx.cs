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
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.EmptyCart();
            OrderHelper.ChangeCart("122");
            Response.Redirect("shine-angel-brush");
        }
    }
}