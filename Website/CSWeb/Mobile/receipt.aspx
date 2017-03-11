<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/CheckoutThankYouModule2.ascx" TagName="Form" TagPrefix="uc1" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_MOBILE.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_MOBILE.ascx" TagName="Footer" TagPrefix="uc" %>

<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire Hair Volumizing Receipt</title>
<meta name="description" content="Order Confirmation for Volaire Hair Volumizing Products" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/NoBack.js"></script>

 
</head>
<body id="cart">
<div class="container">
<uc:Header ID="Header" runat="server" />
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_cart.html")%>


     <uc1:Form ID="Form1" runat="server" />

<uc:Footer ID="Footer" runat="server" />
</div>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
