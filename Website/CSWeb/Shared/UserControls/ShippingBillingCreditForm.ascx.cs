using System;
using System.Collections.Generic;
using System.Web.UI;
using CSBusiness;
using CSBusiness.CustomerManagement;
using CSBusiness.Preference;
using CSCore.Utils;
using CSCore.DataHelper;
using CSBusiness.Resolver;
using CSBusiness.CreditCard;
using System.Web.UI.WebControls;
using CSBusiness.Attributes;
using CSBusiness.Payment;
using CSBusiness.Shipping;
using CSWebBase;
using CSBusiness.OrderManagement;
using CSBusiness.ShoppingManagement;
using System.Text.RegularExpressions;

namespace CSWeb.Shared.UserControls
{

    public partial class ShippingBillingCreditForm : System.Web.UI.UserControl
    {
        public string versionName = "";

        #region Variable and Events Declaration
        bool _bError = false;
        protected Cart cartObject;
        public ClientCartContext clientData;
        public string RedirectUrl
        {
            get
            {
                return (string)(ViewState["RedirectUrl"] ?? String.Empty);
            }
            set
            {
                ViewState["RedirectUrl"] = value;
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
        #endregion Variable and Events Declaration

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            versionName = CSWeb.OrderHelper.GetVersionName();

            ScriptManager.RegisterStartupScript(this.Page, typeof(string), "ShowPopup", "MM_showHideLayers('mask','','hide');", true);

            if (!IsPostBack)
            {
                txtFirstName.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("FirstNameErrorMsg") + "')");
                txtFirstName.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtLastName.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("LastNameErrorMsg") + "')");
                txtLastName.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtAddress1.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("BillingAddress1ErrorMsg") + "')");
                txtAddress1.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtCity.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("BillingCityErrorMsg") + "')");
                txtCity.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtZipCode.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg") + "')");
                txtZipCode.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtPhoneNumber.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("PhoneNumberErrorMsg") + "')");
                txtPhoneNumber.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtShippingFirstName.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("FirstNameErrorMsg") + "')");
                txtShippingFirstName.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtShippingLastName.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("LastNameErrorMsg") + "')");
                txtShippingLastName.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtShippingAddress1.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ShippingAddress1ErrorMsg") + "')");
                txtShippingAddress1.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtShippingCity.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ShippingCityErrorMsg") + "')");
                txtShippingCity.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtShippingZipCode.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg") + "')");
                txtShippingZipCode.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtCCNumber1.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCErrorMsg") + "')");
                txtCCNumber1.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtCvv.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CVVErrorMsg") + "')");
                txtCvv.Attributes.Add("oninput", "this.setCustomValidity('')");
                ddlCCType.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCTypeErrorMsg") + "')");
                ddlCCType.Attributes.Add("oninput", "this.setCustomValidity('')");
                ddlExpMonth.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ExpDateMonthErrorMsg") + "')");
                ddlExpMonth.Attributes.Add("oninput", "this.setCustomValidity('')");
                ddlExpYear.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ExpDateYearErrorMsg") + "')");
                ddlExpYear.Attributes.Add("oninput", "this.setCustomValidity('')");
                rfvFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvAddress1.ErrorMessage = ResourceHelper.GetResoureValue("BillingAddress1ErrorMsg");
                rfvCity.ErrorMessage = ResourceHelper.GetResoureValue("BillingCityErrorMsg");
                rfvZipCode.ErrorMessage = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                rfvPhoneNumber.ErrorMessage = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                rfvShippingFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvShippingLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvShippingAddress1.ErrorMessage = ResourceHelper.GetResoureValue("ShippingAddress1ErrorMsg");
                rfvShippingCity.ErrorMessage = ResourceHelper.GetResoureValue("ShippingCityErrorMsg");
                rfvShippingZipCode.ErrorMessage = ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg");
                rfvCreditCard.ErrorMessage = ResourceHelper.GetResoureValue("CCErrorMsg");
                rfvExpMonth.ErrorMessage = ResourceHelper.GetResoureValue("ExpDateMonthErrorMsg") + "<br/>";
                rfvExpYear.ErrorMessage = ResourceHelper.GetResoureValue("ExpDateYearErrorMsg");
                rfvCVV.ErrorMessage = ResourceHelper.GetResoureValue("CVVErrorMsg");
                rfvCCType.ErrorMessage = ResourceHelper.GetResoureValue("CCTypeErrorMsg");

            }

            if (!IsPostBack)
            {
                BindEmptyCart();
                BindCountries(true);
                BindShippingCountries(true);
                BindRegions();
                BindShippingRegions();
                BindShippingCharges();
                BindCreditCard();
                PopulateExpiryYear();
                FillBillingInfo();
                CheckPayPalPost();
                CheckAmazonOrder();
                setPaymentMethod();
                RegionChanged();
                BindControls();
            }
            // version g2 hide the disclaimer for the products
            //if (OrderHelper.GetVersionName().ToLower().Contains("g2"))
            //{
                bool mainKitPresent = false;
                foreach (Sku sku in ClientOrderData.CartInfo.CartItems)
                {
                    sku.LoadAttributeValues();
                    if (sku.GetAttributeValue<bool>("isMainKit", false))
                    {
                        mainKitPresent = true;

                    }
                }

                if (mainKitPresent)
                {
                    dagree.Visible = true;
                    pnlPromoCode.Visible = true;
                }
                else
                {
                    dagree.Visible = false;
                    pnlPromoCode.Visible = false;
                }
            //}
        }

        private void BindEmptyCart()
        {
            clientData = (ClientCartContext)Session["ClientOrderData"];
            if (clientData.CartInfo.ItemCount == 0)
            {
                cartObject = new Cart();
                int pid = OrderHelper.GetMainSkuKit();
                cartObject.AddItem(pid, 1, true, false);

                if (clientData.CustomerInfo != null)
                {
                    cartObject.ShippingAddress = clientData.CustomerInfo.BillingAddress;
                }
                else
                {
                    cartObject.ShippingAddress = new Address();
                }

                cartObject.Compute();
                cartObject.ShowQuantity = false;
                clientData.CartInfo = cartObject;
                Session["ClientOrderData"] = clientData;
                ShoppingCartControl.BindControls();
                BindControls();
            }

        }
        public void CheckAmazonOrder()
        {
            if (Request["access_token"] != null)
            {
                ddlPaymentMethod.SelectedValue = "2";
                setPaymentMethod();
            }
        }

        public void BindControls()
        {
            clientData = (ClientCartContext)Session["ClientOrderData"];
            ltOfferDetails.Text = OrderHelper.GetOfferDatails();

        }


        protected void CheckPayPalPost()
        {
            //phSubmitMsg.Visible = false;

            if (Request["Token"] != null)
            {
                SiteBasePage.PayPalToken = Request["Token"].ToString();
            }
            if (Request["PayerID"] != null)
            {
                SiteBasePage.PayPalInvoice = Request["PayerID"].ToString();
            }

            if (Request.QueryString["ppsend"] == "1")
            {
                ClientCartContext cartContext = (ClientCartContext)Session["ClientOrderData"];

                string message = OrderHelper.InitializePayPal(cartContext.OrderId);

                lblMessage.Text = message;
            }
            else if (Request.QueryString["ppsubmit"] == "1")
            {
                Response.Redirect("postsale.aspx", true);
                //Response.Redirect("ReviewOrder.aspx", true);
            }
            else if (!string.IsNullOrEmpty(SiteBasePage.PayPalToken) && !string.IsNullOrEmpty(SiteBasePage.PayPalInvoice))
            {
                lblMessage.Text = string.Empty;
                ShowCartFields();
            }
        }

        private void ShowCartFields()
        {
            ClientCartContext cartContext = ClientOrderData;

            int orderId = 0;

            try
            {
                orderId = Convert.ToInt32(Request.QueryString["pporderkey"]);
            }
            catch
            {
                orderId = 0;

                //if (!string.IsNullOrEmpty(Request.QueryString["pporderkey"]))
                //{
                //    CSCore.CSLogger.Instance.LogException("Could not decode pporderkey " + Request.QueryString["pporderkey"], ex);
                //}
            }

            // grab order id from querystring if there is one, otherwise create new order entry in DB, which is okay.
            Order order = null;
            if (orderId > 0)
            {
                order = CSResolve.Resolve<IOrderService>().GetOrder(orderId);

                if (order != null)
                {
                    if (!order.AttributeValuesLoaded)
                        order.LoadAttributeValues();

                    // validate the order specified in querystring by comparing paypal token.
                    if (Request.QueryString["token"] != string.Empty &&
                        order.GetAttributeValue<string>("PayPalToken").ToUpper() == Request.QueryString["token"].ToUpper())
                    {
                        cartContext.OrderId = orderId;
                    }
                    else
                        order = null;
                }
            }

            string message = OrderHelper.GetAddressFromPayPal(cartContext);

            if (!string.IsNullOrEmpty(message))
            {
                lblMessage.Text = message;
            }
            else
            {
                lblMessage.Text = string.Empty;

                // populate shipping
                txtShippingFirstName.Value = cartContext.CustomerInfo.ShippingAddress.FirstName;
                txtShippingLastName.Value = cartContext.CustomerInfo.ShippingAddress.LastName;
                txtShippingAddress1.Value = cartContext.CustomerInfo.ShippingAddress.Address1;
                txtShippingAddress2.Value = cartContext.CustomerInfo.ShippingAddress.Address2;
                txtShippingCity.Value = cartContext.CustomerInfo.ShippingAddress.City;
                ddlShippingState.SelectedValue = ddlState.SelectedValue = cartContext.CustomerInfo.ShippingAddress.StateProvinceId.ToString();
                txtShippingZipCode.Text = cartContext.CustomerInfo.ShippingAddress.ZipPostalCode;
                txtEmail.Text = cartContext.CustomerInfo.Email;

                if (!string.IsNullOrEmpty(cartContext.CustomerInfo.PhoneNumber))
                {
                    txtPhoneNumber.Text = cartContext.CustomerInfo.PhoneNumber;//.Substring(0, 3);
                    //txtPhoneNumber2.Text = cartContext.CustomerInfo.PhoneNumber.Substring(3, 3);
                    //txtPhoneNumber3.Text = cartContext.CustomerInfo.PhoneNumber.Substring(6);
                }
                else if (order != null && order.CustomerInfo != null && order.CustomerInfo.BillingAddress != null)
                {
                    txtPhoneNumber.Text = order.CustomerInfo.BillingAddress.PhoneNumber;//.Substring(0, 3);
                    //txtPhoneNumber2.Text = order.CustomerInfo.BillingAddress.PhoneNumber.Substring(3, 3);
                    //txtPhoneNumber3.Text = order.CustomerInfo.BillingAddress.PhoneNumber.Substring(6);
                }
                else
                    txtPhoneNumber.Text = string.Empty;

                //UpdateCosts(false);

                ddlPaymentMethod.SelectedIndex = ddlPaymentMethod.Items.IndexOf(ddlPaymentMethod.Items.FindByValue("3"));
                ddlPaymentMethod.Visible = false;

                // lblPaymentMethod.Text = "PayPal";
                // lblPaymentMethod.Visible = true;

                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/wonderflex/images/express-checkout-hero.png";

                //imgBtn_OnClick(sender,e);
                PerformEvents();

                //phSubmitMsg.Visible = true;



            }
        }
        protected void PerformEvents()
        {
            if (!ddlPaymentMethod.SelectedValue.Equals("2"))
            {
                if (!validateInput())
                {
                    SaveData();
                    // SaveAdditionaInfo();
                    //int qId = 1;
                    if (ddlPaymentMethod.SelectedValue == "3") // paypal express checkout path
                    {
                        if (!string.IsNullOrEmpty(SiteBasePage.PayPalInvoice) && !string.IsNullOrEmpty(SiteBasePage.PayPalToken))
                        {
                            if (Request.Path.ToLower().Contains("mobile"))
                                Response.Redirect("Cart2.aspx?ppsubmit=1");
                            else
                                Response.Redirect("Cart.aspx?ppsubmit=1");

                        }
                        else
                        {
                            if (Request.Path.ToLower().Contains("mobile"))
                                Response.Redirect("Cart2.aspx?ppsend=1");
                            else
                                Response.Redirect("Cart.aspx?ppsend=1");
                        }
                    }
                    else // standard checkout
                    {
                        Response.Redirect("ReviewOrder.aspx");
                    }

                }
                else
                {
                    // pnlShippingInfo.Visible = true;
                }
            }
            else
            {
                AmazonPayment.ProcessAmazonOrder();
            }

        }

        protected void ProcessAmazonOrder()
        {
            if (Request["access_token"] != null || Request["amazonPay"] != null)
            {
                ddlPaymentMethod.SelectedValue = "2";

            }
        }
        protected void ddlPaymentMethod_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            setPaymentMethod();
        }

        protected void setPaymentMethod()
        {
            pnlCreditCard.Visible = false;
            AmazonPayment.Visible = false;
            if (ddlPaymentMethod.SelectedValue.Equals("1"))
            {
                pnlCreditCard.Visible = true;
                pnlShippingBillingCreditForm.Visible = true;
                dCompleteOrder.Visible = true;

                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_submit.png";
            }
            else if (ddlPaymentMethod.SelectedValue.Equals("3"))
            {
                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/wonderflex/images/express-checkout-hero.png";
                dCompleteOrder.Visible = true;
                pnlShippingBillingCreditForm.Visible = true;
            }
            ProcessPaymentMethods();
        }

        public void ProcessPaymentMethods()
        {
            if (ddlPaymentMethod.SelectedValue.Equals("2"))
            {
                pnlShippingBillingCreditForm.Visible = false;
                AmazonPayment.Visible = true;
                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_submit.png";
            }

            dCompleteOrder.Visible = true;

        }

        protected void FillBillingInfo()
        {
            try
            {
                ClientCartContext contextData = ClientOrderData;
                if (contextData != null && contextData.CustomerInfo != null)
                {

                    if (contextData.CustomerInfo.BillingAddress != null)
                    {
                        txtFirstName.Value = contextData.CustomerInfo.BillingAddress.FirstName;
                        txtLastName.Value = contextData.CustomerInfo.BillingAddress.LastName;
                        txtAddress1.Value = contextData.CustomerInfo.BillingAddress.Address1;
                        txtAddress2.Value = contextData.CustomerInfo.BillingAddress.Address2;
                        txtCity.Value = contextData.CustomerInfo.BillingAddress.City;
                        txtZipCode.Text = contextData.CustomerInfo.BillingAddress.ZipPostalCode;
                        ddlCountry.SelectedValue = contextData.CustomerInfo.BillingAddress.CountryId.ToString();
                        BindRegions();
                        ddlState.SelectedValue = contextData.CustomerInfo.BillingAddress.StateProvinceId.ToString();
                        txtEmail.Text = contextData.CustomerInfo.Email;
                        txtPhoneNumber.Text = contextData.CustomerInfo.PhoneNumber.Replace(" ", "").Replace("-", "").Replace("(", "").Replace(")", "").Trim(); // .Substring(0, 3);                      
                        ShowBillingPanel();

                    }

                    if (contextData.CustomerInfo.ShippingAddress != null)
                    {
                        txtShippingFirstName.Value = contextData.CustomerInfo.ShippingAddress.FirstName;
                        txtShippingLastName.Value = contextData.CustomerInfo.ShippingAddress.LastName;
                        txtShippingAddress1.Value = contextData.CustomerInfo.ShippingAddress.Address1;
                        txtShippingAddress2.Value = contextData.CustomerInfo.ShippingAddress.Address2;
                        txtShippingCity.Value = contextData.CustomerInfo.ShippingAddress.City;
                        txtShippingZipCode.Text = contextData.CustomerInfo.ShippingAddress.ZipPostalCode;
                        ddlShippingCountry.SelectedValue = contextData.CustomerInfo.ShippingAddress.CountryId.ToString();
                        BindShippingRegions();
                        ddlShippingState.SelectedValue = contextData.CustomerInfo.ShippingAddress.StateProvinceId.ToString();
                    }

                    if (!contextData.CustomerInfo.BillingAddress.Address1.ToLower()
                            .Equals(contextData.CustomerInfo.ShippingAddress.Address1.ToLower()))
                    {
                        cbShippingSame.Checked = false;
                        pnlShippingAddress.Visible = true;
                    }
                }


            }
            catch
            {


            }


        }

        public void ShowBillingPanel()
        {
            if (!(ClientOrderData == null || ClientOrderData.CustomerInfo == null || ClientOrderData.CustomerInfo.BillingAddress == null))
            {
                //pnlBillingInfo.Visible = false;

            }
            if (ClientOrderData != null && ClientOrderData.CartInfo.CartItems.Count == 0)
            {
                int pid = OrderHelper.GetMainSkuKit();
                AddProductToShoppingCart(pid, true);
            }
        }

        private void AddProductToShoppingCart(int skuID, bool refreshCart)
        {
            ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];
            clientData.CartInfo.CartItems.Clear();
            int pid = skuID;
            clientData.CartInfo.AddOrUpdate(pid, 1, true, false, false);
            clientData.CartInfo.Compute();
            Session["ClientOrderData"] = clientData;
            if (refreshCart)
            {
                //refreshShoppingCart();
                ShoppingCartControl.BindControls();
                BindControls();
            }
        }

        private void refreshShoppingCart()
        {
            ShoppingCartControl.BindControls();
            //CSWeb.Shared.UserControls.ShoppingCartControl scc = (CSWeb.Shared.UserControls.ShoppingCartControl)this.FindControl("ShoppingCartControl");
            //if(scc != null)
            //scc.BindControls();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));

            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + this.ClientID,
            //  String.Format(@"$(function() {{$('#{0}').autotab_magic().autotab_filter('numeric')}});",
            //          txtPhoneNumber.ClientID), true);

            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab1" + this.ClientID,
            //String.Format(@"$(function() {{$('#{0}, #{1}, #{2},#{3}').autotab_magic().autotab_filter('numeric')}});",
            //        txtCCNumber1.ClientID, txtCCNumber2.ClientID, txtCCNumber3.ClientID, txtCCNumber4.ClientID), true);

        }

        #endregion Page Events

        #region General Methods

        /// <summary>
        /// List of Country from Cache Data
        /// </summary>
        public void BindCountries(bool setValue)
        {

            ddlCountry.DataSource = CountryManager.GetActiveCountry();
            ddlCountry.DataBind();
            if (setValue)
                ddlCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;

        }

        public void BindShippingCountries(bool setValue)
        {

            ddlShippingCountry.DataSource = CountryManager.GetActiveCountry();
            ddlShippingCountry.DataBind();
            if (setValue)
                ddlShippingCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// List of States from Cache Data
        /// </summary>
        private void BindRegions()
        {

            ddlState.Items.Clear();
            int countryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlState.DataSource = list;
            ddlState.DataValueField = "StateProvinceId";
            ddlState.DataBind();

            if (!string.IsNullOrEmpty(ddlStateJS.Value))
            {
                ddlState.Items.FindByText(ddlStateJS.Value).Selected = true;
                ddlStateJS.Value = "";
            }
        }

        private void BindCreditCard()
        {

            ddlCCType.Items.Clear();
            ddlCCType.DataSource = CommonHelper.BindToEnum(typeof(CreditCardTypeEnum));
            ddlCCType.DataTextField = "Key";
            ddlCCType.DataValueField = "Value";
            ddlCCType.DataBind();
            ddlCCType.Items.Insert(0, new ListItem("- Select -", string.Empty));

        }

        private void BindShippingRegions()
        {
            ddlShippingState.Items.Clear();
            int countryId = Convert.ToInt32(ddlShippingCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlShippingState.DataSource = list;
            ddlShippingState.DataValueField = "StateProvinceId";
            ddlShippingState.DataBind();

            if (!string.IsNullOrEmpty(ddlShippingStateJS.Value))
            {
                ddlShippingState.Items.FindByText(ddlShippingStateJS.Value).Selected = true;
                ddlShippingStateJS.Value = "";
            }
        }

        private void BindShippingCharges()
        {
            ddlAdditionShippingCharge.Items.Clear();

            ddlAdditionShippingCharge.DataSource = ShippingManager.GetShippingChargesByPref(1);
            ddlAdditionShippingCharge.DataTextField = "FriendlyLabel";
            ddlAdditionShippingCharge.DataValueField = "Key";
            ddlAdditionShippingCharge.DataBind();

            ddlAdditionShippingCharge.Items.Insert(0, new ListItem("- Select -", string.Empty));
        }

        protected void Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindRegions();
            try
            {
                ClientCartContext clientData = ClientOrderData;
                Address shippingAddress = new Address();
                Customer CustData = new Customer();
                shippingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
                CustData.ShippingAddress = CustData.BillingAddress = shippingAddress;
                clientData.CustomerInfo = CustData;
                ClientOrderData = clientData;
            }
            catch
            { }
            RegionChanged();

        }

        protected void ShippingState_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            RegionChanged();
        }
        protected void BillingState_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            RegionChanged();
        }

        protected void RegionChanged()
        {
            ClientCartContext clientData = ClientOrderData;
            Cart cartObject = new Cart();
            if (clientData.CartInfo != null)
                cartObject = clientData.CartInfo;

            Address shippingAddress = new Address();

            if (pnlShippingAddress.Visible)
            {
                shippingAddress.StateProvinceId = Convert.ToInt32(ddlShippingState.SelectedValue);
                shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                shippingAddress.ZipPostalCode = txtShippingZipCode.Text;
                cartObject.ShippingAddress = shippingAddress;
            }
            else
            {
                shippingAddress.StateProvinceId = Convert.ToInt32(ddlState.SelectedValue);
                shippingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
                shippingAddress.ZipPostalCode = txtZipCode.Text;
                cartObject.ShippingAddress = shippingAddress;
            }


            clientData.CartInfo = cartObject;
            clientData.CartInfo.Compute();
            ClientOrderData = clientData;
            ShoppingCartControl.BindControls();
            BindControls();

        }

        protected void ShippingCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindShippingRegions();
            RegionChanged();
        }
        public bool validateInput()
        {
            if (ClientOrderData.CartInfo.CartItems.Count == 0)
            {
                lblErrorSummary.Text = "Your Shopping Cart is currently empty.";
                lblErrorSummary.Text = lblErrorSummary.Text + lblShippingFirstName.Text + "</br>";
                _bError = true;
            }
            if (ddlShippingState.SelectedItem.Equals("select"))
            {
                lblShippingStateError.Text = ResourceHelper.GetResoureValue("StateErrorMsg");
                lblShippingStateError.Visible = true;
                _bError = true;
            }
            else
                lblShippingStateError.Visible = false;


            if (CommonHelper.EnsureNotNull(txtShippingZipCode.Text) != String.Empty)
            {
                if (ddlShippingCountry.SelectedValue.Contains("231"))
                {
                    if (!CommonHelper.IsValidZipCode(txtShippingZipCode.Text))
                    {
                        lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeValidationErrorMsg");
                        lblShippingZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblShippingZiPError.Visible = false;

                }
                else
                {
                    if (!CommonHelper.IsValidZipCodeCanadian(txtShippingZipCode.Text))
                    {
                        lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeValidationErrorMsg");
                        lblShippingZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblShippingZiPError.Visible = false;
                }

            }

            string strPhoneNum = txtPhoneNumber.Text;

            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                lblPhoneNumberError.Text = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                lblPhoneNumberError.Visible = true;
                _bError = true;
            }
            else
                lblPhoneNumberError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtEmail.Text) == String.Empty)
            {
                lblEmailError.Text = ResourceHelper.GetResoureValue("EmailErrorMsg");
                lblEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                bool isEmail = Regex.IsMatch(txtEmail.Text, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
                if (!isEmail)
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                    lblEmailError.Visible = true;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }

            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();

            if (!sitePrefCache.AttributeValuesLoaded)
                sitePrefCache.LoadAttributeValues();

            if (sitePrefCache.GetAttributeValue<bool>("DuplicateOrderCheck", true))
            {
                if (DuplicateOrderDAL.IsDuplicateOrder(txtEmail.Text))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("DuplicateEmailCheck") + "<br /><br />";
                    lblEmailError.Visible = true;
                    lblErrorSummary.Text = lblErrorSummary.Text + lblEmailError.Text;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }
            if (pnlQuantity.Visible)
            {
                if (ddlQuantityList.SelectedValue.Equals("select"))
                {
                    lblQuantityList.Text = ResourceHelper.GetResoureValue("QuantityErrorMsg");
                    lblQuantityList.Visible = true;
                    _bError = true;
                }
                else
                    lblQuantityList.Visible = false;
            }

            #region Name & Address

            if (pnlShippingAddress.Visible)
            {


                if (CommonHelper.EnsureNotNull(txtZipCode.Text) != String.Empty)
                {
                    if (ddlCountry.SelectedValue.Contains("231"))
                    {
                        if (!CommonHelper.IsValidZipCode(txtZipCode.Text))
                        {
                            lblZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeValidationErrorMsg");
                            lblZiPError.Visible = true;
                            _bError = true;

                        }
                        else
                            lblShippingZiPError.Visible = false;

                    }
                    else
                    {
                        if (!CommonHelper.IsValidZipCodeCanadian(txtZipCode.Text))
                        {
                            lblZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeValidationErrorMsg");
                            lblZiPError.Visible = true;
                            _bError = true;

                        }
                        else
                            lblZiPError.Visible = false;
                    }

                }
                else
                {
                    lblZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeErrorMsg");
                    lblZiPError.Visible = true;
                    _bError = true;
                }
                if (ddlState.SelectedItem.Text.Equals("select"))
                {
                    lblStateError.Text = ResourceHelper.GetResoureValue("StateErrorMsg");
                    lblStateError.Visible = true;
                    _bError = true;
                }
                else
                    lblStateError.Visible = false;
            }
            #endregion

            #region Credit Card

            if (pnlCreditCard.Visible)
            {
                string c = txtCCNumber1.Text;
                if ((c[0].ToString() == "5") && (ddlCCType.Value.ToString() != CreditCardTypeEnum.MasterCard.ToString()))
                {
                    ddlCCType.Value = ((int)CreditCardTypeEnum.MasterCard).ToString();
                }
                else if ((c[0].ToString() == "4") &&
                         (ddlCCType.Value.ToString() != CreditCardTypeEnum.MasterCard.ToString()))
                {

                    ddlCCType.Value = ((int)CreditCardTypeEnum.Visa).ToString();
                }
                else if ((c[0].ToString() == "6") &&
                         (ddlCCType.Value.ToString() != CreditCardTypeEnum.Discover.ToString()))
                {

                    ddlCCType.Value = ((int)CreditCardTypeEnum.Discover).ToString();
                }
                else if ((c[0].ToString() == "3") &&
                         (ddlCCType.Value.ToString() != CreditCardTypeEnum.AmericanExpress.ToString()))
                {

                    ddlCCType.Value = ((int)CreditCardTypeEnum.AmericanExpress).ToString();
                }
                else
                {

                }

                if (ddlCCType.SelectedIndex < 0)
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;
                }
                else
                    lblCCType.Visible = false;

                DateTime expire = new DateTime();
                if (ddlExpYear.SelectedIndex > -1 && ddlExpMonth.SelectedIndex > -1)
                {
                    expire = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpMonth.SelectedIndex].Text), 1);
                }
                DateTime today = DateTime.Today;
                if (expire.Year <= today.Year && expire.Month < today.Month)
                {
                    lblExpDate.Text = ResourceHelper.GetResoureValue("ExpDateErrorMsg");
                    lblExpDate.Visible = true;
                    _bError = true;
                }
                else
                    lblExpDate.Visible = false;



                if (c.Equals(""))
                {
                    lblCCNumberError.Text = ResourceHelper.GetResoureValue("CCErrorMsg");
                    lblCCNumberError.Visible = true;
                    txtCCNumber1.Text = string.Empty;
                    _bError = true;
                    return _bError;
                }
                else
                    lblCCNumberError.Visible = false;

                if (CommonHelper.EnsureNotNull(txtCvv.Value) == String.Empty)
                {
                    lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                    lblCvvError.Visible = true;
                    _bError = true;
                }
                else
                {

                    if (CommonHelper.onlynums(txtCvv.Value) == false)
                    {
                        lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                        lblCvvError.Visible = true;
                        _bError = true;
                    }

                    if ((CommonHelper.CountNums(txtCvv.Value) != 3) && (CommonHelper.CountNums(txtCvv.Value) != 4))
                    {
                        lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                        lblCvvError.Visible = true;
                        _bError = true;
                    }
                    else if ((c[0].ToString() == "3") && (CommonHelper.CountNums(txtCvv.Value) != 4))
                    {
                        lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                        lblCvvError.Visible = true;
                        _bError = true;

                    }
                    else if ((c[0].ToString() != "3") && (CommonHelper.CountNums(txtCvv.Value) != 3))
                    {
                        lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                        lblCvvError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblCvvError.Visible = false;
                }



            }
            #endregion

            if (_bError)
            {
                lblErrorSummary.Visible = true;
            }

            return _bError;

        }

        public void PopulateExpiryYear()
        {
            //Populate the credit card expiration month drop down 
            for (int i = 1; i <= 12; i++)
            {
                DateTime month = new DateTime(2000, i, 1);
                ListItem li = new ListItem(month.ToString("MM"), month.ToString("MM"));
                ddlExpMonth.Items.Add(li);
            }
            //DropDownListExpMonth.SelectedValue = DateTime.Now.ToString("MM");
            ddlExpMonth.Items[0].Selected = true;



            //Populate the credit card expiration year drop down (go out 12 years)  
            for (int i = 0; i <= 11; i++)
            {
                String year = (DateTime.Today.Year + i).ToString();
                ListItem li = new ListItem(year, year);
                ddlExpYear.Items.Add(li);
            }
            ddlExpYear.Items[0].Selected = true;
        }

        protected void cbShippingSame_CheckedChanged(object sender, EventArgs e)
        {
            if (!cbShippingSame.Checked)
                pnlShippingAddress.Visible = true;
            else
                pnlShippingAddress.Visible = false;
        }

        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                string script = "MM_showHideLayers('mask', '', 'show');";
                ScriptManager.RegisterStartupScript(pnlShippingBillingCreditForm, this.GetType(), "popup", script, true);
                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/images/loader.gif";
                imgBtn.Enabled = false;
                SaveData();
                if (pnlCreditCard.Visible)
                {
                    if (ClientOrderData.OrderId <= 0)
                    {
                        if (CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.InstantOrderProcess ||
                               CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.EnableUpsellReviewOrder)
                        {
                            int orderId = CSResolve.Resolve<IOrderService>().SaveOrder(ClientOrderData);

                            ClientOrderData.OrderId = orderId;
                            Session["ClientOrderData"] = ClientOrderData;
                        }
                        Response.Redirect("PostSale.aspx");
                    }
                    else
                    {
                        CSResolve.Resolve<IOrderService>().UpdateOrder(ClientOrderData.OrderId, ClientOrderData);
                        ClientOrderData.OrderId = ClientOrderData.OrderId;
                        Session["ClientOrderData"] = ClientOrderData;
                        OrderProcessor.ProcessOrderAndRedirect(ClientOrderData.OrderId);
                    }
                }
                else
                    PerformEvents();

            }
            else
            {
                string script = "MM_showHideLayers('mask', '', 'hide');";
                imgBtn.Enabled = true;
                imgBtn.ImageUrl = "//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_submit.png";
                ScriptManager.RegisterStartupScript(pnlShippingBillingCreditForm, this.GetType(), "popup", script, true);
            }


        }


        public void SaveData()
        {
            ClientCartContext clientData = ClientOrderData;
            if (Page.IsValid)
            {
                if (!string.IsNullOrEmpty(CommonHelper.GetCookieString("sid", false)))
                {

                    clientData.OrderAttributeValues.AddOrUpdateAttributeValue("sid",
                            new AttributeValue(CommonHelper.GetCookieString("sid", false).ToLower()));
                }
                clientData.OrderAttributeValues.AddOrUpdateAttributeValue("NameOnCard", new AttributeValue(txtNameOnCard.Text));
                //Set Customer Information
                Address billingAddress = new Address();
                Address shippingAddress = new Address();
                shippingAddress.FirstName = CommonHelper.fixquotesAccents(txtShippingFirstName.Value);
                shippingAddress.LastName = CommonHelper.fixquotesAccents(txtShippingLastName.Value);
                shippingAddress.Address1 = CommonHelper.fixquotesAccents(txtShippingAddress1.Value);
                shippingAddress.Address2 = CommonHelper.fixquotesAccents(txtShippingAddress2.Value);
                shippingAddress.City = CommonHelper.fixquotesAccents(txtShippingCity.Value);
                shippingAddress.City = CommonHelper.fixquotesAccents(txtShippingCity.Value);
                shippingAddress.StateProvinceId = Convert.ToInt32(ddlShippingState.SelectedValue);
                shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                shippingAddress.ZipPostalCode = CommonHelper.fixquotesAccents(txtShippingZipCode.Text);


                Customer CustData = new Customer();
                CustData.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                CustData.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                CustData.PhoneNumber = CommonHelper.GetCleanPhoneNumber(txtPhoneNumber.Text);
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.ShippingAddress = shippingAddress;



                if (!pnlShippingAddress.Visible)
                {
                    CustData.BillingAddress = shippingAddress;
                }
                else
                {
                    billingAddress.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                    billingAddress.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                    billingAddress.Address1 = CommonHelper.fixquotesAccents(txtAddress1.Value);
                    billingAddress.Address2 = CommonHelper.fixquotesAccents(txtAddress2.Value);
                    billingAddress.City = CommonHelper.fixquotesAccents(txtCity.Value);
                    billingAddress.StateProvinceId = int.Parse(ddlState.SelectedValue);
                    billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                    billingAddress.ZipPostalCode = CommonHelper.fixquotesAccents(txtZipCode.Text);
                    CustData.BillingAddress = billingAddress;
                }

                PaymentInformation paymentDataInfo = new PaymentInformation();
                string CardNumber = txtCCNumber1.Text;

                if (ddlPaymentMethod.SelectedValue == "1")
                {
                    paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(CardNumber);
                    paymentDataInfo.CreditCardType = Convert.ToInt32(ddlCCType.Value);
                    paymentDataInfo.CreditCardName = ddlCCType.Items[ddlCCType.SelectedIndex].Text;
                    paymentDataInfo.CreditCardExpired = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpMonth.SelectedIndex].Text), 1);
                    paymentDataInfo.CreditCardCSC = txtCvv.Value;
                }
                else
                {
                    CardNumber = "0";
                    paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(CardNumber);
                    paymentDataInfo.CreditCardName = "PayPal";
                    paymentDataInfo.CreditCardExpired = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                    paymentDataInfo.CreditCardCSC = string.Empty;
                }
                clientData.PaymentInfo = paymentDataInfo;

                clientData.CartInfo.ShippingAddress = CustData.ShippingAddress;

                clientData.CartInfo.Compute();

                // add rush shipping level to cart object
                if (!string.IsNullOrEmpty(ddlAdditionShippingCharge.SelectedValue))
                {
                    clientData.CartInfo.ShippingChargeKey = ddlAdditionShippingCharge.SelectedValue;
                }

                ClientOrderData = clientData;


                //Set the Client Order objects
                ClientCartContext contextData = (ClientCartContext)Session["ClientOrderData"];
                contextData.CustomerInfo = CustData;
                contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(CustData, contextData);
                Session["ClientOrderData"] = contextData;


            }
        }

        protected void ZipCode_TextChanged(object sender, System.EventArgs e)
        {
            if (pnlShippingAddress.Visible)
            {
                if (CommonHelper.EnsureNotNull(txtShippingZipCode.Text) == String.Empty)
                {
                    lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg");
                    lblShippingZiPError.Visible = true;
                    return;
                }
                else if (!CommonHelper.IsValidZipCode(txtShippingZipCode.Text))
                {
                    lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg");
                    lblShippingZiPError.Visible = true;
                    return;
                }
                else
                {
                    lblShippingZiPError.Visible = false;
                }
            }
            else
            {
                if (CommonHelper.EnsureNotNull(txtZipCode.Text) == String.Empty)
                {
                    lblZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                    lblZiPError.Visible = true;
                    return;
                }
                else if (!CommonHelper.IsValidZipCode(txtZipCode.Text))
                {
                    lblZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                    lblZiPError.Visible = true;
                    return;
                }
                else
                {
                    lblZiPError.Visible = false;
                }
            }

            //if (pnlShippingAddress.Visible)
            //{
            //    txtShippingZipCode.Focus();
            //}
            //else
            //{
            //    txtZipCode.Focus();
            //}
            RegionChanged();
            BindControls();
        }

        #endregion General Methods

    }
}