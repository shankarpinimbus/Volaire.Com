using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Configuration;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.Attributes;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSCore.Utils;


namespace CSWeb.Shared.UserControls
{
    public partial class TrackingPixels : System.Web.UI.UserControl
    {
        public Order CurrentOrder = null;
        public string versionName = "";
        public string versionNameReferrer = "";
        public decimal cartTotal = 0;
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
            set { Session["ClientOrderData"] = value; }
        }

        protected override void OnPreRender(EventArgs e)
        {
            SetVirtualUrl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            versionName = CSWeb.OrderHelper.GetVersionName();
            if (versionName == "")
            {
                versionName = "control";
                List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
                CSBusiness.Version item = list.Find(x => x.Title.ToLower() == versionName.ToLower());
                if (item != null)
                    versionName = item.Title.ToUpper();
            }
            //versionNameReferrer = CSWeb.OrderHelper.GetVersionNameByReferrer(CartContext);
            SetHomePagePnl();
            SetHomeAndSubPagesPnl();
            SetCartPagePnl();
            SetAllPagesPnl();
            SetReceiptPagePnl();
            BindGoogleTagManager();
            SetGtmParameters();
            if (Request.Url.ToString().ToLower().Contains("getvolaire"))
            {
                pnlVolaire.Visible = false;
                pnlGetVolaire.Visible = true;
            }
            else
            {
                pnlVolaire.Visible = true;
                pnlGetVolaire.Visible = false;
            }

          string cookieString =  OrderHelper.getCookieString();

        }

