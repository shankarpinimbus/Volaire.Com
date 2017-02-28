<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.CONTROL.index" EnableSessionState="True" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagPrefix="uc" TagName="TrackingPixels" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

<link href="/styles/global.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>

Welcome to our Site !!!
<a href="addproduct.aspx?pid=110">Add product 110</a>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels runat="server" ID="TrackingPixels" />
</body>
</html>
