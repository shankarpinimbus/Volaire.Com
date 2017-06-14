using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Shipping;
using CSBusiness.ShoppingManagement;
using CSBusiness.Web;
using CSCore.Utils;
using CSWebBase;
using CSBusiness;
using CSBusiness.Resolver;
using CSCore;

namespace CSWeb
{
    public partial class ProductDetail : SiteBasePage
    {
        public ClientCartContext clientData;
        protected string ImgLarge
        {
            get
            {
                return Convert.ToString(ViewState["ImgLarge"] ?? string.Empty);
            }
            set
            {
                ViewState["ImgLarge"] = value;
            }
        }

        public int skuID = 0;
        public string imagePath = "";
        public int SkuId
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["PId"] ?? "0");
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string qs = "";
            try
            {
                qs = Request.QueryString["skuID"];
            }
            catch
            { }
            string pageName = qs; ;//Page.RouteData.Values["pageName"] as string;
            if (!String.IsNullOrEmpty(pageName))
            {
                Sku sku = CSResolve.Resolve<ISkuService>().GetSkuByID(Convert.ToInt32(pageName));
                sku.LoadAttributeValues();

                List<Sku> skus = CSResolve.Resolve<ISkuService>().GetAllSkus();
                for (int i = 0; i < skus.Count; i++)
                {
                    if (!skus[i].AttributeValuesLoaded)
                        skus[i].LoadAttributeValues();

                    //if (pageName.Equals(skus[i].GetAttributeValue<string>("skuRoutingName", string.Empty).Trim().ToLower()))
                    //{
                    //    skuID = skus[i].SkuId;
                    //    break;
                    //}
                    if (sku.ContainsAttribute("sizeofproduct") && sku.AttributeValues["sizeofproduct"].Value == "small")
                    {
                        if (skus[i].ContainsAttribute("sizeofproduct") && skus[i].AttributeValues["sizeofproduct"].Value =="small" &&(skus[i].AttributeValues["groupname"].Value ==sku.AttributeValues["groupname"].Value))
                        {
                            foreach (var item in skus)
                            {
                                item.LoadAttributeValues();
                                if (item.ContainsAttribute("groupname") && item.AttributeValues["groupname"].Value ==skus[i].AttributeValues["groupname"].Value && (item.ContainsAttribute("sizeofproduct") && item.AttributeValues["sizeofproduct"].Value=="big") )
                                {
                                    pageName = item.SkuId.ToString();
                                }
                            }
                        }
                    }
                    if (pageName.Equals(skus[i].SkuId.ToString()))
                    {
                        skuID = skus[i].SkuId;
                        break;
                    }

                }
            }

