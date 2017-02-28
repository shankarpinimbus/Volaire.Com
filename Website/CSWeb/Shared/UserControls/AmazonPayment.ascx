<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmazonPayment.ascx.cs" Inherits="CSWeb.Shared.UserControls.AmazonPayment" %>
<header>
    <%--<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4.min.js" type="text/javascript"></script>--%>
    <script src="/Shared/UserControls/AmazonPayment.js"></script>
    <script type='text/javascript'>
        var clientID = "<%= ConfigurationManager.AppSettings["clientId"].ToString()%>";
        window.onAmazonLoginReady = function () {
            amazon.Login.setClientId(clientID);
        };
    </script>
     <%--<script type='text/javascript' src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'></script>--%>
    <div id="scriptdiv">
        <script type='text/javascript' id="AmazonSrc" src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'></script>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var environment = "<%= ConfigurationManager.AppSettings["environment"].ToString()%>";
            if(environment=="sandbox")
            {
                var s = document.createElement("script");
                s.type = "text/javascript";
                s.src = "https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js";
                s.innerHTML = null;
                s.id = "AmazonSrc";
                document.getElementById("scriptdiv").innerHTML = "";
                document.getElementById("scriptdiv").appendChild(s);                
            }
            else
            {
                var s = document.createElement("script");
                s.type = "text/javascript";
                s.src = "https://static-na.payments-amazon.com/OffAmazonPayments/us/js/Widgets.js";
                s.innerHTML = null;
                s.id = "AmazonSrc";
                document.getElementById("scriptdiv").innerHTML = "";
                document.getElementById("scriptdiv").appendChild(s);
            }

        });
                </script>

    <style type="text/css">
        #addressBookWidgetDiv {
			width: 100%;
			height: 250px;
        }
    </style>

    <style type="text/css">
        #walletWidgetDiv {
			width: 100%;
			height: 250px;
        }
    </style>
</header>

<div id="amazonPayButton"></div>
<script type="text/javascript">
    var authRequest;
    var varsellerID = "<%= ConfigurationManager.AppSettings["merchantId"].ToString()%>";
    OffAmazonPayments.Button("amazonPayButton", varsellerID, {
        type: "PwA",
        color: "Gold",
        size: "medium",
        authorization: function () {
            loginOptions =
            { scope: "profile postal_code payments:widget payments:shipping_address", popup: true };
            authRequest = amazon.Login.authorize(loginOptions,
            "cart");
        },
        onError: function (error) {
            //alert("error on Pay Button: " + error.getErrorMessage());
        }
    });
</script>


<div id="cartForms">
    <asp:Panel runat="server" ID="pnlCartInfo">
        <div id="addressBookWidgetDiv">
        </div>
        <script>            
            var varsellerID = "<%= ConfigurationManager.AppSettings["merchantId"].ToString()%>";
            new OffAmazonPayments.Widgets.AddressBook({
                sellerId: varsellerID,
                onOrderReferenceCreate: function (orderReference) {
                    var orderRefId = orderReference.getAmazonOrderReferenceId();
                    //alert("Order reference id: " + orderRefId);
                    $("#hOrderRefId").val(orderRefId);
                    showHideForms();
                },
                onAddressSelect: function (orderReference) {
                },
                design: {
                    designMode: 'responsive'
                },
                onError: function (error) {
                    //alert(error.toString());
                }
            }).bind("addressBookWidgetDiv");
        </script>
        <br />
        <div id="walletWidgetDiv">
        </div>
        <script>
            
            var varsellerID = "<%= ConfigurationManager.AppSettings["merchantId"].ToString()%>";
            new OffAmazonPayments.Widgets.Wallet({
                sellerId: varsellerID,
                onPaymentSelect: function (orderReference) {
                    // Replace this code with the action that you want to perform
                    // after the payment method is selected.
                },
                design: {
                    designMode: 'responsive'
                },
                onError: function (error) {
                   // alert(error.toString());
                }
            }).bind("walletWidgetDiv");
        </script>
    </asp:Panel>
   
    <div class="error-1">      
        <asp:Label ID="lblPrompt" EnableViewState="false" runat="server" Text=" <br> Please agree to convert your order to 1-pay!" Visible="False" ForeColor="Red">
        </asp:Label>
    </div>
    <br />  
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//dn3q6k0c0pyia.cloudfront.net/images/btn_checkout_white.jpg"
        CssClass="form_line_center" OnClientClick="MM_showHideLayers('mask', '', 'show');" OnClick="imgBtn_Click" CausesValidation="false" />
</div>
<asp:HiddenField ID="hOrderRefId" runat="server" ClientIDMode="Static" />
<%--  --%>
