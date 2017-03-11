using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Shared.UserControls
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetDynamicSidData(string data)
        {
            return DynamicSidDAL.GetDynamicSidData(data);
        }
        public string GetCleanPhoneNumber(string data)
        {
            return OrderHelper.GetCleanPhoneNumber(data);
        }
    }
}