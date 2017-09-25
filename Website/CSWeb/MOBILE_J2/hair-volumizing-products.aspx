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
</head>
 
<body class="products j2">
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Gorgeous-Hair.jpg" alt="VOLAIRE is the Volumizing Hair System that delivers full-proof results for everyday, effortless, lasting volume." class="block full" />

    <%--<div class="contentpad1">
        <p class="text-center intro">The <strong class="caps">Volaire<sup>™</sup> Hair Volumizing System</strong> is a game-changer for everyone, regardless of hair type or challenge – long, short, curly, straight, thin, fine, flat, or just plain unruly. Whether you want airy, bouncy volume or full-bodied, mega volume, <strong class="med">AirWeight Technology<sup>™</sup></strong> will make you look like you just left the salon – every day. </p>
    </div>--%>

    <p class="text-center" style="padding: .7rem 3% 1rem;">The <strong class="caps">Volaire™ Hair Volumizing System</strong> is a game-changer for everyone, regardless of hair type or challenge – long, short, curly, straight, thin, fine, flat, or just plain unruly. Whether you want airy, bouncy volume or full-bodied, mega volume, <strong>AirWeight Technology™</strong> will make you look like you just left the salon – every day.</p>

    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Shampoo-Conditioner.jpg" alt="Sulfate free shampoo (sulfate-free shampoo) that lathers and provides instant and lasting volume to your hairstyle" class="block full" style="margin: 1.3rem 0 .2rem;" />
    
    <div class="contentpad2">
        <p>A revolutionary innovation in sulfate-free shampoos that gives you the lather you love without stripping away essential moisture</p>
        <p>Unique Oxygen-infused formulas create lasting volume and natural shine without weighing down the hair</p>
        <p>Fortifying properties help strengthen hair to prevent breakage</p>
    </div>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Uplift-Mist.jpg" alt="Hair care products that give you incredible lift and continuous volume throughout the day. Tossable, touchable volume" class="block full" />
    <div class="contentpad2">
        <p>Ultra-lightweight mist locks onto roots and strands of hair to deliver super-charged lift and continuous volume </p>
        <p>Heat protectants help maintain hair health during styling</p>
        <p>Delivers touchable, tossable movement that you can run your fingers through – never stiff, tacky, or sticky</p>
    </div>

    <div style="margin: 2rem 0 1rem;">
        <a href="tv-introductory-offer"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/cta-volume-essentials.jpg" class="block full" alt="VOLAIRE Volume Essentials Collection - Get Our Best Offer!" /></a>
    </div>
    
    <%--<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/products-women-agree.png" alt="After just 1 use, 100% of womenusing VOLAIRE agreed instant lift and volume.† † As reported by women in a 21-person company sponsored study." class="block full" />--%>
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Air-Magic-Spray.jpg" alt="Best texturizing spray and hair spray for hair volume. Instantly get two times the volume over hair without VOLAIRE" class="block full" />
    <div class="contentpad2" style="z-index: 4;">
        <p>Thickens and texturizes hair, reviving limp locks with INSTANT volume</p>
        <p>Lightweight, invisible hold allows workable styling without build-up</p>
        <p>Extends your style so you can go longer between washings</p>
    </div>
    
    <div class="home6">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/coconut-avocado-kelp-algae.jpg" class="block home6_imgredients" alt="Volaire infuses Coconut, Avocado Oil, and Kelp and Algae Extracts" />
        <div class="products-ingredients text-center brown2">
            <h1><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/v.png" alt="Volaire" /></h1>
            <h3><span class="caps med">Hair Therapy</span></h3>
            <p>Formulated with a powerful infusion of <br />
                <span class="med ital">Coconut, Avocado Oil</span> and <span class="med ital">Kelp and Algae Extracts,</span> <br />
                VOLAIRE fortifies and nourishes hair promoting <br />
                healthy, fuller-looking 
                hair with softness, and shine.</p>
        </div>
        <p class="text-center pad0"><a href="tv-introductory-offer" class="caps orange unscored">&gt; Shop TV Offer</a> &nbsp; <span class="lightblue2">|</span> &nbsp; <a href="products" class="caps orange unscored">&gt; Shop All Products</a></p>
    </div>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Luke-Oconnor-1.jpg" alt="With VOLAIRE you get gorgeous, shiny,healthy-looking, bouncy hair with tons of volume that lasts all day long" class="block full"  />

    <div class="products-angie">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Angie-2.jpg" alt="Women of all ages use VOLAIRE to give them lasting volume that stays! Experience gorgeous hair again!"  />
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
