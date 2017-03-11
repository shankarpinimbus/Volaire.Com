<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm_MOBILE.ascx" TagName="ShippingBillingCreditForm" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Get Volaire™ Hair Care Products </title>
<meta name="description" content="Easy checkout for Volaire Hair Care Products " />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>

</head>
 
<body id="cart">
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />


 <uc:ShippingBillingCreditForm ID="sbcfShippingBillingCreditForm" runat="server" RedirectUrl="AddProduct.aspx" />


  <uc:Footer ID="Footer" runat="server" />
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
