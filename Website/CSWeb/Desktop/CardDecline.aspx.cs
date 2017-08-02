using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.Desktop
{
    public partial class CardDecline : ShoppingCartBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (OrderHelper.GetVersionName().ToLower().Contains("g2"))
            {
                HttpContext.Current.Response.Redirect("/index");
            }
        }
    }
}