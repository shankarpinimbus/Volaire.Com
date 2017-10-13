<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/EmailPopup.ascx" TagName="EmailPopUp" TagPrefix="uc" %>

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
<form runat="server" id="fm_home">
<uc:Header ID="Header" runat="server" />
<section>
	<div class="home1">
    	<div class="container">
        	<div class="home1top">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Kristin-Davis-1.jpg" alt="Kristin Davis uses VOLAIRE 'at home, herself' to achieve effortless volume that lasts all day. Get gorgeous hair today!" class="block" />
                <a href="tv-introductory-offer" class="home1link">Get TV Offer</a>
            </div>
        	<div class="home1bottom">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/home-1-bottom.jpg" alt="Hair Volumizing System with AirWeight Technology" class="block">
                <a href="tv-introductory-offer" class="home1bottomlink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/e2/promo-code-vol40.png" alt="Save 40% off of VOLAIRE hair care volumizing system when you order online or call. Best deal for getting gorgeous hair." class="block" /></a>
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
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Angie-1.jpg" alt="See amazing before and after photos of real VOLAIRE users to see their instant and lasting volume after one use!" /></div>
            <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi-back.jpg" alt="" /></div>
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
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Richard-Ward-Volume.jpg" class="block" alt="Top hairstylists use VOLAIRE to give their clients lasting and effortless volume. Have salon quality hair everyday." />
        <a href="tv-introductory-offer" class="maplink home3link">Save 40% Get Offer</a>
    </div>
</section>


<section class="home4">
    <div class="container clearfix">
        <div class="home4a">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/DIY-Volume.png" alt="VOLAIRE volumizing hair care products give instant lift and weightless volume to your hair that lasts all day long." class="block" />
            <div class="kristin_selfies">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Kristin-Davis-Selfies.jpg" alt="See Kristin Davis's amazing before and after selfies after using VOLAIRE. Beautiful hair with volume is easier than ever!" class="block" />
                <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
            </div>
        </div>
        <div class="home4b home4b-j2">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/coconut-avocado-kelp-algae.jpg" class="block" alt="Volaire infuses Coconut, Avocado Oil, and Kelp and Algae Extracts" />
            <div class="products-ingredients text-center brown2">
                <h1><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/v.png" alt="Volaire" /></h1>
                <h3><span class="caps med">Hair Therapy</span></h3>
                <p>Formulated with a powerful infusion <br />
                    of <span class="med ital">Coconut, Avocado Oil</span> and <br />
                    <span class="med ital">Kelp and Algae Extracts,</span> <br />
                    VOLAIRE fortifies and nourishes <br />
                    hair promoting healthy, fuller-looking <br />
                    hair with softness, and shine.</p>
            </div>
        </div>
        <div class="clear">
            <div class="home4c">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/i2/Kristin-Davis-Quote-3.png" alt="My hair was thin and super-damaged. Then I found VOLAIRE. Now my hair is soft and full!" class="block" />
            </div>
            <div class="home4d">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Body-Bounce.png" alt="VOLAIRE works for all hair types - long, short, curly, straight, flat, fine, thinning, color treated, or chemically-treated." class="block" />
            </div>
        </div>
    </div>
</section>


<section class="container">
    <div class="home5">
        <h2>Celebrity stylists from <strong class="brown med caps">Beverly Hills</strong> to <strong class="brown med caps">London</strong> rave about <span class="caps">Volaire!</span></h2>
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Celebrity-Stylists.jpg" alt="Top hairdressers and best stylists use VOLAIRE to get salon quality hair. Get amazing volume instantly and easily." class="block" /></p>
    </div>
</section>




<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
   <uc:EmailPopUp ID="EmailPopUp" runat="server" />
</form>
<script>
$(document).ready(function () {
    $('.slick-slider').slick({
        slidesToShow: 2.8,
        slidesToScroll: 1,
        infinite: true,
        dots: true,
        nextArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_next.png" alt="Next" class="btn_next">',
        prevArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_prev.png" alt="Previous" class="btn_prev">',
        adaptiveHeight: true,

    });
});
</script>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
