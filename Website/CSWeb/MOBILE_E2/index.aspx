<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
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
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <div>
        <a href="tv-introductory-offer"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_e2/Kristin-Davis-1.jpg" alt="Kristin Davis uses VOLAIRE "at home, herself" to achieve effortless volume that lasts all day. Get gorgeous hair today!" class="block full" /></a>
        <%--<a href="tv-introductory-offer" class="maplink homelink1">Get TV Offer!</a>--%>
    </div>
    <%--<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home2.png" alt="AirWeight Technology&trade; Hair Volumizing System" class="block" />--%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home3.png" alt="full-proof RESULTS" class="block full" />

    <section class="home-slider-wrap clearfix">
        <div class="home-slider">
            <div class="slick-slider">
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Angie-1.jpg" alt="See amazing before and after photos of real VOLAIRE users to see their instant and lasting volume after one use!" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi-back.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Dawn-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Kana-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Barbara-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Nancy-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Lindsay-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Abra-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Cyndi-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Taunya-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Brittney-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Mell-1.jpg" alt="" /></div>
                <div><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
            </div>
        </div>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </section>


    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_e2/home4.jpg" alt="Get Everyday, effortless volume - no stylist needed." class="block full" />
        <a href="tv-introductory-offer" class="maplink homelink4">Save 40% - Get Offer!</a>
    </div>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_i2/Richard-Ward-Volume1.jpg" alt="Top hairstylists use VOLAIRE to give their clients lasting and effortless volume. Have salon quality hair everyday." class="block full" />
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_k2/kristin-davis-diy.jpg" alt="My hair was thin and super-damaged. Then I found VOLAIRE. Now my hair is soft and full!" class="block full" />

    <div class="home6">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home6.png" alt="STYLE to the fullest. See how VOLAIRE™ rises above the rest!" class="block full" />

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Sink-Swim.jpg" alt="VOLAIRE AirWeight Technology at work. Light, lathering volumizing shampoo that does not weigh the hair down" class="block full" />
        <p class="text-center"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/sink-or-swim.mp4" class="watch_demo fancy_video">Watch Demo</a></p>

        <%--<p class="p1"><span class="brand-txt">VOLAIRE</span> uses <strong class="med">AIRWEIGHT TECHNOLOGY</strong><br />
            to infuse hair with tiny bubbles of positively charged microspheres filled with nutrient-rich ingredients that attach along each hair shaft to <strong class="med">create extra space between strands</strong> – so you get truly incredible volume – without adding any weight. </p>--%>
    </div>
    
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Body-Bounce.png" alt="VOLAIRE works for all hair types - long, short, curly, straight, flat, fine, thinning, color treated, or chemically-treated." class="block full" />
    


    <%--<div class="home8">
        <h2>Celebrity stylists from <strong class="brown med caps">Beverly Hills</strong> to <strong class="brown med caps">London</strong> rave about <span class="caps">Volaire!</span></h2>
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/celebrity-stylists.jpg" alt="" class="block full" /></p>
    </div>--%>


    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>
<script>
    $(document).ready(function () {
        $('.slick-slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            dots: true,
            nextArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_next.png" alt="Next" class="btn_next">',
            prevArrow: '<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_prev.png" alt="Previous" class="btn_prev">',            adaptiveHeight: true,

        });
    });
</script>
<% if(CSBusiness.DynamicVersion.VersionManager.LandingVersion.ToLower().Contains("d2")) { %>
   <uc:EmailPopUp ID="EmailPopUp" runat="server" />
<% } %>
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
