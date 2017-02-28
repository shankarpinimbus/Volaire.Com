<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">


<a href="AddProduct.aspx?PId=118&CId=2">Add To Cart</a>
 
<p style="margin-top: 200px;">
    <a href="#guarantee" class="guarantee">Money Back Guarantee</a>
</p>

</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
