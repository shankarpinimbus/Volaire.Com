using CSBusiness;
using CSBusiness.CustomerManagement;
using CSBusiness.ShoppingManagement;

using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSCore.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Attributes;
using System.Configuration;

namespace CSWeb.Shared.UserControls
{
    public partial class AmazonPayment : System.Web.UI.UserControl
    {
        protected int skuId, cId, dId = 0, qId = 1;
        protected Cart cartObject;
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
             
        }
        public void ProcessAmazonOrder()
        {
            ClientCartContext clientData = ClientOrderData;
        
            if (hOrderRefId.Value.Length > 0)
            {
                Session["OrderRefId"] = hOrderRefId.Value;
                
               if(ClientOrderData.CartInfo.CartItems.Count == 0)
                    SetMainSku(118);               

                ClientOrderData = OrderHelper.SaveAmazonOrder(ClientOrderData, (string)Session["OrderRefId"]);                

                if (ClientOrderData.OrderId > 0)
                    OrderProcessor.ProcessOrderAndRedirect(ClientOrderData.OrderId);
                    //Response.Redirect("PostSale");
                else
                {
                    lblPrompt.Text = ClientOrderData.OrderId.ToString() + ClientOrderData.CustomerInfo.StateProvinceId +
                                     ClientOrderData.CustomerInfo.CountryId;
                    lblPrompt.Visible = true;

                }
                ClientOrderData = clientData;
                //Response.Redirect("PostSale.aspx");

            }
            else
            {
                lblPrompt.Text = "There is no amazon order reference id";
                lblPrompt.Visible = true;
            }
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {

            ProcessAmazonOrder();
        }

        //private bool Validate()
        //{
        //    if (!chkSinglePay.Checked)
        //    {
        //        lblPrompt.Visible = true;
        //        return false;
        //    }
        //    return true;
        //}

        private void SetMainSku(int skuId)
        {
            ClientOrderData.CartInfo.CartItems.Clear();
            ClientOrderData.CartInfo.AddItem(skuId, 1, true, false);
            ClientOrderData.CartInfo.Compute();
        }
    }
}