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
    public partial class MiniCart : System.Web.UI.UserControl
    {
        public string versionName = "";
        public string itemCount = "0";
        public decimal remainingAmount = 0;
        public event EventHandler UpdateCart;

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }


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
				return (bool) ( ViewState["HideRemoveButton"] ?? false);
			}
			set
			{
				ViewState["HideRemoveButton"] = value;
			}
		}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["regerateurl"] == "true")
            {
                if (Request["skuid_g"] != null && Request["skuid_g"] != "")
                {
                    var skus = Request["skuid_g"].ToString();
                    var skuids = skus.Split(',');
                    for (int i = 0; i < skuids.Length; i++)
                    {
                        if (skuids[i] != "")
                        {
                            var flag = IsDigitsOnly(skuids[i]);
                            if (flag)
                            {
                                if (Convert.ToInt32(skuids[i]) != 153 && Convert.ToInt32(skuids[i]) != 154)
                                {
                                    ClientOrderData.CartInfo.AddOrUpdate(Convert.ToInt32(skuids[i]), 1, true, false, false);
                                }
                            }
                        }
                    }

                }
            }

            versionName = CSWeb.OrderHelper.GetVersionName();
            if (IsPostBack)
            {
                BindControls();
                if (!(Request.Url.ToString().ToLower().Contains("cart.aspx")))
                {
                   // MinCrt.Visible = true;
                }

            }

            if (!Page.IsPostBack)
            { 
                
                BindControls();   
            }
        }

        public void CallBindControl()
        {
            BindControls();
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
                    skuid = int.Parse((hidSkuId.Value));
                }

                if (skuid > 0)
                {
                    ClientCartContext cartContext = ClientOrderData;
                    cartContext.CartInfo.AddOrUpdate(skuid, qty, true, false, false);
                    cartContext.CartInfo.Compute();
                    ClientOrderData = cartContext;

                }
            }
            bool flag = false;
            foreach (Sku sku in ClientOrderData.CartInfo.CartItems)
            {
                if (sku.SkuId >= 138) // g2 individual products
                {
                    flag = true;
                }
            }
            if (flag)
            {
                SiteBasePage.SetCatalogShipping();
            }
            BindControls();
        }

        public void BindControls()
        {
            if (Request["regerateurl"] == "true")
            {
                if (Request["skuid_g"] != null && Request["skuid_g"] != "")
                {
                    var skus = Request["skuid_g"].ToString();
                    var skuids = skus.Split(',');
                    for (int i = 0; i < skuids.Length; i++)
                    {
                        if (skuids[i] != "")
                        {
                            var flag = IsDigitsOnly(skuids[i]);
                            if (flag)
                            {
                                if (Convert.ToInt32(skuids[i]) != 153 && Convert.ToInt32(skuids[i]) != 154)
                                {
                                    ClientOrderData.CartInfo.AddOrUpdate(Convert.ToInt32(skuids[i]), 1, true, false, false);
                                }
                            }
                        }
                    }
                    ClientOrderData.CartInfo.RemoveSku(0);
                }
            }
            int qty = 0;
            if (CartContext.CartInfo.CartItems.Count > 0)
            {
                bool mainKit = false;
                foreach (Sku sku in CartContext.CartInfo.CartItems)
                {
                    sku.LoadAttributeValues();
                    if (sku.GetAttributeValue<bool>("isMainKit", false))
                    {
                        mainKit = true;
                        qty += sku.Quantity;
                    }
                }

                if (mainKit)
                {
                    
                    if (CartContext.CartInfo.DiscountCode.Length > 0)
                    {
                        CartContext.CartInfo.DiscountCode = "";
                        CartContext.CartInfo.Compute();
                    }
                    //dfreeGift.Visible = true;
                    //imgOffer.Visible = false;
                    //hPromoCode.Visible = false;
                    //pnlDiscount.Visible = true;
                    //ltQty.Text = qty.ToString();


                }
                else
                {
                    
                }
                rptShoppingCart.DataSource = CartContext.CartInfo.CartItems.FindAll(x => x.Visible == true);
                rptShoppingCart.DataBind();
                //If the main kit is removed,since the promo code 'first15' must be applied to only catalog products, calling the function again to update the discount
                if (!string.IsNullOrEmpty(CartContext.CartInfo.DiscountCode))
                {
                    if (CartContext.CartInfo.DiscountCode.ToUpper() == "FIRST15")
                    {
                        CustomDiscountCalculator cd = new CustomDiscountCalculator();
                        cd.CalculateDiscount(CartContext.CartInfo);
                    }
                }
               

                if (CartContext.CartInfo.DiscountCode.Length > 0)
                {
                    
                }
                

               
                

                //Sri Comments on 11/15: Need to Plug-in to Custom Shipping option Model
                SitePreference shippingGetShippingPref = CSFactory.GetCacheSitePref();
               
            }
            else
            {
               
                rptShoppingCart.Visible = false;
            }
            Session["RegenerateUrl"] = RegenerateCartUrl();
        }

        bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }

            return true;
        }

        private string RegenerateCartUrl()
        {
            var regenerateCartUrl = "";
            regenerateCartUrl = Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, "/" + OrderHelper.GetVersionName() + "/" + "cart.aspx?" + "regerateurl=true&skuid_g=");
            foreach (Sku item in ClientOrderData.CartInfo.CartItems)
            {
                regenerateCartUrl = regenerateCartUrl + item.SkuId.ToString() + ",";
            }
            return regenerateCartUrl;
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
                Label lblTotalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                ImageButton btnRemoveItem = e.Item.FindControl("btnRemoveItem") as ImageButton;
                HtmlContainerControl holderQuantity = e.Item.FindControl("holderQuantity") as HtmlContainerControl;
                HtmlContainerControl holderRemove = e.Item.FindControl("holderRemove") as HtmlContainerControl;
                Image imgProduct = e.Item.FindControl("imgProduct") as Image;

                Sku cartItem = e.Item.DataItem as Sku;
                cartItem.LoadAttributeValues();
                lblSkuDescription.Text = cartItem.ShortDescription;
                lblQuantity.Text = txtQuantity.Text = cartItem.Quantity.ToString();
                lblSkuInitialPrice.Text = String.Format("${0:0.00}", cartItem.InitialPrice);
                lblTotalPrice.Text = String.Format("${0:0.00}", (cartItem.InitialPrice * cartItem.Quantity));
                if (cartItem.ImagePath != null && cartItem.ImagePath.Length > 0)
                {
                    imgProduct.ImageUrl = cartItem.ImagePath;
                    lblSkuCode.Visible = false;
                }
                else
                {
                    imgProduct.Visible = false;
                    if (!OrderHelper.GetVersionName().ToLower().Contains("g2") && !OrderHelper.GetVersionName().ToLower().Contains("i2") && !OrderHelper.GetVersionName().ToLower().Contains("j2")
                        && !OrderHelper.GetVersionName().ToLower().Contains("k2"))
                    {
                        lblSkuCode.Text = cartItem.SkuCode.ToString();
                    }
                }
                DropDownList ddlQty = e.Item.FindControl("ddlQty") as DropDownList;
                HiddenField hidSkuId = e.Item.FindControl("hidSkuId") as HiddenField;
                hidSkuId.Value = cartItem.SkuId.ToString();
                ddlQty.SelectedValue = cartItem.Quantity.ToString();

                if (OrderHelper.GetVersionName().ToLower().Contains("g2"))
                {
                    // for this version, qty can be maximum of 9 
                    ddlQty.Items.Clear();
                    ddlQty.Items.Add(new ListItem("1", "1"));
                    ddlQty.Items.Add(new ListItem("2", "2"));
                    ddlQty.Items.Add(new ListItem("3", "3"));
                    ddlQty.Items.Add(new ListItem("4", "4"));
                    ddlQty.Items.Add(new ListItem("5", "5"));
                    ddlQty.Items.Add(new ListItem("6", "6"));
                    ddlQty.Items.Add(new ListItem("7", "7"));
                    ddlQty.Items.Add(new ListItem("8", "8"));
                    ddlQty.Items.Add(new ListItem("9", "9"));
                    ddlQty.SelectedValue = cartItem.Quantity.ToString();
                }
                btnRemoveItem.CommandArgument = cartItem.SkuId.ToString();
                btnRemoveItem.Visible = false;
                txtQuantity.Attributes["onchange"] = Page.ClientScript.GetPostBackEventReference(refresh, "");

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

                //if (HideRemoveButton)
                //{
                //    holderRemove.Visible = false;
                //}


                //if (!cartItem.GetAttributeValue<bool>("isMainKit", false))
                //{
                //    holderRemove.Visible = true;
                //    ddlQty.Visible = true;
                //    lblQuantity.Visible = false;
                //}
                //else
                //{
                    ddlQty.Visible = false;
                    lblQuantity.Visible = true;
                //}
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
                        int skuToRemove = Convert.ToInt32(e.CommandArgument);
                        CartContext.CartInfo.UpdateSku(skuToRemove);
                        Sku sku = new SkuManager().GetSkuByID(skuToRemove);
                        sku.LoadAttributeValues();
                        var removeSkus = sku.GetAttributeValue<string>("removeSku", string.Empty).Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string removeSku in removeSkus)
                        {
                            if (CartContext.CartInfo.SkuExists(int.Parse(removeSku)))
                            {
                                CartContext.CartInfo.UpdateSku(int.Parse(removeSku));
                                Sku skuRemove = new SkuManager().GetSkuByID(int.Parse(removeSku));
                                skuRemove.LoadAttributeValues();
                                var replaceSkus = skuRemove.GetAttributeValue<string>("replaceSku", string.Empty).Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                                foreach (string replaceSku in replaceSkus)
                                {
                                    OrderHelper.ChangeCart(replaceSku);
                                }
                            }
                            
                        }
                        bool flag = false;
                        foreach (Sku sku1 in ClientOrderData.CartInfo.CartItems)
                        {
                            if ((sku1.SkuId >= 138 && sku1.SkuId <= 152) || sku1.SkuId == 161) // g2 individual products
                            {
                                flag = true;
                            }
                        }
                        if (flag)
                        {
                            SiteBasePage.SetCatalogShipping();
                        }
                        BindControls();
						if (UpdateCart != null)
							UpdateCart(sender, e);
                        Response.Redirect(Request.RawUrl);
                    }
                    break;
                default:
                    break;
            }
        }

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);
			
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
			if(UpdateCart != null)
				UpdateCart(sender, e);
		}
    }


}