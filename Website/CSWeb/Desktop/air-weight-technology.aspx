<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Airweight Technology Designed to Add Weightless Volume</title>
<meta name="description" content="Airweight™ Technology gives you instant, touchable, weightless volume after just ONE use! Avocado Oil, Kelp & Seaweed promotes healthy hair and strength" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="tech">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-airweight-tech gradient">
    <div class="hero-airweight-tech-1">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/AirWeight-Technology.jpg" alt="Thicker, fuller, hair with more volume just by using VOLAIRE. Get amazing volume instantly with VOLAIRE" class="block" />
        </div>
    </div>
</section> 

<section class="airweight-main">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Rise-Above.jpg" alt="VOLAIRE hair care products do not weigh hair down. Hair care with coconut and vitamins to promote hair health" class="block" />
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
</section>

<section class="airweight-quotes">
    <div class="container clearfix">
        <div class="airweight-quotes-1">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Kristi-1.jpg" alt="VOLAIRE gives you fun, sexy, alive hair that has volume that lasts all day! Instant and lasting volume with VOLAIRE." class="block" />
            <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/kristi.mp4" class="watch_demo fancy_video">Watch Her Story</a>
            <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
        </div>
        <div class="airweight-quotes-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Dean-Banowetz-1.jpg" alt="Get volume that lasts all day. Hair styles that take you from day to night, work to play with VOLAIRE!" class="block" />
        </div>
    </div>
</section>



<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
