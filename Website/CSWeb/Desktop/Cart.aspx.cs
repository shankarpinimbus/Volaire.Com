using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class cart : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (OrderHelper.GetVersionName().ToLower().Contains("g2"))
            {
                 HttpContext.Current.Response.Redirect("/index");
            }
            base.Page_Load(sender, e);
        }
    }
}