            if (!Page.IsPostBack)
            {
                BindControls();
            }

        }

        private void BindControls()
        {
            Sku sku = new Sku();
            if (SkuId > 0)
            {
                sku = CSResolve.Resolve<ISkuService>().GetSkuByID(SkuId);
            }
            else if (skuID > 0)
            {
                sku = CSResolve.Resolve<ISkuService>().GetSkuByID(skuID);
            }
            else
            {
                Response.Redirect("Products.aspx", true);
            }


            if (sku != null)
            {
                if (!sku.AttributeValuesLoaded)
                    sku.LoadAttributeValues();
                bool HideSku = sku.GetAttributeValue("ShowSku", false);
                if (!HideSku)
                {
                    Response.Redirect("Products.aspx", true);
                }
                imgSku.ImageUrl = sku.GetAttributeValue("ProductDetailImage", sku.ImagePath);
                lblSkuTitle.Text = sku.Title;
                lblSkuDescription.Text = sku.LongDescription;
                lblSkuPrice.Text = GetHtmlDecoratedDollarCents(sku.InitialPrice.ToString("C"));
                lblRetailPrice.Text = sku
                    .GetAttributeValue<string>("RetailPrice", sku.InitialPrice.ToString("n2")).Trim();
                //ltDirection.Text = sku
                //    .GetAttributeValue<string>("Directions", string.Empty);
                ltIngredients.Text = sku
                    .GetAttributeValue<string>("Ingredients", string.Empty);
                lblSize.Text = sku.GetAttributeValue<string>("ProductSize", String.Empty);
                ltDetailDescription.Text = sku.GetAttributeValue<string>("DetailDescription", String.Empty);
                imagePath = sku.ImagePath;

                if (sku.ContainsAttribute("sizeofProduct") && sku.AttributeValues["sizeofproduct"].Value!=null)
                {
                    this.chooseSizePanel.Visible = true;
                    if (sku.AttributeValues["sizeofproduct"].Value== "big")
                    {
                        if (sku.SkuId ==144 )
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = true;
                            this.bigSizeSelectButton.Text = "NET WT. 8.0 OZ.";
                            this.smallSizeSelectButton.Text = "NET WT. 3.5 OZ.";
                        }
                        else if (sku.SkuId == 148)
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = true;
                            this.bigSizeSelectButton.Text = "NET WT. 10.1 OZ.";
                            this.smallSizeSelectButton.Text = "NET WT. 4.0 OZ.";
                        }
                        else if (sku.SkuId == 140)
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = false;
                            this.bigSizeSelectButton.Text = "ONE SIZE";
                            this.bigSizeSelectButton.Enabled = false;
                        }
                        else if (sku.SkuId == 142)
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = true;
                            this.bigSizeSelectButton.Text = "6.0 FL. OZ.";
                            this.smallSizeSelectButton.Text = "2.0 FL OZ.";
                        }
                        else if (sku.SkuId == 146)
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = true;
                            this.bigSizeSelectButton.Text = "NET WT. 10.5 OZ.";
                            this.smallSizeSelectButton.Text = "NET WT. 4.0 OZ.";
                        }
                        else if (sku.SkuId == 139)
                        {
                            this.bigSizeSelectButton.Visible = true;
                            this.smallSizeSelectButton.Visible = true;
                            this.bigSizeSelectButton.Text = "2.3\"";
                            this.smallSizeSelectButton.Text = "2\"";
                        } 
                    }
                }
                else
                {
                    this.chooseSizePanel.Visible = false;
                    this.productRetailPricePanel.Visible = true;
                    if (sku.SkuId == 149)
                    {
                        this.productValue.Text = "$38.00";
                        this.retailPrice.Text = "$32.00";
                    }
                    else if (sku.SkuId == 150)
                    {
                        this.productValue.Text = "$80.00";
                        this.retailPrice.Text = "$59.00";
                    }
                    else if (sku.SkuId == 151)
                    {
                        this.productValue.Text = "$78.00";
                        this.retailPrice.Text = "$59.00";
                    }
                    else if (sku.SkuId == 152)
                    {
                        this.productValue.Text = "$54.00";
                        this.retailPrice.Text = "$44.00";
                    }
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {



            if (Session["ClientOrderData"] == null)
            {
                clientData = new ClientCartContext();
                clientData.CartInfo = new Cart();
            }
            else
            {
                clientData = (ClientCartContext)Session["ClientOrderData"];
                if (clientData.CartInfo == null)
                {
                    clientData.CartInfo = new CSBusiness.ShoppingManagement.Cart();
                    clientData.CartInfo.ShippingAddress = new CSBusiness.CustomerManagement.Address();
                }
            }

            if (SkuId > 0)
            {
                clientData.CartInfo.AddItem(SkuId, Convert.ToInt32(ddlQuantity.SelectedValue), true, false);
            }
            else if (skuID > 0)
            {
                clientData.CartInfo.AddItem(skuID, Convert.ToInt32(ddlQuantity.SelectedValue), true, false);
            }


            //clientData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
            SiteBasePage.SetCatalogShipping();
            clientData.CartInfo.Compute();
            clientData.CartInfo.ShowQuantity = false;

            Session["ClientOrderData"] = clientData;

            Response.Redirect("cart.aspx");
        }
    }
}