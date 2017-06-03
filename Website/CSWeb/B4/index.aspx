<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™| Hair Volumizing System </title>
<meta name="description" content="Official Volaire Website. Hair care products that add instant, weightless, touchable, long-lasting volume and texture. Read product reviews and tips" />
<meta name="keywords" content="" />
<meta name="msvalidate.01" content="2CEE1A3503885CF1CDD417B1D2047698" />
<meta name="google-site-verification" content="Bm6vS2kjurZvpEtP54CUs_xr8n6ZRmisY3aKoLaEMqQ" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<link rel="stylesheet" href="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.css" />
<script src="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.min.js"></script>
</head>
 
<body id="home">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
<section>
	<div class="home1">
    	<div class="container">
        	<div class="home1top">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-1b.jpg" alt="ready. set. Va-Va Volume! Get touchable, weightless, long-lasting volume instantly!" class="block" />
                <a href="tv-introductory-offer" class="home1link">Get TV Offer</a>
            </div>
        	<div class="home1bottom">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-1-bottom.jpg" alt="Hair Volumizing System with AirWeight Technology" class="block">
                <a href="tv-introductory-offer" class="home1bottomlink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/b2/promo-code-save-33-percent.png" alt="Save 33% - Promo Code SAVE40" class="block" /></a>
                <div class="home1bottom-benefits">
                    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="home-slider-wrap clearfix">
    <div class="slider-hdr">
        <h2>
            <span class="line1">full-proof</span>
            <span class="line2">results</span>
        </h2>
        <h3>
            <span class="line1">2X the VOLUME</span>
            <span class="line2">after one use!</span>
        </h3>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angle.png" class="slide-angle" />
    </div>
    <div class="home-slider">
        <div class="slick-slider">
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angie.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-dawn.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-kana.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-barbara.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-nancy.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-lindsay.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-abra.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-cyndi.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-taunya.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-brittney.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-mel.jpg" alt="" /></div>
        </div>
              

    </div>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
</section>

<section class="home3">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-everyday-volume-carey-grange.jpg" class="block" />
        <a href="tv-introductory-offer" class="maplink home3link">Save 33% Get Offer</a>
    </div>
</section>


<section class="home4">
    <div class="container clearfix">
        <div class="home4a">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-dyi-paparazzi-proof-volume.png" alt="DIY Paparazzi-proof volume!" class="block" />
            <div class="kristin_selfies">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/kristin-selfies.jpg" alt="DIY Paparazzi-proof volume!" class="block" />
                <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
            </div>
        </div>
        <div class="home4b">
            <h2>
                <span class="part1">STYLE</span> <span class="part2">to the fullest.</span>
            </h2>
            <h3>See how VOLAIRE<sup>™</sup> rises above the rest!</h3>
            <div class="volaire-rises">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-rises-2-glasses.jpg" alt="Volaire Rises" class="block volaire-rises-img" />
                <h2 class="hdr1">
                    Store Brand Volumizer
                    <span class="line2">Sinks</span>
                </h2>
                <h2 class="hdr2">
                    Volaire
                    <span class="line2">Rises</span>
                </h2>
                <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/sink-or-swim.mp4" class="watch_demo fancy_video">Watch Demo</a>
            </div>
            <p class="p1"><span class="brand-txt">VOLAIRE</span> uses <strong class="med">AIRWEIGHT TECHNOLOGY</strong><br />
                to infuse hair with tiny bubbles of positively charged microspheres filled with nutrient-rich ingredients that attach along each hair shaft to <strong class="med">create extra space between strands</strong> – so you get truly incredible volume – without adding any weight. </p>
        </div>
        <div class="clear">
            <div class="home4c">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/kristin-davis-just-volaire.png" alt="I just use Volaire myself, at home! No tools, no styling products, no salon visit. JUst Volaire! – Kristin Davis, Age 51 " class="block" />
            </div>
            <div class="home4d">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/survey-95-percent-volaire-more-body-and-bounce.png" alt="95% of women who used Volaire said theirhair had more body and bounce.†" class="block" />
            </div>
        </div>
    </div>
</section>


<section class="container">
    <div class="home5">
        <h2>Celebrity stylists from <strong class="brown med caps">Beverly Hills</strong> to <strong class="brown med caps">London</strong> rave about <span class="caps">Volaire!</span></h2>
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/celebrity-stylists.jpg" alt="" class="block" /></p>
    </div>
</section>




<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />

</form>
<script>
$(document).ready(function () {
    $('.slick-slider').slick({
        slidesToShow: 2.8,
        slidesToScroll: 1,
        infinite: true,
        dots: true,
        nextArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_next.png" alt="Next" class="btn_next">',
        prevArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_prev.png" alt="Previous" class="btn_prev">',        adaptiveHeight: true,
    });
});
</script>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
