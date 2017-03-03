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
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-airweight-technology.jpg" alt="Thicker, Fuller looking hair with AirWeight Technology™" class="block" />
        </div>
    </div>
</section> 

<section class="airweight-main">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-rises-above-the-rest.jpg" alt="VOLAIRE Rises Above the Rest" class="block" />
    </div>
</section>

<section class="airweight-quotes">
    <div class="container clearfix">
        <div class="airweight-quotes-1">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/airweight-quote-kristi.jpg" alt="'With Volaire you get full, bouncing, shiny, healthy-looking hair with tons of volume that lasts all day.' - Luke O’Connor, celebrity stylist" class="block" />
            <a href="#video" class="watch_demo">Watch Her Story</a>
            <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
        </div>
        <div class="airweight-quotes-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/airweight-quote-dean-banowetz.jpg" alt="'With Volaire you get full, bouncing, shiny, healthy-looking hair with tons of volume that lasts all day.' - Luke O’Connor, celebrity stylist" class="block" />
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
