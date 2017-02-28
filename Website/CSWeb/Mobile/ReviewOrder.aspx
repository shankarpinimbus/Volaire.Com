<%@Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewOrder.aspx.cs" Inherits="CSWeb.Mobile.Store.ReviewOrder" EnableViewState="true" EnableSessionState="True" %>

<%@ Register Src="~/Shared/UserControls/ReviewOrder.ascx" TagName="Form" TagPrefix="uc1" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
<body>
<form id="reviewform" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<uc1:Form ID="Form1" runat="server" />
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</body>
</html>