        public void SetGtmParameters()
        {
            try
            {
                if (CartContext != null)
                {
                    try
                    {
                        ltOrderId.Text = CartContext.OrderId.ToString();
                        ltEmail.Text = CartContext.CustomerInfo.Email;
                        ltFirstName.Text = CartContext.CustomerInfo.BillingAddress.FirstName;
                        ltLastName.Text = CartContext.CustomerInfo.BillingAddress.LastName;
                    }
                    catch { }

                    ltSubTotal.Text = CartContext.CartInfo.SubTotal.ToString("n2");
                    ltShipping.Text = CartContext.CartInfo.ShippingCost.ToString("n2");
                    ltTotal.Text = (CartContext.CartInfo.SubTotalFullPrice + CartContext.CartInfo.TaxFullPrice + CartContext.CartInfo.ShippingCost).ToString("n2");
                    if (Session["RegenerateUrl"] != null && Session["RegenerateUrl"] != "")
                    {
                        ltReturnUrl.Text = Session["RegenerateUrl"].ToString();
                    }
                    Session["wppoTotal"] = (CartContext.CartInfo.SubTotalFullPrice + CartContext.CartInfo.TaxFullPrice + CartContext.CartInfo.ShippingCost).ToString("n2");
                    ltTax.Text = CartContext.CartInfo.TaxCost.ToString("n2");
                    lttransactionDate.Text = DateTime.Now.ToShortDateString();
                    StringBuilder sbListrakPixel = new StringBuilder();
                    StringBuilder sbListrakPixelCart = new StringBuilder();
                    StringBuilder sbFriendBuy = new StringBuilder();
                    StringBuilder sbGTM = new StringBuilder();
                    StringBuilder sbGTMtransactionProducts = new StringBuilder();
                    StringBuilder sbGTO = new StringBuilder();
                    try
                    {
                        ///////////////////////////////////////////////////////////////////////////////////

                        sbGTO.AppendLine("<div id=\"gts-order\" style=\"display:none;\" translate=\"no\">");
                        sbGTO.AppendLine("<span id=\"gts-o-id\">" + CartContext.OrderId.ToString() + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-domain\">www.legtendzxl.com</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-email\">" + CartContext.CustomerInfo.Email + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-country\">" + CountryManager.CountryCode(CartContext.CustomerInfo.ShippingAddress.CountryId).Trim() + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-currency\">USD</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-total\">" + (CartContext.CartInfo.SubTotalFullPrice + CartContext.CartInfo.TaxFullPrice + CartContext.CartInfo.ShippingCost).ToString("n2") + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-discounts\">0</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-shipping-total\">" + CartContext.CartInfo.ShippingCost.ToString("n2") + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-tax-total\">" + CartContext.CartInfo.TaxFullPrice.ToString("n2") + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-est-ship-date\">" + DateTime.Today.AddDays(3).ToString("yyyy-MM-dd") + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-est-delivery-date\">" + DateTime.Today.AddDays(18).ToString("yyyy-MM-dd") + "</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-has-preorder\">N</span>");
                        sbGTO.AppendLine("<span id=\"gts-o-has-digital\">N</span>");
                        ///////////////////////////////////////////////////////////////////////////////////
                    }
                    catch { }
                    try
                    {
                        sbGTM.AppendLine("'products': [");
                        int productCount = 0;
                        foreach (Sku sku in CartContext.CartInfo.CartItems)
                        {
                            ///////////////////////////////////////////////////////////////////////////////////
                            sbGTO.AppendLine("<span class=\"gts-item\">");
                            sbGTO.AppendLine("<span class=\"gts-i-name\">" + sku.Title.Replace("'", "") + "</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-price\">" + sku.FullPrice.ToString("n2") + "</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-quantity\">" + sku.Quantity + "</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-prodsearch-id\">101739885</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-prodsearch-store-id\">112</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-prodsearch-country\">US</span>");
                            sbGTO.AppendLine("<span class=\"gts-i-prodsearch-language\">en</span>");
                            sbGTO.AppendLine("</span>");
                            ///////////////////////////////////////////////////////////////////////////////////
                            sbGTM.AppendLine("{");
                            sbGTM.AppendLine("'name': '" + sku.Title.Replace("'", "") + "',");
                            sbGTM.AppendLine("'id': '" + sku.SkuCode + "',");
                            sbGTM.AppendLine("'price': '" + sku.FullPrice + "',");
                            sbGTM.AppendLine("'quantity': '" + sku.Quantity + "',");
                            productCount += 1;
                            if (productCount == CartContext.CartInfo.CartItems.Count)
                            {
                                sbGTM.AppendLine("}");
                            }
                            else
                            {
                                sbGTM.AppendLine("},");
                            }
                            sbListrakPixel.AppendLine("_ltk.Order.AddItem('" + sku.SkuCode + "', " + sku.Quantity + ", '" + Math.Round(sku.InitialPrice, 2) + "');");
                            sbListrakPixelCart.AppendLine("_ltk.SCA.AddItemWithLinks('" + sku.SkuCode + "', " + sku.Quantity + ", '" + Math.Round(sku.InitialPrice, 2) + "', '" + sku.Title + "', '" + sku.ImagePath + "', 'index.aspx');"); // one line per item
                            sbFriendBuy.AppendLine("{sku: '" + sku.SkuCode + "',price: '" + sku.FullPrice.ToString("n2") + "',quantity: '" + sku.Quantity + "'}");
                           // sbGTMtransactionProducts.AppendLine("{\"sku\": " + productCount + ",\"name\": \" " + sku.SkuCode + " \",\"price\": \"" + sku.FullPrice.ToString("n2") + "\",\"currency\": \"USD\",\"quantity\": " + sku.Quantity + "},");
                            sku.LoadAttributeValues();
                            var image_url = "";
                            if (sku.ContainsAttribute("bigproductimage1"))
                            {
                                if (sku.AttributeValues["bigproductimage1"] != null)
                                {
                                    image_url = sku.GetAttributeValue<string>("bigproductimage1", "");
                                }
                            }
                            else if (sku.ContainsAttribute("productimage"))
                            {
                                image_url = sku.GetAttributeValue<string>("productimage", "");
                            }
                            else
                            {
                                image_url = sku.ImagePath;
                            }
                            var skuRoutingName = "";
                            if (sku.ContainsAttribute("skuroutingname"))
                            {
                                if (sku.AttributeValues["skuroutingname"] != null)
                                {
                                    skuRoutingName = sku.GetAttributeValue<string>("skuroutingname", "");
                                }
                                else
                                {
                                    skuRoutingName = sku.ImagePath;
                                }
                            }
                            var product_url = Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, "/" + OrderHelper.GetVersionName() + "/" + skuRoutingName);

                            sbGTMtransactionProducts.AppendLine("{\"sku\": " + sku.SkuId + ",\"name\": \" " + sku.Title + " \",\"price\": \"" + sku.FullPrice.ToString("n2") + "\",\"currency\": \"USD\",\"quantity\": " + sku.Quantity + ",\"qty_price\": \" " + sku.Quantity * sku.FullPrice + "\",\"image_url\": \" " + image_url + "\",\"product_url\": \" " + product_url + "\"},");


                        }
                    }
                    catch { }
                    sbGTO.AppendLine("</div>");
                    sbGTM.AppendLine("]");
                    ltGTMSkuItem.Text = sbGTM.ToString();
                    ltSkuItem.Text = sbListrakPixel.ToString();
                    ltCartSkuItem.Text = sbFriendBuy.ToString();
                    ltCustomOrderItem.Text = sbGTO.ToString();
                    ltGTMtransactionProducts.Text = sbGTMtransactionProducts.ToString();
                }
            }
            catch { }

