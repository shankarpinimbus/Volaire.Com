﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Products for Volumizing, Texture and Healthy Scalp and Hair</title>
<meta name="description" content="Volaire is a sulfate-free and paraben-free hair volumizing system that gives healthy, beautiful hair with natural shine and weightless texture and volume" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="products">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-products">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Gorgeous-Hair.jpg" alt="VOLAIRE is the Volumizing Hair System that delivers full-proof results for everyday, effortless, lasting volume." class="block" />
        <div class="hero-products-content">
            <h1>
                Unbelievable
                <span class="line2">Volume. <span class="webfont1 ital uncaps">minimal effort.</span></span>
            </h1>
            <p>The <strong class="caps">Volaire<sup>™</sup> Hair Volumizing System</strong> is a game-changer for everyone, regardless of hair type or challenge – long, short, curly, straight, thin, fine, flat, or just plain unruly. Whether you want airy, bouncy volume or full-bodied, mega volume, <strong>AirWeight Technology<sup>™</sup></strong> will make you look like you just left the salon – every day. </p>
        </div>
        
    </div>
</section> 

<section class="products-main">
    <div class="container">
        <div class="products-main-benefits">
            <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
        </div>
        <div class="products-1">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Shampoo-Conditioner.png" alt="Sulfate free shampoo (sulfate-free shampoo) that lathers and provides instant and lasting volume to your hairstyle" class="block" />
        </div>
        <div class="products-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Uplift-Mist.jpg" alt="Hair care products that give you incredible lift and continuous volume throughout the day. Tossable, touchable volume" class="block" />
        </div>
        <div class="products-3">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Air-Magic-Spray.png" alt="Best texturizing spray and hair spray for hair volume. Instantly get two times the volume over hair without VOLAIRE" class="block" />
        </div>
    </div>
</section>

<section class="products-quotes">
    <div class="container clearfix">
        <div class="products-quotes-1">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Luke-Oconnor-1.jpg" alt="With VOLAIRE you get gorgeous, shiny,healthy-looking, bouncy hair with tons of volume that lasts all day long" class="block" />
        </div>
        <div class="products-quotes-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Angie-2.jpg" alt="Women of all ages use VOLAIRE to give them lasting volume that stays! Experience gorgeous hair again!" class="block" />
            <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/angie.mp4" class="watch_demo fancy_video">Watch Her Story</a>
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
