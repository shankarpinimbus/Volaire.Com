<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mega-volume-collection.aspx.cs" Inherits="CSWeb.Desktop.megavolumecollection" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Get Volaire™ Mega Volume Collection</title>
<meta name="description" content="Volaire 90 Day Full Size Mega Volume Collection, Free Shipping, Free Full Size Gift" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body id="kit_90day">
<form id="form1" runat="server">

<header>
    <section>
    	<div class="container clearfix">
        	<div class="nav-logo"><h1><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-logo.png" alt="Volaire" class="block" /></h1></div>
        	<div class="nav-offer-promo">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-banner-90-day-kit.png" alt="Do Not Miss This Amazing Offer!" class="block" />
        	</div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-v.png" alt="Volaire" class="block nav-v" />
        </div>
    </section>
</header>

<section class="hero hero-90-day-kit gradient">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-90daykit.png" alt="Volaire Mega Volumizing System" class="block" />
        <h1>
            Upgrade, 
            <span class="part2"><span class="webfont1 ital uncaps lightblue">go big!</span></span>
        </h1>
    </div>
</section>

<section class="container offer-content offer-30-day-kit clearfix">
    <div class="offer-left">
        <h2>Mega Volume <span class="part2 ital brown2 uncaps">Collection</span></h2>
        <p>Upgrade now to our <span class="iblock">MEGA VOLUME COLLECTION.</span> and receive our 90 Day supply of VOLAIRE. Plus, <strong>GET A FREE <span class="orange">JUMBO SIZE GIFT</span></strong> + <strong>FREE SHIPPING</strong> on today's order!</p>
        <div class="offer-links">
            <h3>The 4-Piece, 90 Day Mega Volume<br />
                Collection Includes <span class="orange">Jumbo</span> Sizes of:
            </h3>
            <ul>
                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                <li><a href="#pop-air-magic" class="product-pop">Air Magic Texturizing Spray</a></li>
                <li class="last"><strong><span class="magenta">INSTANT UPGRADE TO A JUMBO SIZE GIFT</span></strong><br />
                    <a href="#pop-uplift-volumizing-mist" class="magenta med product-pop">Uplift Volumizing Mist</a></li>
            </ul>
        </div>
        
    </div>
    <div class="offer-right">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/e2/offer-90-day-kit-200more.png" alt="Volaire 30 Day Kit" class="offer-90-day-kit-img" />
        <div class="offer-benefits">
            <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
        </div>
        <div class="clearfix">
            
            <div class="offer-cta">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/b2/price-90-day-kit.png" alt="Just 3 Payments of $29.95* + Free Shipping" class="block" />
                <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-2" OnClick="btnAddtoCart_OnClick"/>
                <div class="text-center">
                    <a href="shine-angel-brush" class="btn_no_thanks">No, thank you.</a>
                </div>
            </div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-30-day-money-back-guarantee.png" alt="30 Day Money Back Guarantee" class="iblock offer-mbg" style="margin-top: 2rem; margin-left: 1%;" />
        </div>
    </div>
</section>
    

<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <p>*VOLAIRE Mega Volume Collection, 90 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE A FREE FULL-SIZE BONUS GIFT, AND FREE SHIPPING! For today’s Mega Volume Collection, 90 Day Supply, you will be charged 1 payment of $29.95, plus any applicable tax, plus two additional monthly payments of $29.95.</p>
        <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 12 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Mega Volume Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $29.95, per installment plus $3.33 per installment for shipping and handling, plus any applicable sales tax, unless you call to cancel. There is no commitment and no minimum to buy. Please note exact shipment times may vary.  </p>
        <p>To customize future shipments and charges, call customer service anytime at 1-800-201-6539.</p>
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
    
</section>



<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
    <uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
