using System;
using CSWeb.Tokenization;
using System.Configuration;
namespace CSWeb.Shared.UserControls
{
    public partial class TokenSecureNet : System.Web.UI.UserControl
    {

        public string TokenSecureNetJSFile
        {
            get
            {
                return ConfigurationManager.AppSettings["TokenSecureNetJavaUrl"];
            }
        }

        public string TokenSecureNetPublicKey
        {
            get
            {
                return ConfigurationManager.AppSettings["TokenSecureNetPublicKey"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            TxEncryptionKey.Value = ConfigurationManager.AppSettings["TokenSecureNetPublicKey"];
            hlTokenExAPIUrl.Value = ConfigurationManager.AppSettings["TokenSecureNetAPIUrl"];
        }

        public string EncryptedCcNum
        {
            get
            {
                return hlEncryptedCCNum.Value;
            }
        }

        public string ReceivedToken
        {
            get
            {
                return hlEncryptedCCNum.Value; 
                //return hlToken.Value;
            }
        }

        public string ReceivedCustomerID
        {
            get
            {
                return hlCustomerID.Value;
                //return hlToken.Value;
            }
        }

        public string GetCCNumToken()
        {
            return hlEncryptedCCNum.Value;
        }
    }
}