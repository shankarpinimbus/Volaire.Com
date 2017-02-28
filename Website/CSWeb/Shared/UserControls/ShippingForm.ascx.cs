using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.CustomerManagement;
using CSBusiness.Preference;
using CSCore.Utils;
using CSCore.DataHelper;
using CSBusiness.Resolver;
using CSWebBase;

namespace CSWeb.Shared.UserControls
{

    public partial class ShippingForm : System.Web.UI.UserControl
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
                //txtEmail.Attributes["type"] = "email";
                //if (OrderHelper.GetVersionName().ToLower() == "mobile")
                //    txtPhoneNumber.Attributes.Add("type", "tel");
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

                //txtEmail.Attributes.Add("oninvalid", "InvalidMsg(this)");
                //txtEmail.Attributes.Add("oninput", "this.setCustomValidity('')");
                //revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                txtPhoneNumber.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("PhoneNumberErrorMsg") + "')");
                txtPhoneNumber.Attributes.Add("oninput", "this.setCustomValidity('')");
                ddlShippingState.Attributes.Add("oninvalid", "this.setCustomValidity('" + ResourceHelper.GetResoureValue("ShippingStateErrorMsg") + "')");
                ddlShippingState.Attributes.Add("oninput", "this.setCustomValidity('')");
                
            }

            if (!IsPostBack)
            {
                string versionName = OrderHelper.GetVersionName().ToLower();
                //if (versionName.Equals("a1"))
                //{
                //    dSidePromo.Visible = false;
                //    dSForm.Visible = true;
                //}
                //else
                //{
                //    dSidePromo.Visible = true;
                //    dSForm.Visible = false;
                //}

                BindShippingCountries(true);
                BindShippingRegions();

            }

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));


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
            ddlShippingState.Items.Insert(0, new ListItem("- Select -", string.Empty));

            if (!string.IsNullOrEmpty(ddlStateJS.Value))
            {
                ddlShippingState.Items.FindByText(ddlStateJS.Value).Selected = true;
                ddlStateJS.Value = "";
            }
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
            
            if (CommonHelper.EnsureNotNull(txtShippingZipCode.Value) != String.Empty)
            {
                if (ddlShippingCountry.SelectedValue.Contains("231"))
                {
                    if (!CommonHelper.IsValidZipCode(txtShippingZipCode.Value))
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
                    if (!CommonHelper.IsValidZipCodeCanadian(txtShippingZipCode.Value))
                    {
                        lblShippingZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeValidationErrorMsg");
                        lblShippingZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblShippingZiPError.Visible = false;
                }

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

            return _bError;

        }

        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                SaveData();
                int pid = OrderHelper.GetMainSkuKit();
                // Response.Redirect("addproduct.aspx?PId=" + pid + "&did=125&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
                Response.Redirect("addproduct.aspx?PId=" + pid + "&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
            }


        }
        protected void ShippingState_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            
        }
        public void SaveData()
        {
            if (Page.IsValid)
            {
                //Set Customer Information
                Address shippingAddress = new Address();
                shippingAddress.FirstName = CommonHelper.fixquotesAccents(txtShippingFirstName.Value);
                
                shippingAddress.LastName = CommonHelper.fixquotesAccents(txtShippingLastName.Value);
                shippingAddress.Address1 = CommonHelper.fixquotesAccents(txtShippingAddress1.Value);
                shippingAddress.Address2 = CommonHelper.fixquotesAccents(txtShippingAddress2.Text);
                shippingAddress.City = CommonHelper.fixquotesAccents(txtShippingCity.Value);
                shippingAddress.StateProvinceId = Convert.ToInt32(ddlShippingState.SelectedValue);
                shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                shippingAddress.ZipPostalCode = txtShippingZipCode.Value;

                Customer CustData = new Customer();
               CustData.FirstName = CommonHelper.fixquotesAccents(txtShippingFirstName.Value);
                
                CustData.LastName = CommonHelper.fixquotesAccents(txtShippingLastName.Value);
                CustData.PhoneNumber = CommonHelper.GetCleanPhoneNumber(txtPhoneNumber.Text);
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.BillingAddress = shippingAddress;
                CustData.ShippingAddress = shippingAddress;

                //Set the Client Order objects
                ClientCartContext contextData = (ClientCartContext)Session["ClientOrderData"];
                contextData.CustomerInfo = CustData;
                contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(CustData,contextData);
                Session["ClientOrderData"] = contextData;
            }
        }

        #endregion General Methods

    }
}