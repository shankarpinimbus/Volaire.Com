<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TokenSecureNet.ascx.cs" Inherits="CSWeb.Shared.UserControls.TokenSecureNet" %>
<header>
     <!--TokenSecureNet JavaScript file-->
    <script type="text/javascript" src="<%= TokenSecureNetJSFile %>"></script>
<script>
    function tokenize() {
 
        var publicKey = setPublicKey('<%= TokenSecureNetPublicKey %>');
        var e = document.getElementById("ddlState");
        var response = tokenizeCard(
 
            {
                "publicKey": publicKey,
                "card":
                {
                    "number": document.getElementById("txtCCNumber1").value,
                    "cvv": document.getElementById('txtCvv').value,
                    "expirationDate": document.getElementById('ddlExpMonth').value + '/' + document.getElementById('ddlExpYear').value,
                    "firstName": document.getElementById('txtFirstName').value,
                    "lastName": document.getElementById('txtLastName').value,
                    "address":
                    {
                        "line1": document.getElementById('txtAddress1').value,
                        "city": document.getElementById('txtCity').value,
                        "state": e.options[e.selectedIndex].value,
                        "zip": document.getElementById('txtZipCode').value
                    }
                },
                "addToVault": true,
                "developerApplication":
                {
                    "developerId": 10000707,
                    "version": '1.0'
                }
            }
        ).done(function (result) {
 
            var responseObj = $.parseJSON(JSON.stringify(result));
 
            if (responseObj.success) {
                document.getElementById("hlEncryptedCCNum").value = responseObj.token;
                document.getElementById("hlCustomerID").value = responseObj.customerId;
                MM_showHideLayers('mask', '', 'show');
                var elementExists = document.getElementById("sbcfShippingBillingCreditForm_imgBtn");
                var elementExistsccDecline = document.getElementById("ucCardDecline_imgBtn");
                if (elementExists != null) {
                    __doPostBack('sbcfShippingBillingCreditForm$imgBtn', '');
                }

                if (elementExistsccDecline != null) {
                    __doPostBack('ucCardDecline$imgBtn', '');
                }
                //alert(responseObj.token);
                // do something with responseObj.token
            } else {
                //alert("token was not created");
                // do something with responseObj.message
 
            }
 
        }).fail(function () {
            alert("error");
            // an error occurred
        });
        return response;
    }
</script>
</header>

<asp:HiddenField ID="TxEncryptionKey" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlTokenExAPIUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlApiKey" runat="server" ClientIDMode="Static" Value="mUyKbhAEKF6jG6EAWXvx" />
<asp:HiddenField ID="hlTokenExID" runat="server" ClientIDMode="Static" Value="7655146737828306" />
<asp:HiddenField ID="hlEncryptedCCNum" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlToken" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hlCustomerID" runat="server" ClientIDMode="Static" />


