<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ 30-day Mega Promise Guarantee</title>
<meta name="description" content="Learn more about Volaire Mega Promise 30-day Money Back Guarantee" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
 
<body>
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />

<section class="hero hero-guarantee gradient">
    <div class="hero-guarantee1">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-guarantee.jpg" alt="Our Mega Promise" class="block" />
        </div>
    </div>
</section> 

<div class="container guarantee">
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/guarantee-richard-ward.jpg" alt="" class="block" />
</div>

     
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
