using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using CSBusiness.Web;
using CSBusiness;
using CSBusiness.Resolver;
using System.Configuration;
using CSData;
using System.Data.SqlClient;
using CSCore.DataHelper;
using CSBusiness.Preference;
using CSBusiness.Attributes;
using System.Xml.Linq;
using System.IO;
using System.Web.UI.WebControls;

namespace CSWebBase
{
    public class SiteBasePage : CSBasePage
    {
        public static ClientCartContext CartContext
        {
            get
            {
                return HttpContext.Current.Session["ClientOrderData"] != null ? HttpContext.Current.Session["ClientOrderData"] as ClientCartContext : null;
            }
            set { HttpContext.Current.Session["ClientOrderData"] = value; }
        }
        public static string AdminEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["AdminEmail"];
            }
        }
        public static string PayPalToken
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session["PayPalToken"] ?? string.Empty);
            }
            set
            {
                HttpContext.Current.Session["PayPalToken"] = value;
            }
        }

        public static string PayPalInvoice
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session["PayPalInvoice"] ?? string.Empty);
            }
            set
            {
                HttpContext.Current.Session["PayPalInvoice"] = value;
            }
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            AbTestingVersionUpdate updateVersionInfo = new AbTestingVersionUpdate();
            updateVersionInfo.LoadScripts(Page);
            //DataBind is needed for the dynamic file load but will reset repeater and datalist view state. If you are using those controls disable this line and DataBind each page individually. -Mahdi
            if (!IsPostBack)
                DataBind();
            updateVersionInfo.UpdateVersionNameWhileAbTesting();
        }

        public static void SendErrorEmail(string message)
        {
            CSCore.EmailHelper.SendEmail("info@conversionsystems.com", AdminEmail, "[SiteName.Com Error]", message, false);
        }
    }

}
