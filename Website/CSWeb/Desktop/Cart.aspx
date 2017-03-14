<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.cart" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm.ascx" TagName="ShippingBillingCreditForm" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShoppingCartControl.ascx" TagName="ShoppingCartControl" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Get Volaire™ Hair Care Products </title>
<meta name="description" content="Easy checkout for Volaire Hair Care Products " />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<script src="/Scripts/Overlay.js"></script>

</head>

 
<body>
<form runat="server" id="fm_credit">
<!-- loader overlay front end -->
<div id="mask">
    <div class="loader">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/images/loader.gif" /></p>
        <p>Your order is currently being processed.<br />Please do not exit or refresh this page to ensure that your order is processed accurately.</p>
    </div>
</div>
<!-- end loader front end --> 
<uc:Header ID="Header" runat="server" />


<section class="hero hero-cart-wrap gradient">
    <div class="hero-cart">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-cart.jpg" alt="Volaire Hair Volumizing System - Everyday effortless volume!" class="block" />
        </div>
    </div>
</section> 


<uc:ShippingBillingCreditForm ID="sbcfShippingBillingCreditForm" runat="server" RedirectUrl="Store/AddProduct.aspx" />

<uc:Footer ID="Footer" runat="server" />

</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
