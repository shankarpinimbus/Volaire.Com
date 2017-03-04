<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/CheckoutThankYouModule.ascx" TagName="Form" TagPrefix="uc1" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire Hair Volumizing Receipt</title>
<meta name="description" content="Order Confirmation for Volaire Hair Volumizing Products" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/NoBack.js"></script>

 
</head>
<body>
<uc:Header ID="Header" runat="server" />

<section class="receipt">
    <div class="container">
        <uc1:Form ID="Form1" runat="server" />
    </div>
</section>
    



<uc:Footer ID="Footer" runat="server" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
  

