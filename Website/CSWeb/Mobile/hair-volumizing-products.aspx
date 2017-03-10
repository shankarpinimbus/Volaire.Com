<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<link rel="stylesheet" href="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.css" />
<script src="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.min.js"></script>
</head>
 
<body class="products">
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-products.jpg" alt="Unbelievable Volume. Minimal Effort. " class="block" />

    <div class="contentpad1">
        <p class="text-center intro">The <strong class="caps">Volaire<sup>™</sup> Hair Volumizing System</strong> is a game-changer for everyone, regardless of hair type or challenge – long, short, curly, straight, thin, fine, flat, or just plain unruly. Whether you want airy, bouncy volume or full-bodied, mega volume, <strong class="med">AirWeight Technology<sup>™</sup></strong> will make you look like you just left the salon – every day. </p>
    </div>

    
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-shampoo-conditioner.jpg" alt="VOLAIRE Weightless Volumizing Shampoo & VOLAIRE Weightless Fortifying Conditioner" class="block" style="margin: 1.3rem 0 .2rem;" />
    
    <div class="contentpad2">
        <p>A revolutionary innovation in sulfate-free shampoos that gives you the lather you love without stripping away essential moisture</p>
        <p>Unique Oxygen-infused formulas create lasting volume and natural shine without weighing down the hair</p>
        <p>Fortifying properties help strengthen hair to prevent breakage</p>
    </div>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-uplift-volumizing-mist.jpg" alt="VOLAIRE Uplift Volumizing Mist" class="block" />
    <div class="contentpad2">
        <p>Ultra-lightweight mist locks onto roots and strands of hair to delivery super-charged lift and continuous volume </p>
        <p>Heat protectants help maintain hair health during styling</p>
        <p>Delivers touchable, tossable movement that you can run your fingers through – never stiff, tacky, or sticky</p>
    </div>

    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-women-agree.png" alt="After just 1 use, 100% of womenusing VOLAIRE agreed instant lift and volume.† † As reported by women in a 21-person company sponsored study." class="block" />
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-air-magic.jpg" alt="Air Magic Texturizing Spray" class="block" />
    <div class="contentpad2" style="z-index: 4;">
        <p>Thickens and texturizes hair, reviving limp locks with INSTANT volume</p>
        <p>Lightweight, invisible hold allows workable styling without build-up</p>
        <p>Extends your style so you can go longer between washings</p>
    </div>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-ingredients.jpg" alt="Help revive the look of lifeless hair and restore a vibrant luster with natural conditioning, including Avocado Oil, Essential Fatty Acids, and Red & Green Algae" class="block" style="margin-top: -40%; position: relative; z-index: 3;" />
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-luke-o-connor.jpg" alt="'With VOLAIRE you get full, bouncing, shiny, healthy-looking hair with tons of volume that lasts all day.' Luke O'Connor, Celebrity Stylist" class="block"  />

    <div class="products-angie">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-angie.jpg" alt="'With VOLAIRE I have height in my hair and it stays!' - Angie, Age 56" class="block"  />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/angie.mp4" class="watch_demo fancy_video">Watch Her Story</a>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
