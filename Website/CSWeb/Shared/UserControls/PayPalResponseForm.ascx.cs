using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using CSBusiness;
using CSBusiness.CustomerManagement;
using CSCore.Utils;
using CSCore.DataHelper;
using System.Web;
using CSBusiness.Resolver;
using CSBusiness.CreditCard;
using System.Web.UI.WebControls;
using CSBusiness.Payment;
using CSBusiness.Shipping;
using CSBusiness.ShoppingManagement;
using CSBusiness.OrderManagement;
using System.Collections.Specialized;
using System.Collections;
using System.Xml.Linq;
namespace CSWeb.Shared.UserControls
{

    public partial class PayPalResponseForm : System.Web.UI.UserControl
    {
        #region Variable and Events Declaration
        bool _bError = false;
        protected Cart cartObject;        
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
            if (!IsPostBack)
            {
                txtFirstName.Focus();
                txtEmail.Attributes["type"] = "email";
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

                txtEmail.Attributes.Add("oninvalid", "InvalidMsg(this)");
                txtEmail.Attributes.Add("oninput", "this.setCustomValidity('')");


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
                txtCCNumber2.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCErrorMsg") + "')");
                txtCCNumber2.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtCCNumber3.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCErrorMsg") + "')");
                txtCCNumber3.Attributes.Add("oninput", "this.setCustomValidity('')");
                txtCCNumber4.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCErrorMsg") + "')");
                txtCCNumber4.Attributes.Add("oninput", "this.setCustomValidity('')");

                txtCvv.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CVVErrorMsg") + "')");
                txtCvv.Attributes.Add("oninput", "this.setCustomValidity('')");

                ddlCCType.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("CCTypeErrorMsg") + "')");
                ddlCCType.Attributes.Add("oninput", "this.setCustomValidity('')");
                ddlShippingState.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ShippingStateErrorMsg") + "')");
                ddlShippingState.Attributes.Add("oninput", "this.setCustomValidity('')");

                ddlExpMonth.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ExpDateMonthErrorMsg") + "')");
                ddlExpMonth.Attributes.Add("oninput", "this.setCustomValidity('')");

                ddlExpYear.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ExpDateYearErrorMsg") + "')");
                ddlExpYear.Attributes.Add("oninput", "this.setCustomValidity('')");
                
            }

