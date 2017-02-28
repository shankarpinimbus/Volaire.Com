using System;
using CSWeb.Tokenization;
using System.Configuration;
namespace CSWeb.Shared.UserControls
{
    public partial class Tokenex : System.Web.UI.UserControl
    {

        public string TokenExJSFile
        {
            get
            {
                return ConfigurationManager.AppSettings["TokenExJavaUrl"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            TxEncryptionKey.Value = ConfigurationManager.AppSettings["TokenExPublicKey"];
            hlTokenExAPIUrl.Value = ConfigurationManager.AppSettings["TokenExAPIUrl"];
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
                return TokenexProcessor.GetInstance().Tokenize(EncryptedCcNum);
                //return hlToken.Value;
            }
        }

        public string GetCCNumToken()
        {
            return TokenexProcessor.GetInstance().Tokenize(EncryptedCcNum);
        }
    }
}