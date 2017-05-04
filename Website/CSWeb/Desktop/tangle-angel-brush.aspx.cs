using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class tangleangelbrush : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string version = OrderHelper.GetVersionName().ToLower();
            if (!version.Equals("b2") && !version.Equals("b3") && !version.Equals("aa1") && !version.Equals("e2"))
            {
                if (Request.QueryString.Count > 0)
                    Response.Redirect("/b2/tangle-angel-brush?" + Request.QueryString);
                else
                {
                    Response.Redirect("/b2/tangle-angel-brush");
                }
            }
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            OrderHelper.ChangeCart("127");
            Response.Redirect("cart");
        }
    }
}