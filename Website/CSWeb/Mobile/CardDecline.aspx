<%@Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.Mobile.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm.ascx" TagName="Form" TagPrefix="uc1" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script type="text/javascript" src="/scripts/NoBack.js"></script>

</head>
<body>
<form id="form1" runat="server">
<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_upsell.html")%>

<div class="content">

        <uc1:Form id="ucCardDecline" runat="server" />

</div>

  
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("footer.html")%>
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
