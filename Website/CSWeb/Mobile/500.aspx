<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="CSWeb.Mobile._500" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

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
