﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.Resolver;
using CSBusiness.Shipping;
using CSBusiness.ShoppingManagement;
using CSCore.Utils;
using CSWebBase;

namespace CSWeb.UserControls
{
    public partial class Products_Mobile : System.Web.UI.UserControl
    {

        private const string SkusSessionKey = "Products.Skus";
        public ClientCartContext clientData;
        public int counter = 1;
        protected Cart cartObject;
        public List<Sku> Skus
        {
            get
            {
                return (List<Sku>)(HttpContext.Current.Session[SkusSessionKey]);
            }
            set
            {
                HttpContext.Current.Session[SkusSessionKey] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //lblMessage.Text = string.Empty;
                Products_Mobile.GetSkus();
                PopulatePage();
            }

        }

        public static List<Sku> GetSkus()
        {
            if (HttpContext.Current.Session[SkusSessionKey] == null)
            {
                List<Sku> skus = CSResolve.Resolve<ISkuService>().GetAllSkus();
                for (int i = 0; i < skus.Count; i++)
                {
                    skus[i].LoadAttributeValues();
                }
                // save Sku list to user's session for future requests
                HttpContext.Current.Session[SkusSessionKey] = skus;
                return skus;
            }
            else
                return (List<Sku>)HttpContext.Current.Session[SkusSessionKey];
        }

        private void PopulatePage()
        {
            PopulateSkuListing(13);
        }

        private void PopulateSkuListing(int skucategory)
        {
            List<Sku> skus = CSResolve.Resolve<ISkuService>().GetAllSkus();
            for (int i = 0; i < skus.Count; i++)
            {
                if (!skus[i].AttributeValuesLoaded)
                    skus[i].LoadAttributeValues();

                if (!skus[i].GetAttributeValue<bool>("ShowSku", false))
                {
                    skus.RemoveAt(i--);
                    continue;
                }
                if (skus[i].ContainsAttribute("sizeofproduct") && skus[i].AttributeValues["sizeofproduct"].Value != "" && skus[i].AttributeValues["sizeofproduct"].Value == "small")
                {
                    skus.Remove(skus[i]);
                }
            }
            //skus.Sort(new SkuSortComparer());
            skus.Sort(delegate(Sku x, Sku y)
            {
                x.LoadAttributeValues();
                y.LoadAttributeValues();
                return Convert.ToInt32(x.AttributeValues["order"].Value.Trim()).CompareTo(Convert.ToInt32(y.AttributeValues["order"].Value.Trim()));
            });
            rptProducts.DataSource = skus.Where(x => x.SkuId >= 141 && x.SkuId <= 148);
            rptProducts.DataBind();

            rptProducts2.DataSource = skus.Where(x => x.SkuId >= 138 && x.SkuId <= 140); ;
            rptProducts2.DataBind();

            rptProducts3.DataSource = skus.Where(x => x.SkuId >= 149 && x.SkuId <= 152); ;
            rptProducts3.DataBind();
        }

        protected string GetItemClass()
        {

            string returnedString = "product_" + counter.ToString(); ;
            if (counter < 3)
                counter++;
            else
                counter = 1;

            return returnedString;
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Sku cartItem = e.Item.DataItem as Sku;
                Image imgProduct = e.Item.FindControl("imgProduct") as Image;
                Label lblSkuTitle = e.Item.FindControl("lblSkuTitle") as Label;
                Label lblSkuDescription = e.Item.FindControl("lblSkuDescription") as Label;
                Label lblSkuInitialPrice = e.Item.FindControl("lblSkuInitialPrice") as Label;
                Label lblRetailPrice = e.Item.FindControl("lblRetailPrice") as Label;


                ImageButton btnViewProduct = e.Item.FindControl("btnViewProduct") as ImageButton;
                Literal litRegularPrice = e.Item.FindControl("litRegularPrice") as Literal;
                LinkButton product_anchor = e.Item.FindControl("product_anchor") as LinkButton;
                LinkButton product_anchor2 = e.Item.FindControl("product_anchor2") as LinkButton;
                Label lblSize = e.Item.FindControl("lblSize") as Label;
                imgProduct.ImageUrl = cartItem.GetAttributeValue("ProductDetailImage", cartItem.ImagePath);
                lblSkuTitle.Text = cartItem.GetAttributeValue<string>("title", cartItem.Title);//cartItem.LongDescription;//cartItem.Title;
                lblSkuDescription.Text = cartItem.GetAttributeValue<string>("SubDescription", cartItem.Title);//cartItem.LongDescription;
                lblSkuInitialPrice.Text = cartItem.InitialPrice.ToString("C");
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);

                decimal regPrice;
                if (decimal.TryParse(cartItem.GetAttributeValue<string>("RetailPrice", cartItem.InitialPrice.ToString("n2")).Trim(), out regPrice))
                    lblRetailPrice.Text = regPrice.ToString("C");

