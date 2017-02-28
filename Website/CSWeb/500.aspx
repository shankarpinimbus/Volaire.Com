<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="CSWeb.Desktop._500" %>

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
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header.html")%>
<div class="container content_pad">
    <h1 class="pad20">Sorry, there was an error.</h1>
    <p>Please return to our <a href="index.aspx">home page</a>.</p>
</div>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("footer.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</body>
</html>
