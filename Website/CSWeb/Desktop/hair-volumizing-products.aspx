<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
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
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-products.jpg" alt="" class="block" />
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
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products-shampoo-conditioner.png" alt="Pump UP the volume. Weightless Volumizing Shampoo & Weightless Fortifying Conditioner" class="block" />
        </div>
        <div class="products-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products-volumizing-lift.jpg" alt="Add on incredible lift. Uplift Volumizing Mist" class="block" />
        </div>
        <div class="products-3">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products-air-magic-spray.png" alt="Add on incredible lift. Uplift Volumizing Mist" class="block" />
        </div>
    </div>
</section>

<section class="products-quotes">
    <div class="container clearfix">
        <div class="products-quotes-1">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products-quote-luke.jpg" alt="'With Volaire you get full, bouncing, shiny, healthy-looking hair with tons of volume that lasts all day.' - Luke O’Connor, celebrity stylist" class="block" />
        </div>
        <div class="products-quotes-2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products-quote-angie.jpg" alt="'With Volaire you get full, bouncing, shiny, healthy-looking hair with tons of volume that lasts all day.' - Luke O’Connor, celebrity stylist" class="block" />
            <a href="#video" class="watch_demo">Watch Her Story</a>
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
