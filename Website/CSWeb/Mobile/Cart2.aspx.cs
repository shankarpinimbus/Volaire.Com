using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSWebBase;
namespace CSWeb.Mobile.Store
{
    public partial class cart2 : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {           
           
        }

        public string GetCleanPhoneNumber(string data)
        {
            return OrderHelper.GetCleanPhoneNumber(data);
        }



        public string GetDynamicVersionData(string data)
        {
            return OrderHelper.GetDynamicVersionData(data);
        }
    }
}