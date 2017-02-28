<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/CheckoutThankYouModule2.ascx" TagName="Form" TagPrefix="uc1" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script type="text/javascript" src="/scripts/NoBack.js"></script>

</head>
<body>

<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_cart.html")%>

<div class="content">
     <uc1:Form ID="Form1" runat="server" />
</div>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("footer.html")%>
</div>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
