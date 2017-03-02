<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tv-introductory-offer.aspx.cs" Inherits="CSWeb.Desktop.tvintroductoryoffer" EnableSessionState="True" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™| Hair Volumizing System </title>
<meta name="description" content="Official Volaire Website. Hair care products that add instant, weightless, touchable, long-lasting volume and texture. Read product reviews and tips" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body id="kit_30day">
<form id="form1" runat="server">

<header>
    <section>
    	<div class="container clearfix">
        	<div class="nav-logo"><h1><a href="index"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-logo.png" alt="Volaire" class="block" /></a></h1></div>
        	<div class="nav-offer-promo">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-banner-30-day-kit.png" alt="Limited Time - Get free shipping & instant savings! Save 40% with Promo Code SAVE40" class="block" />
        	</div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-v.png" alt="Volaire" class="block nav-v" />
        </div>
    </section>
</header>

<section class="hero hero-30-day-kit">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-30daykit.png" alt="Volaire" class="block" />
        <h1>
            TV Offer
            <span class="line2"><span class="webfont1 ital uncaps orange">introductory kit.</span></span>
        </h1>
    </div>
</section>

<section class="container offer-content offer-30-day-kit clearfix">
    <div class="offer-left">
        <h2>Volume Essentials <span class="part2 ital brown2 uncaps">Collection</span></h2>
        <p><strong>Get gorgeous, weightless, lasting volume</strong> with our <span class="iblock">VOLUME ESSENTIALS COLLECTION.</span> Plus, enjoy the ultimate multitasker, <strong>Air Magic Texturizing Spray</strong> for <strong class="magenta">FREE</strong>. It’s like five products – texturizer, style extender, oil absorber, revitalizer, and hair spray – all in one incredible formula!</p>
        <div class="clearfix">
            <div class="offer-links">
                <h3>Includes a 30 Day Supply of:</h3>
                <ul>
                    <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                    <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                    <li><a href="#pop-uplift-volumizing-mist" class="product-pop">Uplift Volumizing Mist</a></li>
                    <li class="last"><strong class="magenta">FREE GIFT</strong><br />
                        <a href="#pop-air-magic" class="magenta med product-pop">Air Magic Texturizing Spray</a></li>
                </ul>
            </div>
            <div class="offer-cta">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/price-30-day-kit.png" alt="$29.95 + Free Shipping" class="block" />
                <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow" OnClick="btnAddtoCart_OnClick"/>
            </div>
        </div>
        
    </div>
    <div class="offer-right">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/offer-30-day-kit.png" alt="Volaire 30 Day Kit" class="offer-30-day-kit-img" />
        <div class="offer-benefits">
            <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
        </div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-30-day-money-back-guarantee.png" alt="30 Day Money Back Guarantee" class="iblock" style="max-width: 105px;" />
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/promo-code-save-40-percent-big.png" alt="Save 40% - Promo Code SAVE40" class="fright" style="margin-top: .8rem;" />
    </div>
</section>
    




</form>
</body>
</html>
