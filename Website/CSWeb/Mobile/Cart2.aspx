<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.cart" EnableSessionState="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm.ascx" TagName="ShippingBillingCreditForm" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShoppingCartControl.ascx" TagName="ShoppingCartControl" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/Overlay.js"></script>

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
  
<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_cart.html")%>

 <div class="left">

            <h2 class="webfont1">Shopping Cart</h2>
           <uc:ShoppingCartControl ID="ShoppingCartControl" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"/>
            

        </div>
       <div class="right">
 <uc:ShippingBillingCreditForm ID="sbcfShippingBillingCreditForm" runat="server" RedirectUrl="Store/AddProduct.aspx" />
 </div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
