<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/CheckoutThankYouModule.ascx" TagName="Form" TagPrefix="uc1" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/NoBack.js"></script>

 
</head>
<body>
<uc1:Form ID="Form1" runat="server" />
     
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
  

