<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
<body>
<form runat="server" id="fm1">

<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header.html")%>

<div class="content">
<h2>Oops!</h2>
<p>We're sorry! We've encountered an error on our site and the Webmaster has been notified. Please go to <a href="http://www.wisetvoffer.com">www.wisetvoffer.com</a> or contact us at (800) 216-4467 to finalize your order! </p>

</div>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("footer.html")%>
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
