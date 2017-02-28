using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using System.Web.UI.HtmlControls;
using CSBusiness.Attributes;
using CSBusiness.OrderManagement;
using CSBusiness.Preference;
using CSBusiness.Resolver;
using CSBusiness.Shipping;
using CSBusiness.ShoppingManagement;

namespace CSWeb.Shared.UserControls
{
    public partial class ReviewOrder : System.Web.UI.UserControl
    {

        public event EventHandler UpdateCart;

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

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }

        public ShoppingCartDisplayTotalMode TotalMode
        {
            get
            {
                return ViewState["TotalMode"] == null ? ShoppingCartDisplayTotalMode.Full : (ShoppingCartDisplayTotalMode)ViewState["TotalMode"];
            }
            set
            {
                ViewState["TotalMode"] = value;
            }
        }

        public ShoppingCartQuanityMode QuantityMode
        {
            get
            {
                return ViewState["QuantityMode"] == null ? ShoppingCartQuanityMode.Readonly : (ShoppingCartQuanityMode)ViewState["QuantityMode"];
            }
            set
            {
                ViewState["QuantityMode"] = value;
            }
        }

        public bool HideRemoveButton
        {
            get
            {
                return (bool)(ViewState["HideRemoveButton"] ?? false);
            }
            set
            {
                ViewState["HideRemoveButton"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                BindControls();
                ProcessOrder();
            }
        }

        public void BindControls()
        {
            if (CartContext.CartInfo.CartItems.Count > 0)
            {
                rptShoppingCart.DataSource = CartContext.CartInfo.CartItems.FindAll(x => x.Visible == true);
                rptShoppingCart.DataBind();

                pnlTotal.Visible = true;

                lblSubtotal.Text = String.Format("${0:0.00}", CartContext.CartInfo.SubTotal);
                lblTax.Text = String.Format("${0:0.00}", CartContext.CartInfo.TaxCost);
                lblShipping.Text = String.Format("${0:0.00}", CartContext.CartInfo.ShippingCost);
                lblRushShipping.Text = String.Format("${0:0.00}", CartContext.CartInfo.RushShippingCost);
                lblOrderTotal.Text = String.Format("${0:0.00}", CartContext.CartInfo.Total);

                //Sri Comments on 11/15: Need to Plug-in to Custom Shipping option Model
                SitePreference shippingGetShippingPref = CSFactory.GetCacheSitePref();
                holderRushShipping.Visible = shippingGetShippingPref.IncludeRushShipping ?? false;
                holderRushShippingTotal.Visible = chkIncludeRushShipping.Checked = (CartContext.CartInfo.ShippingMethod == UserShippingMethodType.Rush);
            }
            else
            {
                pnlTotal.Visible = false;
                rptShoppingCart.Visible = false;
            }

        }

        protected void rptShoppingCart_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblSkuCode = e.Item.FindControl("lblSkuCode") as Label;
                Label lblSkuDescription = e.Item.FindControl("lblSkuDescription") as Label;
                TextBox txtQuantity = e.Item.FindControl("txtQuantity") as TextBox;
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;
                Label lblSkuInitialPrice = e.Item.FindControl("lblSkuInitialPrice") as Label;
                ImageButton btnRemoveItem = e.Item.FindControl("btnRemoveItem") as ImageButton;
                HtmlContainerControl holderQuantity = e.Item.FindControl("holderQuantity") as HtmlContainerControl;
                HtmlContainerControl holderRemove = e.Item.FindControl("holderRemove") as HtmlContainerControl;
                Image imgProduct = e.Item.FindControl("imgProduct") as Image;
                HiddenField hidSkuId = e.Item.FindControl("hidSkuId") as HiddenField;
                DropDownList ddlQty = e.Item.FindControl("ddlQty") as DropDownList;
                Label lblShippingPrice = e.Item.FindControl("lblShippingPrice") as Label;
                Sku cartItem = e.Item.DataItem as Sku;
                hidSkuId.Value = CSCore.Utils.CommonHelper.Encrypt(Convert.ToString(cartItem.SkuId));
                lblSkuDescription.Text = cartItem.ShortDescription;
                lblQuantity.Text = txtQuantity.Text = cartItem.Quantity.ToString();
                lblSkuInitialPrice.Text = String.Format("${0:0.##}", cartItem.InitialPrice);
                if (cartItem.ImagePath != null && cartItem.ImagePath.Length > 0)
                {
                    imgProduct.ImageUrl = cartItem.ImagePath;
                    lblSkuCode.Visible = false;
                }
                else
                {
                    imgProduct.Visible = false;
                    lblSkuCode.Text = cartItem.SkuCode.ToString();
                }
                lblShippingPrice.Text = OrderHelper.CalculateSkuBaseShipping(cartItem.SkuId).ToString("n2");
                cartItem.LoadAttributeValues();

                if (cartItem.GetAttributeValue<bool>("isMainKit", false))
                    btnRemoveItem.Visible = false;

                btnRemoveItem.CommandArgument = cartItem.SkuId.ToString();

                txtQuantity.Attributes["onchange"] = Page.ClientScript.GetPostBackEventReference(refresh, "");
                lblQuantity.Visible = false;
                ddlQty.SelectedValue = cartItem.Quantity.ToString();
                //switch (QuantityMode)
                //{
                //    case ShoppingCartQuanityMode.Hidden:
                //        holderQuantity.Visible = false;
                //        break;
                //    case ShoppingCartQuanityMode.Editable:
                //        lblQuantity.Visible = false;
                //        break;
                //    case ShoppingCartQuanityMode.Readonly:
                //        txtQuantity.Visible = false;
                //        break;
                //    default:
                //        break;
                //}

                if (HideRemoveButton)
                {
                    holderRemove.Visible = false;
                }
            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                HtmlContainerControl holderHeaderQuantity = e.Item.FindControl("holderHeaderQuantity") as HtmlContainerControl;
                HtmlContainerControl holderHeaderRemove = e.Item.FindControl("holderHeaderRemove") as HtmlContainerControl;
                if (QuantityMode == ShoppingCartQuanityMode.Hidden)
                {
                    holderHeaderQuantity.Visible = false;
                }

                if (HideRemoveButton)
                {
                    holderHeaderRemove.Visible = false;
                }
            }
        }

        protected void rptShoppingCart_OnItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    {
                        SkuManager skuManager = new SkuManager();
                        int skuToRemove = Convert.ToInt32(e.CommandArgument);
                        Sku s = skuManager.GetSkuByID(skuToRemove);
                        s.LoadAttributeValues();
                        CartContext.CartInfo.UpdateSku(skuToRemove);
                        BindControls();
                        if (UpdateCart != null)
                            UpdateCart(sender, e);

                        //if (s.GetAttributeValue<string>("title",string.Empty).ToLower().Equals("tpillow"))
                        //{
                        //    ibTPillow.Enabled = true;
                        //    ibTPillow.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/wonderflex/images/btn_addtocart.png";
                        //}
                        //if (s.GetAttributeValue<string>("title", string.Empty).ToLower().Equals("additional"))
                        //{
                        //    ibAdditioanl.Enabled = true;
                        //    ibAdditioanl.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/wonderflex/images/btn_addtocart.png";
                        //}
                    }
                    break;
                default:
                    break;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            holderTaxAndShipping.Visible = TotalMode == ShoppingCartDisplayTotalMode.Full;
        }

        protected void chkIncludeRushShipping_OnCheckedChanged(object sender, EventArgs e)
        {
            CartContext.CartInfo.ShippingMethod = chkIncludeRushShipping.Checked ? UserShippingMethodType.Rush : UserShippingMethodType.Standard;
            CartContext.CartInfo.Compute();
            BindControls();
        }

        protected void OnTextChanged_Changed(object sender, EventArgs e)
        {
            TextBox txtQuantity = (TextBox)sender;
            RepeaterItem item = (RepeaterItem)txtQuantity.NamingContainer;
            ImageButton btnRemoveItem = item.FindControl("btnRemoveItem") as ImageButton;

            int skuID = Convert.ToInt32(btnRemoveItem.CommandArgument);
            Sku cartItem = CartContext.CartInfo.CartItems.FirstOrDefault(c => c.SkuId == skuID);
            int newQuantity = 0;
            if (int.TryParse(txtQuantity.Text, out newQuantity))
                cartItem.Quantity = newQuantity;
            CartContext.CartInfo.Compute();
            BindControls();
            if (UpdateCart != null)
                UpdateCart(sender, e);
        }


        //protected void ibOnePay_OnClick(object sender, ImageClickEventArgs e)
        //{
        //    ImageButton btn = (ImageButton)(sender);
        //    string btnArgs = btn.CommandArgument;

        //    if (btnArgs.Equals("Additional"))
        //    {
        //        btnArgs = rblAdditionalKits.SelectedValue;
        //    }

        //    OrderHelper.ChangeCart(btnArgs);

        //    btn.Enabled = false;
        //    btn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/wonderflex/images/btn_added.png";

        //    BindControls();
        //    if (UpdateCart != null)
        //        UpdateCart(sender, e);
        //}

        protected void ddlQty_SelectedIndexChanged1(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            RepeaterItem ri = ddl.NamingContainer as RepeaterItem;
            if (ri != null)
            {
                int skuid = -1;
                int qty = 1;

                TextBox tb = ri.FindControl("txtQuantity") as TextBox;
                if (tb != null)
                {
                    tb.Text = ddl.SelectedValue;
                    qty = Convert.ToInt32(ddl.SelectedValue);
                }

                HiddenField hidSkuId = ri.FindControl("hidSkuId") as HiddenField;
                if (hidSkuId != null)
                {
                    skuid = int.Parse(CSCore.Utils.CommonHelper.Decrypt(hidSkuId.Value));
                }

                if (skuid > 0)
                {
                    ClientCartContext cartContext = ClientOrderData;
                    cartContext.CartInfo.AddOrUpdate(skuid, qty, true, false, false);
                    cartContext.CartInfo.Compute();
                    ClientOrderData = cartContext;

                }
            }
            BindControls();
        }

        protected void ProcessOrder()
        {
            if (ClientOrderData.OrderAttributeValues.ContainsKey("amazonrefid") && ClientOrderData.OrderAttributeValues.GetAttributeValue("AmazonRefID") != null)
            {
                ClientOrderData = OrderHelper.SaveAmazonOrder(ClientOrderData, (string)Session["OrderRefId"]);

                if (ClientOrderData.OrderId > 0)
                    OrderProcessor.ProcessOrderAndRedirect(ClientOrderData.OrderId);//Response.Redirect("PostSale");
            }
            else
            {
                if (CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.InstantOrderProcess)
                {
                    int orderId = CSResolve.Resolve<IOrderService>().SaveOrder(ClientOrderData);

                    ClientOrderData.OrderId = orderId;
                    //clientData.ResetData();
                    Session["ClientOrderData"] = ClientOrderData;
                }

                Response.Redirect("PostSale.aspx");

            }
        }

        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            ProcessOrder();
        }


    }
}