<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewOrder.aspx.cs" Inherits="CSWeb.Desktop.ReviewOrder"
    EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ReviewOrder.ascx" TagName="Form" TagPrefix="uc1" %>
<!doctype html> 
<html>
<head runat="server">
<meta charset="utf-8">    
<title></title>
<meta name="description" content=""/>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/Overlay.js"></script>

</head>
<body>
<form id="reviewform" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<uc1:Form ID="Form1" runat="server" />
    
     
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
