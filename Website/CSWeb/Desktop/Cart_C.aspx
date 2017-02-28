<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShopCartBillingShippingCreditForm.ascx" TagName="ShopCartBillingShippingCreditForm" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/AmazonPayment.ascx" TagPrefix="uc" TagName="AmazonPayment" %>

<!doctype html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />

    <%#CSBusiness.DynamicVersion.Helper.IncludeFile("scripts.html")%>
    <link href="/styles/global.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form runat="server" id="fm1">
        <!-- loader overlay front end -->
        <div id="mask">
            <div class="loader">
                <p>
                    <img src="//d39hwjxo88pg52.cloudfront.net/images/loader.gif" /></p>
                <p>Your order is currently being processed.<br />
                    Please do not exit or refresh this page to ensure that your order is processed accurately.</p>
            </div>
        </div>
        <!-- end loader front end -->
        <uc:AmazonPayment runat="server" ID="AmazonPayment" />

        <uc:ShopCartBillingShippingCreditForm ID="bcfBillingCreditInfo" runat="server" RedirectUrl="Store/AddProduct.aspx" />

        <uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>
</body>
</html>
