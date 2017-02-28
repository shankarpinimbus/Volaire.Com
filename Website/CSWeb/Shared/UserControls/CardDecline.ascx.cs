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
using CSBusiness.OrderManagement;
using CSBusiness.Payment;

namespace CSWeb.Shared.UserControls
{

    public partial class CardDecline : System.Web.UI.UserControl
    {
        #region Variable and Events Declaration
        bool _bError = false;
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
        #endregion Variable and Events Declaration

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, typeof(string), "ShowPopup", "MM_showHideLayers('mask','','hide');", true);

            if (!IsPostBack)
            {
                txtShippingFirstName.Focus();

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

                txtPhoneNumber.Attributes.Add("onkeyup", "return autoTab(this, 15, event);");

                txtCCNumber1.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber2.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber3.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber4.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                lblCCNumberError.Text = ResourceHelper.GetResoureValue("SummaryCCDecline");
            }

            if (!IsPostBack)
            {
                BindShippingCountries(true);
                BindShippingRegions();
                BindCountries(true);
                BindRegions();
                PopulateExpiryYear();
                BindCreditCard();
                ReloadCartData();
                BindData();
            }

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));


            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxArea.ClientID,
            //     String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric' }});", TextBoxArea.ClientID, TextBoxPhoneNum1.ClientID), true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxPhoneNum1.ClientID,
            //    String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric', previous: '{2}' }});", TextBoxPhoneNum1.ClientID, TextBoxPhoneNum2.ClientID, TextBoxArea.ClientID), true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxPhoneNum2.ClientID,
            //    String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric', previous: '{2}' }});", TextBoxPhoneNum2.ClientID, TextBoxEmail.ClientID, TextBoxPhoneNum1.ClientID), true);


        }

        #endregion Page Events

        #region General Methods

        /// <summary>
        /// List of Country from Cache Data
        /// </summary>
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
        private void BindShippingRegions()
        {

            ddlShippingState.Items.Clear();
            int countryId = Convert.ToInt32(ddlShippingCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlShippingState.DataSource = list;
            ddlShippingState.DataValueField = "StateProvinceId";
            ddlShippingState.DataBind();
        }        
        /// <summary>
        /// Binds the CreditCards.
        /// </summary>
        private void BindCreditCard()
        {
            ddlCCType.Items.Clear();
            ddlCCType.DataSource = CommonHelper.BindToEnum(typeof(CreditCardTypeEnum));
            ddlCCType.DataTextField = "Key";
            ddlCCType.DataValueField = "Value";
            ddlCCType.DataBind();
            ddlCCType.Items.Insert(0, new ListItem("- Select -", string.Empty));

        }

        /// <summary>
        /// Binds the regions.
        /// </summary>

        public void BindCountries(bool setValue)
        {
            ddlCountry.DataSource = CountryManager.GetActiveCountry();
            ddlCountry.DataBind();
            if (setValue)
                ddlCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// Binds the regions.
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

        protected void ShippingCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindShippingRegions();
        }
        protected void Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindRegions();
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
            // DropDownListExpMonth.SelectedValue = DateTime.Now.ToString("MM");
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
        public bool validateInput()
        {


            


            if (ddlShippingState.Items[ddlShippingState.SelectedIndex].Text.Equals("select"))
            {
                lblShippingStateError.Text = ResourceHelper.GetResoureValue("ShippingStateErrorMsg");
                lblShippingStateError.Visible = true;
                _bError = true;
            }
            else
                lblShippingStateError.Visible = false;

            string strPhoneNum = txtPhoneNumber.Text;

            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                lblShippingPhoneNumberError.Text = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                lblShippingPhoneNumberError.Visible = true;
                _bError = true;
            }
            else
                lblShippingPhoneNumberError.Visible = false;

            

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
            

            DateTime expire = new DateTime();
            if (ddlExpYear.SelectedIndex > -1 && ddlExpMonth.SelectedIndex > -1)
            {
                expire = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpYear.SelectedIndex].Text), 1);
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
                else
                    lblCCNumberError.Visible = false;


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
            return _bError;

        }

        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                SaveData();
                Response.Redirect(RedirectUrl + "?PId=110&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
            }


        }
        public void SaveData()
        {
            if (Page.IsValid)
            {
                ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];


                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                billingAddress.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(txtAddress1.Value);
                billingAddress.Address2 = CommonHelper.fixquotesAccents(txtAddress2.Text);
                billingAddress.City = CommonHelper.fixquotesAccents(txtCity.Value);
                billingAddress.StateProvinceId = Convert.ToInt32(ddlState.SelectedValue);
                billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                billingAddress.ZipPostalCode = txtZipCode.Value;

                Address shippingAddress = new Address();
                shippingAddress.FirstName = CommonHelper.fixquotesAccents(txtShippingFirstName.Value);
                shippingAddress.LastName = CommonHelper.fixquotesAccents(txtShippingLastName.Value);
                shippingAddress.Address1 = CommonHelper.fixquotesAccents(txtShippingAddress1.Value);
                shippingAddress.Address2 = CommonHelper.fixquotesAccents(txtShippingAddress2.Text);
                shippingAddress.City = CommonHelper.fixquotesAccents(txtShippingCity.Value);
                shippingAddress.StateProvinceId = ddlShippingState.SelectedIndex;
                shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                shippingAddress.ZipPostalCode = txtShippingZipCode.Value;

                clientData.CustomerInfo.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Value);
                clientData.CustomerInfo.LastName = CommonHelper.fixquotesAccents(txtLastName.Value);
                clientData.CustomerInfo.PhoneNumber = txtPhoneNumber.Text;
                clientData.CustomerInfo.Email = CommonHelper.fixquotesAccents(txtEmail.Value);
                clientData.CustomerInfo.BillingAddress = billingAddress;
                clientData.CustomerInfo.ShippingAddress = shippingAddress;



                PaymentInformation paymentDataInfo = new PaymentInformation();
                string CardNumber = txtCCNumber1.Text + txtCCNumber2.Text + txtCCNumber3.Text + txtCCNumber4.Text;
                paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(CardNumber);
                paymentDataInfo.CreditCardType = Convert.ToInt32(ddlCCType.Items[ddlCCType.SelectedIndex]);
                paymentDataInfo.CreditCardName = ddlCCType.Items[ddlCCType.SelectedIndex].Text;
                paymentDataInfo.CreditCardExpired = new DateTime(int.Parse(ddlExpYear.Items[ddlExpYear.SelectedIndex].Text), int.Parse(ddlExpMonth.Items[ddlExpMonth.SelectedIndex].Text), 1);
                paymentDataInfo.CreditCardCSC = txtCvv.Value;

                clientData.PaymentInfo = paymentDataInfo;

                int orderId = clientData.OrderId;
                CSResolve.Resolve<IOrderService>().UpdateOrder(orderId, clientData);
                if (orderId > 1)
                {
                    clientData.OrderId = orderId;
                    Session["ClientOrderData"] = clientData;
                    OrderProcessor.ProcessOrderAndRedirect(orderId);
                    //Server.Transfer(string.Format("/Shared/ProcessOrder.aspx?oid={0}", CartContext.OrderId),true);

                }
            }
        }
    
        protected void rblUpdateBillingAddress_CheckedChanged(object sender, EventArgs e)
        {
            bool billingVal = Convert.ToBoolean(rblUpdateBillingAddress.SelectedItem.Value);
            if (billingVal)
                pnlBillingAddress.Visible = true;
            else
                pnlBillingAddress.Visible = false;
        }

        protected void rblUpdateShippingAddress_CheckedChanged(object sender, EventArgs e)
        {
            bool shippingVal = Convert.ToBoolean(rblUpdateShippingAddress.SelectedItem.Value);
            if (shippingVal)
                pnlShippingAddress.Visible = true;
            else
                pnlShippingAddress.Visible = false;
        }
        public void ReloadCartData()
        {
            ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];

            ddlShippingCountry.Items.FindByValue(clientData.CustomerInfo.ShippingAddress.CountryId.ToString()).Selected = true;
            ddlCountry.Items.FindByValue(clientData.CustomerInfo.BillingAddress.CountryId.ToString()).Selected = true;

            ddlShippingState.Items.FindByValue(clientData.CustomerInfo.ShippingAddress.StateProvinceId.ToString()).Selected = true;
            ddlState.Items.FindByValue(clientData.CustomerInfo.BillingAddress.StateProvinceId.ToString()).Selected = true;

            //Shipping information
            txtShippingFirstName.Value = clientData.CustomerInfo.ShippingAddress.FirstName;
            txtShippingLastName.Value = clientData.CustomerInfo.ShippingAddress.LastName;
            txtShippingAddress1.Value = clientData.CustomerInfo.ShippingAddress.Address1;
            txtShippingAddress2.Text = clientData.CustomerInfo.ShippingAddress.Address2;
            txtShippingCity.Value = clientData.CustomerInfo.ShippingAddress.City;
            txtShippingZipCode.Value = clientData.CustomerInfo.ShippingAddress.ZipPostalCode;


            //Payment information
            string ccNumber = CommonHelper.Decrypt(clientData.PaymentInfo.CreditCardNumber);
            txtCCNumber1.Text = ccNumber.Substring(0, 4);
            txtCCNumber2.Text = ccNumber.Substring(4, 4);
            txtCCNumber3.Text = ccNumber.Substring(8, 4);
            txtCCNumber4.Text = ccNumber.Substring(12);

            txtCvv.Value = clientData.PaymentInfo.CreditCardCSC;
            DateTime expireDate = DateTime.MinValue;
            DateTime.TryParse(clientData.PaymentInfo.CreditCardExpired.ToString(), out expireDate);
            ddlExpMonth.Items.FindByValue(expireDate.Month.ToString()).Selected = true;
            ddlExpYear.Items.FindByValue(expireDate.Year.ToString()).Selected = true;
            //ddlExpMonth.Items[ddlExpMonth.SelectedIndex] = expireDate.Month.ToString().PadLeft(2, '0');
            //ddlExpYear.Items[ddlExpYear.SelectedIndex] = expireDate.Year.ToString();

            //Billing informarion
            txtFirstName.Value = clientData.CustomerInfo.BillingAddress.FirstName;
            txtLastName.Value = clientData.CustomerInfo.BillingAddress.LastName;
            txtAddress1.Value = clientData.CustomerInfo.BillingAddress.Address1;
            txtAddress2.Text = clientData.CustomerInfo.BillingAddress.Address2;
            txtCity.Value = clientData.CustomerInfo.BillingAddress.City;
            txtZipCode.Value = clientData.CustomerInfo.BillingAddress.ZipPostalCode;
            txtEmail.Value = clientData.CustomerInfo.Email;
            txtPhoneNumber.Text = clientData.CustomerInfo.PhoneNumber;            
        }
        private void BindData()
        {
            ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];

            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(clientData.OrderId);

            dlordersList.DataSource = orderData.SkuItems;
            dlordersList.DataBind();
            LiteralSubTotal.Text = Math.Round(orderData.SubTotal, 2).ToString();
            LiteralShipping.Text = Math.Round(orderData.ShippingCost, 2).ToString();
            LiteralTax.Text = Math.Round(orderData.Tax, 2).ToString();
            LiteralTotal.Text = Math.Round(orderData.Total, 2).ToString();
            if (orderData.RushShippingCost > 0)
            {
                pnlRushLabel.Visible = true;
                pnlRush.Visible = true;
                LiteralRushShipping.Text = Math.Round(orderData.RushShippingCost, 2).ToString();
            }


            if (orderData.DiscountCode.Length > 0)
            {
                pnlPromotionLabel.Visible = true;
                pnlPromotionalAmount.Visible = true;

                lblPromotionPrice.Text = String.Format("(${0:0.00})", orderData.DiscountAmount);
            }





        }
        
        #endregion General Methods

    }
}