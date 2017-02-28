<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tokenex.ascx.cs" Inherits="CSWeb.Shared.UserControls.Tokenex" %>
<header>
    <!--TokenEx JavaScript file-->
    <script type="text/javascript" src="<%= TokenExJSFile %>"></script>
    <script type="text/javascript">
        function encryptCCnumber() {
            try {
                
                var creditCard = document.getElementById("txtCCNumber1").value;
                if (creditCard == "" | creditCard == "XXXXXXXXXXXXXXXX") return true;
                var key = document.getElementById('TxEncryptionKey').value;
                var apiKey = document.getElementById('hlApiKey').value;
                var tokenExId = document.getElementById('hlTokenExID').value;
                var tokenExAPIUrl = document.getElementById('hlTokenExAPIUrl').value;
                var cipherText = TxEncrypt(key, creditCard);
                
                //Comment for JSON
                //document.getElementById("txtCCNumber1").value = "XXXXXXXXXXXXXXXX";
                document.getElementById("hlEncryptedCCNum").value = cipherText;
                MM_showHideLayers('mask', '', 'show');
                var elementExists = document.getElementById("sbcfShippingBillingCreditForm_imgBtn");
                var elementExistsccDecline = document.getElementById("ucCardDecline_imgBtn");
                if (elementExists != null) {
                    __doPostBack('sbcfShippingBillingCreditForm$imgBtn', '');
                }

                if (elementExistsccDecline != null) {
                    __doPostBack('ucCardDecline$imgBtn', '');
                }
                
            } catch (e) {
                return false;
            }
        }
    </script>
</header>

<asp:HiddenField ID="TxEncryptionKey" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlTokenExAPIUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlApiKey" runat="server" ClientIDMode="Static" Value="mUyKbhAEKF6jG6EAWXvx" />
<asp:HiddenField ID="hlTokenExID" runat="server" ClientIDMode="Static" Value="7655146737828306" />
<asp:HiddenField ID="hlEncryptedCCNum" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlToken" runat="server" ClientIDMode="Static" />


