using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;
using CSBusiness;
namespace CSWeb.Shared.UserControls
{
    public partial class Header : System.Web.UI.UserControl
    {
        public string versionName = "";
        public string itemCount = "0";
        public ClientCartContext ClientOrderData;

        protected void Page_Load(object sender, EventArgs e)
        {
            versionName = CSWeb.OrderHelper.GetVersionName();
            ClientOrderData = (ClientCartContext)Session["ClientOrderData"];
            int count = 0;
            foreach (Sku sku in ClientOrderData.CartInfo.CartItems)
            {
                sku.LoadAttributeValues();
                if (sku.Visible)
                {
                    count++;
                }
            }
            itemCount = count.ToString();
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