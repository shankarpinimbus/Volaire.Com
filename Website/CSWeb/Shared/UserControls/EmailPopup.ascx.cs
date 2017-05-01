using CSBusiness;
using CSBusiness.Preference;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.Shared.UserControls
{
    public partial class EmailPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.txtEmail.Text = "";
                lblmsg.Text = "";
            }
        }

        protected void subButton_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            if (!String.IsNullOrEmpty(this.txtEmail.Text))
            {
                bool isEmail = Regex.IsMatch(this.txtEmail.Text, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);

                if (isEmail)
                {
                    RestClient _client;
                    SitePreference sitePreference = CSFactory.GetCacheSitePref();


                    _client = new RestClient(sitePreference.GetAttributeValue<string>("Url_Klaviyo", ""));
                    _client.AddDefaultHeader("Content-Type", "application/json");
                    var request = new RestRequest("api/v1/list/" + sitePreference.GetAttributeValue<string>("Key_EmailPopSignups", "") + "/members?api_key=" + sitePreference.GetAttributeValue<string>("APIKey_Klaviyo", "") + "&email=" + this.txtEmail.Text, Method.POST);
                    request.AddParameter("email", this.txtEmail.Text);


                    /* If this paramter is set to true we dont get the person id and 
                       email is not added into Klaviyo list until the person confirms his subscription */
                    request.AddParameter("confirm_optin", false);

                    IRestResponse response = _client.Execute(request);
                    dynamic obj = JsonConvert.DeserializeObject(response.Content);

                    if (response.StatusCode == HttpStatusCode.OK && obj != null)
                    {
                        if (obj["already_member"].Value == false)
                        {

                            lblmsg.Text = "Thank you for signing up!";
                            lblmsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#ffe61f");

                            SaveContact(this.txtEmail.Text);
                            this.txtEmail.Text = "";
                            lblmsg.Visible = true;
                        }
                        else
                        {
                            this.txtEmail.Text = "";
                            lblmsg.Visible = true;
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                            lblmsg.Text = "Email address entered is already registered";
                        }
                    }
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Text = "Please enter a valid email address";
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please enter an email address";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void SaveContact(string email)
        {
            try
            {
                string url = Request.UrlReferrer.ToString();
                CSWebBase.ContactDAL.InsertContact("", "", email.Trim(), "", "Email Subscription Klaviyo", url);
            }
            catch (Exception ex)
            {
                CSWebBase.SiteBasePage.SendErrorEmail("Email Subscription error : " + ex.Message + " | " +
                    (ex.InnerException != null ? ex.InnerException.Message : string.Empty));
            }
        }
    }
}