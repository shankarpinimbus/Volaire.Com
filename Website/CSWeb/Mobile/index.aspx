<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>

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
<div class="container">
<uc:Header ID="Header" runat="server" />

    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home1.jpg" alt="ready. set. VA-VA VOLUME! Get touchable, weightless, long-lasting volume instantly!" class="block" />
        <a href="tv-introductory-offer" class="maplink homelink1">Get TV Offer!</a>
    </div>
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home2.png" alt="AirWeight Technology&trade; Hair Volumizing System" class="block" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home3.png" alt="full-proof RESULTS" class="block" />

    <section class="home-slider-wrap clearfix">
        <div class="home-slider">
            <div class="slick-slider">
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angie.jpg" alt="" /></div>
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-angie.jpg" alt="" /></div>
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-yvette.jpg" alt="" /></div>
                <div>
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/slide-cyndi.jpg" alt="" /></div>
            </div>
        </div>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </section>


    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home4.jpg" alt="Get Everyday, effortless volume - no stylist needed." class="block" />
        <a href="tv-introductory-offer" class="maplink homelink4">Save 40% - Get Offer!</a>
    </div>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home5.jpg" alt="TIP: VOLAIRE's Shampoo and Conditioner Give All Types the Foundation for Mega Volume" class="block" />

    <div class="home6">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home6.png" alt="STYLE to the fullest. See how VOLAIRE™ rises above the rest!" class="block" />

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home6b.jpg" alt="VOLAIRE Rises" class="block" />
        <p class="text-center"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/sink-or-swim.mp4" class="watch_demo fancy_video">Watch Demo</a></p>

        <p class="p1"><span class="brand-txt">VOLAIRE</span> uses <strong class="med">AIRWEIGHT TECHNOLOGY</strong><br />
            to infuse hair with tiny bubbles of positively charged microspheres filled with nutrient-rich ingredients that attach along each hair shaft to <strong class="med">create extra space between strands</strong> – so you get truly incredible volume – without adding any weight. </p>
    </div>
    
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/home7.png" alt="95% of Women who used VOLAIRE said theirhair had more body and bounce.†  †As reported by women in a 21-person company sponsored study." class="block" />
    


    <div class="home8">
        <h2>Celebrity stylists from <strong class="brown med caps">Beverly Hills</strong> to <strong class="brown med caps">London</strong> rave about <span class="caps">Volaire!</span></h2>
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/celebrity-stylists.jpg" alt="" class="block" /></p>
    </div>


    
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
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
