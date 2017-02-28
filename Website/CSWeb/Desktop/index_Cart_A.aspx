<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_A" EnableSessionState="True" %>

<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm.ascx" TagName="ShippingBillingFormControl" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
<body>
<form runat="server" id="fm1">
    <!-- loader overlay front end -->
    <div id="mask">
        <div class="loader">
            <p><img src="//d39hwjxo88pg52.cloudfront.net/images/loader.gif" /></p>
            <p>Your order is currently being processed.<br />Please do not exit or refresh this page to ensure that your order is processed accurately.</p>
        </div>
    </div>
    <!-- end loader front end -->


    <uc:ShippingBillingFormControl ID="bfcBillingInfo1" runat="server" RedirectUrl="/Desktop/AddProduct.aspx"/>

        
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