            try
            {
                if (Request.RawUrl.ToLower().Contains("receipt") || Request.RawUrl.ToLower().Contains("postsale"))
                {
                    pnlReceiptPage.Visible = true;
                    if (Session["FirstTime"] == null)
                    {
                        Session["FirstTime"] = "true";
                        ltFirstTime.Text = "true";
                        ltCustomOrderItem.Visible = true;
                    }
                    else
                    {
                        Session["FirstTime"] = "false";
                        ltFirstTime.Text = "false";
                        ltCustomOrderItem.Visible = false;
                    }

                }
                else
                {
                    Session["FirstTime"] = null;
                }

            }
            catch
            {
            }
        }


        public void SetVirtualUrl()
        {
            if (Request.RawUrl.ToLower().Contains("postsale"))
            {
                if (Session["PostSaleLabelName"] != null || !Session["PostSaleLabelName"].ToString().Equals(""))
                {
                    //ltVirtualURL.Text =
                    //    "dataLayer.push({'event':'VirtualPageview','virtualPageURL':'" + OrderHelper.GetDynamicVersionName() + ":" + Session["PostSaleLabelName"].ToString() + "','virtualPageTitle' : '" + OrderHelper.GetDynamicVersionName()  +":" + Session["PostSaleLabelName"].ToString() + "'});";
                    ltvirtualPageURL.Text = OrderHelper.GetDynamicVersionName() + ":" +
                                            Session["PostSaleLabelName"].ToString();
                    ltvirtualPageTitle.Text = OrderHelper.GetDynamicVersionName() + ":" +
                                            Session["PostSaleLabelName"].ToString();
                }
                else
                {
                    ltvirtualPageURL.Text = "";
                    ltvirtualPageTitle.Text = "";
                }
            }
            else
            {
            }
        }

        public void BindGoogleTagManager()
        {
            SetGTM_Parameters(); // this for GoogleTagManager and pnlGoogleTagManager 
            // SetGoogleTagManagerPnl(); // this for GoogleTagManager and pnlGoogleTagManager            
        }
        private void SetGTM_ParametersEmpty(bool landing, bool ecommerce)
        {
            if (landing == false)
            {
                Session["wppoPageTitle"] = "";
                Session["wppoHitsLinkVersionName"] = "";
                Session["wppoCouponCode"] = "";
                Session["wppoPaymentPlan"] = "";
            }
            if (ecommerce == false)
            {
                Session["wppoOrderId"] = "";
                Session["wppoSubTotal"] = "";
                Session["wppoTotal"] = "";
                Session["wppoTax"] = "";
                Session["wppoShipping"] = "";
                Session["wppoGTMSkuItem"] = "";
                Session["wppoOrderDate"] = "";
                //Session["wppoEmailAddress"] = "";
            }
        }
        private void SetGTM_Parameters()
        {
            SetGTM_ParametersEmpty(false, false);
            if (!string.IsNullOrEmpty(CommonHelper.GetCookieString("subid", true)))
            {
                Session["wpposubid"] = CommonHelper.GetCookieString("subid", true);
            }
            else
            {
                Session["wpposubid"] = "";
            }
            string url = Request.Url.AbsolutePath.ToLower();
            if (url.Contains("/index"))
            {
                Session["wppoPageTitle"] = "Home";
            }
            else if (url.Contains("/cartproducts"))
            {
                Session["wppoPageTitle"] = "CartProducts";
            }
            else if (url.Contains("/cart") || url.Contains("/cart1") || url.Contains("/cart2"))
            {
                Session["wppoPageTitle"] = "Cart";
            }
            else if (url.Contains("/postsale"))
            {
                if (Session["PostSaleLabelName"] != null && !Session["PostSaleLabelName"].ToString().Equals(""))
                {
                    Session["wppoPageTitle"] = "UpsellPage : " + Session["PostSaleLabelName"].ToString();
                }
                else
                {
                    Session["wppoPageTitle"] = "UpsellPage";
                }
                SetCurrentOrder();
                Session["wppoOrderId"] = CurrentOrder.OrderId.ToString();
                Session["wppoSubTotal"] = CurrentOrder.FullPriceSubTotal.ToString("N2");
                Session["wppoTotal"] = (CurrentOrder.FullPriceSubTotal + CurrentOrder.FullPriceTax + CurrentOrder.ShippingCost).ToString("N2");
                Session["wppoTax"] = CurrentOrder.Tax.ToString("N2");
                Session["wppoShipping"] = CurrentOrder.ShippingCost.ToString("N2");
                Session["wppoGTMSkuItem"] = GetGoogleTagManagerProducts();
                Session["wppoGTMSkuItemFB"] = GetGoogleTagManagerProductsFB();
                List<Sku> PuckOvenSkus = CurrentOrder.SkuItems;
                Session["wppoPaymentPlan"] = "";
                SetGTM_ParametersEmpty(true, pnlReceiptPage.Visible);   // This is for Test Credit Card dont fire Values
            }
            else if (url.Contains("/receipt"))
            {
                Session["wppoPageTitle"] = "ThankPage";
                Session["wppoOrderId"] = CurrentOrder.OrderId.ToString();
                Session["wppoSubTotal"] = CurrentOrder.FullPriceSubTotal.ToString("N2");
                Session["wppoTotal"] = (CurrentOrder.FullPriceSubTotal + CurrentOrder.FullPriceTax + CurrentOrder.ShippingCost).ToString("N2");
                Session["wppoTax"] = CurrentOrder.Tax.ToString("N2");
                Session["wppoShipping"] = CurrentOrder.ShippingCost.ToString("N2");
                Session["wppoGTMSkuItem"] = GetGoogleTagManagerProducts();
                Session["wppoGTMSkuItemFB"] = GetGoogleTagManagerProductsFB();
                Session["wppoCouponCode"] = CurrentOrder.DiscountCode;
                Session["wppoName"] = CurrentOrder.CustomerInfo.ShippingAddress.FirstName + " " +
                                      CurrentOrder.CustomerInfo.ShippingAddress.LastName;
                List<Sku> PuckOvenSkus = CurrentOrder.SkuItems;
                Session["wppoPaymentPlan"] = "";
                Session["wppoOrderDate"] = CurrentOrder.CreatedDate.AddHours(3).ToString(); // EST Time Zone
                SetGTM_ParametersEmpty(true, pnlReceiptPage.Visible);   // This is for Test Credit Card dont fire Values
            }
            else if (url.Contains("/howitworks"))
            {
                Session["wppoPageTitle"] = "How It Works";
            }
            else if (url.Contains("/faq"))
            {
                Session["wppoPageTitle"] = "FAQS";
            }
            else if (url.Contains("/reviews"))
            {
                Session["wppoPageTitle"] = "Reviews";
            }
            else if (url.Contains("/terms"))
            {
                Session["wppoPageTitle"] = "Terms and Conditions";
            }
            else if (url.Contains("/privacy"))
            {
                Session["wppoPageTitle"] = "Privacy Policy";
            }
            else if (url.Contains("/contact"))
            {
                Session["wppoPageTitle"] = "Contact Us";
            }
            else if (url.Contains("/writereview"))
            {
                Session["wppoPageTitle"] = "Write Reviews";
            }
            else if (url.Contains("/error"))
            {
                Session["wppoPageTitle"] = "Error Page";
            }
            else
            {
                Session["wppoPageTitle"] = "ExtensionPage";
            }
            Session["wppoHitsLinkVersionName"] = versionName;
            try
            {
                Session["wppoEmailAddress"] = CartContext.CustomerInfo.Email ?? string.Empty;
            }
            catch
            {
                Session["wppoEmailAddress"] = string.Empty;
            }


        }
        private string GetGoogleTagManagerProducts()
        {
            int counter = 1;
            // StringBuilder sbGTM_Products = new StringBuilder();
            StringBuilder sbGTM = new StringBuilder();
            List<Sku> SkuItems = CurrentOrder.SkuItems; // not a shipping sku

            foreach (Sku sku in SkuItems) // CurrentOrder.SkuItems)
            {
                if (counter > 1)
                {
                    //sbGTM_Products.AppendFormat(",");                    
                }
                // sbGTM_Products.AppendFormat("open\'name\': \'{0}\',\'sku\': \'{1}\',\'price\': \'{2}\',\'quantity\': \'{3}\'close",
                // sku.Title, sku.SkuCode, Math.Round(Convert.ToDouble(sku.FullPrice), 2), sku.Quantity.ToString());
                sbGTM.AppendLine("{");
                sbGTM.AppendLine("'sku': '" + sku.SkuCode + "',");
                string SKuName = sku.Title.Replace("'", "").Replace("\"", "").Replace("<span class=nexaheavy>", "").Replace("</span>", "");
                sbGTM.AppendLine("'name': '" + SKuName + "',");
                sbGTM.AppendLine("'price': '" + sku.FullPrice.ToString("N2") + "',");
                sbGTM.AppendLine("'quantity': '" + sku.Quantity + "'");
                if (counter == CartContext.CartInfo.CartItems.Count)
                {
                    sbGTM.AppendLine("}");
                }
                else
                {
                    sbGTM.AppendLine("},");
                }
                counter++;
            }
            // return "["+ sbGTM_Products.ToString().Replace("open", "{").Replace("close", "}") +"]";
            return sbGTM.ToString();
        }
        private string GetGoogleTagManagerProductsFB()
        {
            StringBuilder sbGTM = new StringBuilder();
            List<Sku> SkuItems = CurrentOrder.SkuItems;

            foreach (Sku sku in SkuItems)
            {

                sbGTM.AppendLine("{sku: '" + sku.SkuCode + "',price: '" + sku.FullPrice.ToString("n2") + "',quantity: '" + sku.Quantity + "'}");
            }

            return sbGTM.ToString();
        }
        private void WriteGAPixel()
        {

            StringBuilder sbGAPixel = new StringBuilder();
            litGAReceiptPixel.Text = sbGAPixel.ToString();
        }


        private void MDGConfirmPixel()
        { }
        private void SetHomePagePnl()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.Contains("/index") | url.EndsWith("/"))
            {
                pnlHomePage.Visible = true;
            }
            else
            {
                pnlHomePage.Visible = false;
            }
        }
        private void SetCartPagePnl()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.Contains("/cart"))
            {
                //SetCartListrakPixel();
                pnlCartPages.Visible = true;

            }
            else
            {
                pnlCartPages.Visible = false;
            }
        }
        private void SetAllPagesPnl()
        {
            if (!(Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("postsale") || Request.RawUrl.ToLower().Contains("receipt")))
            {
                pnlAllPages.Visible = true;

            }
            else
            {
                pnlAllPages.Visible = false;
            }

        }
        private void SetHomeAndSubPagesPnl()
        {
            if (!(Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("postsale") || Request.RawUrl.ToLower().Contains("receipt") || Request.RawUrl.ToLower().Contains("cart")))
            {
                pnlHomeAndSubPages.Visible = true;

            }
            else
            {
                pnlHomeAndSubPages.Visible = false;
            }

        }
        private void SetCurrentOrder()
        {
            int orderId = 0;
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else if (CartContext != null)
            {
                orderId = CartContext.OrderId;
            }
            CurrentOrder = new OrderManager().GetBatchProcessOrder(orderId);
            CurrentOrder.LoadAttributeValues();


        }

        private void SetReceiptPagePnl()
        {
            if (Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("receipt"))
            {
                SetCurrentOrder();
                WriteGAPixel();
                //MDGConfirmPixel();
                string[] testCreditCards;

                testCreditCards = ResourceHelper.GetResoureValue("TestCreditCard").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); ;

                foreach (string word in testCreditCards)
                {
                    if (CurrentOrder.CreditInfo.CreditCardNumber.Equals(word))
                    {
                        pnlReceiptPage.Visible = false;
                    }
                    else
                    {
                        pnlReceiptPage.Visible = true;
                    }
                }
                StringBuilder sProducts = new StringBuilder();
                int count = 0;
                foreach (Sku item in CurrentOrder.SkuItems)
                {
                    if (count == 0)
                        sProducts.Append("'" + item.SkuCode + "':'" + item.Title + "'");
                    else
                    {
                        sProducts.Append(",'" + item.SkuCode + "':'" + item.Title + "'");
                    }
                    count++;
                }
                Literal li1 = new Literal();
                li1.Text = "<script type=\"text/javascript\"> var sa_products  = { " + sProducts.ToString() + "} </script>";
                if (Page.Header != null)
                    Page.Header.Controls.Add(li1);

                Literal li = new Literal();
                li.Text = "<script type=\"text/javascript\"> var sa_values = { 'site': newid, 'orderid': '" + CurrentOrder.OrderId.ToString() + "', 'name': '" + CurrentOrder.CustomerInfo.ShippingAddress.FirstName + " " + CurrentOrder.CustomerInfo.ShippingAddress.LastName + "', 'email': '" + CurrentOrder.Email + "' }; function saLoadScript(src) { var js = window.document.createElement(\"script\"); js.src = src; js.type = \"text/javascript\"; document.getElementsByTagName(\"head\")[0].appendChild(js); } var d = new Date(); if (d.getTime() - 172800000 > 1472514437000) saLoadScript(\"//www.shopperapproved.com/thankyou/rate/newid.js\"); else saLoadScript(\"//direct.shopperapproved.com/thankyou/rate/newid.js?d=\" + d.getTime()); </script>";
                if (Page.Header != null)
                    Page.Header.Controls.Add(li);
                //
                //SetConversionListrakPixel();
                SetTotalsForAdwardsAndBing();
                //reset entire Context object
                //this.CartContext.EmptyData();
                //CartContext = null;

            }

        }
        private void SetTotalsForAdwardsAndBing()
        {
            try
            {
                if (CartContext.CartInfo != null)
                {
                    cartTotal = CartContext.CartInfo.SubTotalFullPrice + CartContext.CartInfo.TaxFullPrice + CartContext.CartInfo.ShippingCost;

                }
            }
            catch { }
        }

    }
}