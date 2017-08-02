using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace CSWeb.Desktop
{
    public partial class receipt : ShoppingCartBasePage
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
