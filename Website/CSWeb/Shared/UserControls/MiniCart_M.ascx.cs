using System;
using System.Linq;
using System.Web.UI.WebControls;
using CSBusiness;
using System.Web.UI.HtmlControls;
using CSBusiness.Preference;
using CSBusiness.Shipping;
using CSWebBase;

namespace CSWeb.Shared.UserControls
{
    public partial class MiniCart_M : System.Web.UI.UserControl
    {
        public string versionName = "";
        public string itemCount = "0";
        public decimal remainingAmount = 0;
        public decimal subTotal = 0;

        public ClientCartContext ClientOrderData
        {
            get
            {
                return (ClientCartContext)Session["ClientOrderData"];
            }
            set
            {
                Session["ClientOrderData"] = value;
            }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            versionName = CSWeb.OrderHelper.GetVersionName();
            CallBindControl();
        }

        public void CallBindControl()
        {
            MinCrt.Visible = true;
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
            subTotal = ClientOrderData.CartInfo.SubTotal;
            if (ClientOrderData.CartInfo.SubTotal < 50)
            {
                remainingAmount = 50 - ClientOrderData.CartInfo.SubTotal;
                pShipping.Visible = true;
                pFreeShipping.Visible = false;
            }
            else
            {
                pShipping.Visible = false;
                pFreeShipping.Visible = true;
            }
            itemCount = count.ToString();

        }
    }


}