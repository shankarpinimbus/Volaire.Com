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
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<link rel="stylesheet" href="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.css" />
<script src="//d39hwjxo88pg52.cloudfront.net/scripts/slick/slick.min.js"></script>
</head>
 
<body>
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
<section>
	<div class="home1">
    	<div class="container">
        	<div class="home1top">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-1b.jpg" alt="ready. set. Va-Va Volume! Get touchable, weightless, long-lasting volume instantly!" class="block" />
                <a href="tv-introductory-offer" class="maplink home1link">Get TV Offer</a>
            </div>
        	<div class="home1bottom">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-1-bottom.jpg" alt="Hair Volumizing System with AirWeight Technology" class="block">
                <a href="tv-introductory-offer" class="home1bottomlink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/promo-code-save-40-percent.png" alt="Save 40% - Promo Code SAVE40" class="block" /></a>
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
    </div>
    <div class="home-slider">
        <div class="slick-slider">
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angie.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angie.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
        </div>
              

    </div>
    <p class="note">*Individual results may vary.</p>
</section>



    
<uc:Footer ID="Footer" runat="server" />

</form>
<script>
$(document).ready(function () {
    $('.slick-slider').slick({
        slidesToShow: 3,
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