            if (!IsPostBack)
            {
                BindCountries(true);
                PopulateExpiryYear();
                BindShippingCountries(true);
                BindRegions();
                BindShippingRegions();
                BindShippingCharges();
                BindCreditCard();
            }
            CreatePayPalOrder();

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

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));

            ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + this.ClientID,
            String.Format(@"$(function() {{$('#{0}').autotab_magic().autotab_filter('numeric')}});",
                    txtPhoneNumber.ClientID), true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab1" + this.ClientID,
          String.Format(@"$(function() {{$('#{0}, #{1}, #{2},#{3}').autotab_magic().autotab_filter('numeric')}});",
                  txtCCNumber1.ClientID, txtCCNumber2.ClientID, txtCCNumber3.ClientID, txtCCNumber4.ClientID), true);

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
        }

        private void BindCreditCard()
        {
            ddlCCType.Items.Clear();
            ddlCCType.DataSource = CommonHelper.BindToEnum(typeof(CreditCardTypeEnum));
            ddlCCType.DataTextField = "Key";
            ddlCCType.DataValueField = "Value";
            ddlCCType.DataBind();
            //ddlCCType.Items.Insert(0, new ListItem("- Select -", string.Empty));

        }
        private void BindShippingRegions()
        {
            ddlShippingState.Items.Clear();
            int countryId = Convert.ToInt32(ddlShippingCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlShippingState.DataSource = list;
            ddlShippingState.DataValueField = "StateProvinceId";
            ddlShippingState.DataBind();
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
        }

        protected void ShippingCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindShippingRegions();
        }
        public bool validateInput()
        {           

            string strPhoneNum = txtPhoneNumber.Text;

            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                lblPhoneNumberError.Text = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                lblPhoneNumberError.Visible = true;
                _bError = true;
            }
            else
                lblPhoneNumberError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtZipCode.Value) == String.Empty)
            {
                lblZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeErrorMsg");
                lblZiPError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidZipCode(txtZipCode.Value))
                {
                    lblZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeValidationErrorMsg");
                    lblZiPError.Visible = true;
                    _bError = true;

                }
                else
                    lblZiPError.Visible = false;

            }

            if (CommonHelper.EnsureNotNull(txtEmail.Value) == String.Empty)
            {
                lblEmailError.Text = ResourceHelper.GetResoureValue("EmailErrorMsg");
                lblEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidEmail(txtEmail.Value))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                    lblEmailError.Visible = true;
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
                if (ddlShippingState.Items[ddlShippingState.SelectedIndex].Text.Equals("select"))
                {
                    lblShippingStateError.Text = ResourceHelper.GetResoureValue("StateErrorMsg");
                    lblShippingStateError.Visible = true;
                    _bError = true;
                }
                else
                    lblShippingStateError.Visible = false;

                if (CommonHelper.EnsureNotNull(txtShippingZipCode.Value) == String.Empty)
                {
                    lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeErrorMsg");
                    lblShippingZiPError.Visible = true;
                    _bError = true;
                }
                else
                {
                    if (!CommonHelper.IsValidZipCode(txtShippingZipCode.Value))
                    {
                        lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeValidationErrorMsg");
                        lblShippingZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblShippingZiPError.Visible = false;

                }
            }
            #endregion

            #region Credit Card

            if (ddlCCType.SelectedIndex < 0)
            {
                lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeErrorMsg");
                lblCCType.Visible = true;
                _bError = true;
            }
            else
                lblCCType.Visible = false;

            DateTime expire = new DateTime();
            if (ddlExpYear.SelectedIndex > 0 && ddlExpMonth.SelectedIndex > 0)
            {
                expire = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpMonth.SelectedIndex].Text), 1);
            }
            DateTime today = DateTime.Today;
            if (expire.Year <= today.Year && expire.Month <= today.Month)
            {
                lblExpDate.Text = ResourceHelper.GetResoureValue("ExpDateErrorMsg");
                lblExpDate.Visible = true;
                _bError = true;
            }
            else
                lblExpDate.Visible = false;

            string c = txtCCNumber1.Text + txtCCNumber2.Text + txtCCNumber3.Text + txtCCNumber4.Text;
            if (c.Equals(""))
            {
                lblCCNumberError.Text = ResourceHelper.GetResoureValue("CCErrorMsg");
                lblCCNumberError.Visible = true;
                _bError = true;
            }
            else
            {
                if ((c.ToString() != "4444333322221111") && (txtCvv.Value.IndexOf("147114711471") == -1))
                {
                    if (!CommonHelper.ValidateCardNumber(c))
                    {
                        lblCCNumberError.Text = ResourceHelper.GetResoureValue("CCErrorMsg");
                        lblCCNumberError.Visible = true;
                        _bError = true;
                    }
                    else
                        lblCCNumberError.Visible = false;
                }
            }

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
                else
                    lblCvvError.Visible = false;

                if ((c[0].ToString() == "5") && (ddlCCType.Items[ddlCCType.SelectedIndex].Text.ToString() != CreditCardTypeEnum.MasterCard.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;
                }
                else if ((c[0].ToString() == "4") && (ddlCCType.Items[ddlCCType.SelectedIndex].Text.ToString() != CreditCardTypeEnum.Visa.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "6") && (ddlCCType.Items[ddlCCType.SelectedIndex].Text.ToString() != CreditCardTypeEnum.Discover.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "3") && (ddlCCType.Items[ddlCCType.SelectedIndex].Text.ToString() != CreditCardTypeEnum.AmericanExpress.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else
                {
                    lblCCType.Visible = false;
                }

            }

            #endregion

            return _bError;

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
                SaveData();
                SaveAdditionaInfo();
                //int qId = 1;
                Response.Redirect(string.Format("AddProduct.aspx?PId={0}&CId={1}",
                    30, Convert.ToString((int)CSBusiness.ShoppingManagement.ShoppingCartType.SingleCheckout)));
                //Response.Redirect("store/addproduct.aspx" + "?PId=30&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
            }


        }
        private void SaveAdditionaInfo()
        {
            ClientCartContext contextData = ClientOrderData;

            //contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(contextData.CustomerInfo, contextData);

            ClientOrderData = contextData;
        }

        public void SaveData()
        {
            ClientCartContext clientData = ClientOrderData;
            if (Page.IsValid)
            {

                //Set Customer Information
                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                billingAddress.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(txtAddress1.Value);
                billingAddress.Address2 = CommonHelper.fixquotesAccents(txtAddress2.Text);
                billingAddress.City = CommonHelper.fixquotesAccents(txtCity.Value);
                billingAddress.StateProvinceId =ddlState.SelectedIndex;
                billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                billingAddress.ZipPostalCode = CommonHelper.fixquotesAccents(txtZipCode.Value);

                Customer CustData = new Customer();
                CustData.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                CustData.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                CustData.PhoneNumber = txtPhoneNumber.Text;
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Value);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Value);
                CustData.BillingAddress = billingAddress;
                //CustData.ShippingAddress = billingAddress;

                if (!pnlShippingAddress.Visible)
                {
                    CustData.ShippingAddress = billingAddress;
                }
                else
                {
                    Address shippingAddress = new Address();
                    shippingAddress.FirstName = CommonHelper.fixquotesAccents(txtShippingFirstName.Value);
                    shippingAddress.LastName = CommonHelper.fixquotesAccents(txtShippingLastName.Value);
                    shippingAddress.Address1 = CommonHelper.fixquotesAccents(txtShippingAddress1.Value);
                    shippingAddress.Address2 = CommonHelper.fixquotesAccents(txtShippingAddress2.Text);
                    shippingAddress.City = CommonHelper.fixquotesAccents(txtShippingCity.Value);
                    shippingAddress.StateProvinceId = ddlShippingState.SelectedIndex;
                    shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                    shippingAddress.ZipPostalCode = CommonHelper.fixquotesAccents(txtShippingZipCode.Value);

                    CustData.ShippingAddress = shippingAddress;
                }

                PaymentInformation paymentDataInfo = new PaymentInformation();
                string CardNumber = txtCCNumber1.Text + txtCCNumber2.Text + txtCCNumber3.Text + txtCCNumber4.Text;
                paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(CardNumber);
                paymentDataInfo.CreditCardType = Convert.ToInt32(ddlCCType.Items[ddlCCType.SelectedIndex].Text);
                paymentDataInfo.CreditCardName = ddlCCType.Items[ddlCCType.SelectedIndex].Text;
                paymentDataInfo.CreditCardExpired = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpMonth.SelectedIndex].Text), 1);
                paymentDataInfo.CreditCardCSC = txtCvv.Value;

                clientData.PaymentInfo = paymentDataInfo;

                // add rush shipping level to cart object
                if (!string.IsNullOrEmpty(ddlAdditionShippingCharge.SelectedValue))
                {
                    clientData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
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
        private void CreatePayPalOrder()
        {
            OrderManager orderMgr = new OrderManager();
            CSBusiness.OrderManagement.Order orderData = null;
            NameValueCollection nvcPostData = Request.Form;
            NameValueCollection nvcQueryString = null;
            ArrayList skuList = new ArrayList();
            Hashtable htRequestInfo = new Hashtable();
            Hashtable htResponseInfo = new Hashtable();
            Address billingAddress = new Address();
            Customer CustData = new Customer();//Set Customer Information
            List<StateProvince> states = StateManager.GetAllStates(0);
            List<Country> countries = CountryManager.GetAllCountry();
            string strEmail = "";
            int intOrderid = 0;

            string strPayKey = "";
            string strTransactionId = "";

            if (nvcPostData["ipn_notification_url"] != null)
            {
                nvcQueryString = HttpUtility.ParseQueryString(nvcPostData["ipn_notification_url"].ToString().Split('?')[1]);
                if (nvcQueryString["orderid"] != null)
                {
                    intOrderid = Convert.ToInt32(nvcQueryString["orderid"].ToString());                                        
                }
            }
            else
            {
                intOrderid = Convert.ToInt32(Request["orderid"].ToString());
            }
            if (nvcPostData["pay_key"] != null)
            {
                strPayKey = nvcPostData["pay_key"].ToString();
            }
            if (nvcPostData["transaction[0].id"] != null)
            {
                strTransactionId = nvcPostData["transaction[0].id"].ToString();
            }
            if (nvcPostData["sender_email"] != null)
            {
                strTransactionId = nvcPostData["sender_email"].ToString();
            }
            if (intOrderid > 0)
            {
                orderData = orderMgr.GetOrderDetails(intOrderid, true);
                //Getting Data from Paypal
                htRequestInfo.Add("ActionType", "GetShippingAddresses");
                htRequestInfo.Add("PayKey", strPayKey);

                if (OrderHelper.AuthorizeOrderWithPayPalAdaptive(orderData.OrderId, htRequestInfo, out htResponseInfo))
                {

                    if (htResponseInfo.ContainsKey("selectedAddress.addresseeName"))
                    {
                        billingAddress.FirstName = CommonHelper.fixquotesAccents(HttpUtility.UrlDecode(htResponseInfo["selectedAddress.addresseeName"].ToString()));
                        billingAddress.LastName = "";
                    }

                    if (htResponseInfo.ContainsKey("selectedAddress.baseAddress.line1"))
                    {
                        billingAddress.Address1 = CommonHelper.fixquotesAccents(HttpUtility.UrlDecode(htResponseInfo["selectedAddress.baseAddress.line1"].ToString()));
                        billingAddress.Address2 = "";
                    }

                    if (htResponseInfo.ContainsKey("selectedAddress.baseAddress.postalCode"))
                    {
                        billingAddress.ZipPostalCode = CommonHelper.fixquotesAccents(HttpUtility.UrlDecode(htResponseInfo["selectedAddress.baseAddress.postalCode"].ToString()));
                    }

                    if (htResponseInfo.ContainsKey("selectedAddress.baseAddress.city"))
                    {
                        billingAddress.City = CommonHelper.fixquotesAccents(HttpUtility.UrlDecode(htResponseInfo["selectedAddress.baseAddress.city"].ToString()));
                    }

                    if (htResponseInfo.ContainsKey("selectedAddress.baseAddress.countryCode"))
                    {
                        billingAddress.CountryId = countries.Find(x => x.Code.Trim() == htResponseInfo["selectedAddress.baseAddress.countryCode"].ToString()).CountryId;
                    }

                    if (htResponseInfo.ContainsKey("selectedAddress.baseAddress.state"))
                    {
                        billingAddress.StateProvinceId = states.Find(x => x.Abbreviation.Trim() == htResponseInfo["selectedAddress.baseAddress.state"].ToString()).StateProvinceId;
                    }

                    CustData.FirstName = CommonHelper.fixquotesAccents(billingAddress.FirstName);
                    CustData.LastName = CommonHelper.fixquotesAccents(billingAddress.LastName);
                    CustData.PhoneNumber = "";
                    CustData.Email = CommonHelper.fixquotesAccents(strEmail);
                    CustData.Username = CommonHelper.fixquotesAccents(strEmail);
                }

                CustData.BillingAddress = billingAddress;
                CustData.ShippingAddress = billingAddress;
                ClientOrderData.PaymentInfo = orderData.CreditInfo;
                ClientOrderData.CustomerInfo = CustData;
                // add rush shipping level to cart object
                if (!string.IsNullOrEmpty(ddlAdditionShippingCharge.SelectedValue))
                {
                    ClientOrderData.CartInfo.ShippingMethod = UserShippingMethodType.Rush;
                    ClientOrderData.CartInfo.ShippingChargeKey = ddlAdditionShippingCharge.SelectedValue;
                }


                cartObject = new Cart();

                foreach (Sku OrderSKU in orderData.SkuItems)
                {
                    cartObject.AddItem(OrderSKU.SkuId, OrderSKU.Quantity, true, false);
                }

                cartObject.ShippingAddress = ClientOrderData.CustomerInfo.ShippingAddress;
                cartObject.ShippingMethod = ClientOrderData.CartInfo.ShippingMethod;
                cartObject.ShippingChargeKey = ClientOrderData.CartInfo.ShippingChargeKey;
                cartObject.Compute();
                cartObject.ShowQuantity = false;
                ClientOrderData.CartInfo = cartObject;

                CSResolve.Resolve<IOrderService>().UpdateOrder(orderData.OrderId, ClientOrderData);
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, strTransactionId, strPayKey, 3);

            }
        }
        #endregion General Methods

    }
}