                product_anchor.PostBackUrl = "/" + OrderHelper.GetVersionName() + "/" + cartItem.GetAttributeValue<string>("skuRoutingName", string.Empty).Trim().ToLower();
                product_anchor2.PostBackUrl = "/" + OrderHelper.GetVersionName() + "/" + cartItem.GetAttributeValue<string>("skuRoutingName", string.Empty).Trim().ToLower();
                btnViewProduct.CommandArgument = cartItem.SkuId.ToString();
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);
            }
        }

        protected void rptProducts_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            Sku cartItem = e.Item.DataItem as Sku;

            switch (e.CommandName)
            {
                case "ViewProduct":
                    {
                        int skuId = Convert.ToInt32(e.CommandArgument);
                        DropDownList ddlQuantity = e.Item.FindControl("ddlQuantity") as DropDownList;
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



                        clientData.CartInfo.AddItem(skuId, 1, true, false);
                        //clientData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
                        SiteBasePage.SetCatalogShipping();
                        clientData.CartInfo.Compute();
                        clientData.CartInfo.ShowQuantity = false;

                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("Cart.aspx");
                    }
                    break;
                default:
                    break;
            }
        }
        protected void rptProducts2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Sku cartItem = e.Item.DataItem as Sku;

                Image imgProduct = e.Item.FindControl("imgProduct") as Image;
                Label lblSkuTitle = e.Item.FindControl("lblSkuTitle") as Label;
                Label lblSkuDescription = e.Item.FindControl("lblSkuDescription") as Label;
                Label lblSkuInitialPrice = e.Item.FindControl("lblSkuInitialPrice") as Label;
                Label lblRetailPrice = e.Item.FindControl("lblRetailPrice") as Label;


                ImageButton btnViewProduct = e.Item.FindControl("btnViewProduct") as ImageButton;
                Literal litRegularPrice = e.Item.FindControl("litRegularPrice") as Literal;
                LinkButton product_anchor = e.Item.FindControl("product_anchor") as LinkButton;
                Label lblSize = e.Item.FindControl("lblSize") as Label;

                imgProduct.ImageUrl = cartItem.GetAttributeValue("ProductImage", cartItem.ImagePath);
                lblSkuTitle.Text = cartItem.GetAttributeValue<string>("title", cartItem.Title);//cartItem.LongDescription;//cartItem.Title;
                lblSkuDescription.Text = cartItem.GetAttributeValue<string>("SubDescription", cartItem.Title);//cartItem.LongDescription;
                lblSkuInitialPrice.Text = cartItem.InitialPrice.ToString("C");
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);

                decimal regPrice;
                if (decimal.TryParse(cartItem.GetAttributeValue<string>("RetailPrice", cartItem.InitialPrice.ToString("n2")).Trim(), out regPrice))
                    lblRetailPrice.Text = regPrice.ToString("C");

                product_anchor.PostBackUrl = "/" + OrderHelper.GetVersionName() + "/" + cartItem.GetAttributeValue<string>("skuRoutingName", string.Empty).Trim().ToLower();
                btnViewProduct.CommandArgument = cartItem.SkuId.ToString();
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);

            }
        }

        protected void rptProducts2_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            Sku cartItem = e.Item.DataItem as Sku;
            switch (e.CommandName)
            {
                case "ViewProduct":
                    {
                        int skuId = Convert.ToInt32(e.CommandArgument);
                        DropDownList ddlQuantity = e.Item.FindControl("ddlQuantity") as DropDownList;
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

                        clientData.CartInfo.AddItem(skuId, 1, true, false);
                        //clientData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
                        SiteBasePage.SetCatalogShipping();
                        clientData.CartInfo.Compute();
                        clientData.CartInfo.ShowQuantity = false;

                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("Cart.aspx");
                    }
                    break;
                default:
                    break;
            }
        }


        protected void rptProducts3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Sku cartItem = e.Item.DataItem as Sku;
                Image imgProduct = e.Item.FindControl("imgProduct") as Image;
                Label lblSkuTitle = e.Item.FindControl("lblSkuTitle") as Label;
                Label lblSkuDescription = e.Item.FindControl("lblSkuDescription") as Label;
                Label lblSkuInitialPrice = e.Item.FindControl("lblSkuInitialPrice") as Label;
                Label lblRetailPrice = e.Item.FindControl("lblRetailPrice") as Label;


                ImageButton btnViewProduct = e.Item.FindControl("btnViewProduct") as ImageButton;
                Literal litRegularPrice = e.Item.FindControl("litRegularPrice") as Literal;
                LinkButton product_anchor = e.Item.FindControl("product_anchor") as LinkButton;
                Label lblSize = e.Item.FindControl("lblSize") as Label;

                imgProduct.ImageUrl = cartItem.GetAttributeValue("ProductImage", cartItem.ImagePath);
                lblSkuTitle.Text = cartItem.GetAttributeValue<string>("title", cartItem.Title);//cartItem.LongDescription;//cartItem.Title;
                lblSkuDescription.Text = cartItem.GetAttributeValue<string>("SubDescription", cartItem.Title);//cartItem.LongDescription;
                lblSkuInitialPrice.Text = cartItem.InitialPrice.ToString("C");
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);

                decimal regPrice;
                if (decimal.TryParse(cartItem.GetAttributeValue<string>("RetailPrice", cartItem.InitialPrice.ToString("n2")).Trim(), out regPrice))
                    lblRetailPrice.Text = regPrice.ToString("C");

                product_anchor.PostBackUrl = "/" + OrderHelper.GetVersionName() + "/" + cartItem.GetAttributeValue<string>("skuRoutingName", string.Empty).Trim().ToLower();
                btnViewProduct.CommandArgument = cartItem.SkuId.ToString();
                lblSize.Text = cartItem.GetAttributeValue<string>("ProductSize", String.Empty);

            }
        }

        protected void rptProducts3_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            Sku cartItem = e.Item.DataItem as Sku;
            switch (e.CommandName)
            {
                case "ViewProduct":
                    {
                        int skuId = Convert.ToInt32(e.CommandArgument);
                        DropDownList ddlQuantity = e.Item.FindControl("ddlQuantity") as DropDownList;
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



                        clientData.CartInfo.AddItem(skuId, 1, true, false);
                        //clientData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
                        SiteBasePage.SetCatalogShipping();
                        clientData.CartInfo.Compute();
                        clientData.CartInfo.ShowQuantity = false;

                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("Cart.aspx");
                    }
                    break;
                default:
                    break;
            }
        }
    }
}