<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tv-introductory-offer.aspx.cs" Inherits="CSWeb.Desktop.tvintroductoryoffer" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Buy Volaire™ Hair Volumizing System</title>
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
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-banner-30-day-kit-vol40.png" alt="Limited Time - Get free shipping & instant savings! Save 40% with Promo Code SAVE40" class="block" />
        	</div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-v.png" alt="Volaire" class="block nav-v" />
        </div>
    </section>
</header>

<section class="hero hero-30-day-kit">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/e2/hero-choose-kit.png" alt="Volaire Hair Volumizing System" class="block" />
        <%--<h1>
            TV Offer
            <span class="line2"><span class="webfont1 ital uncaps orange">introductory kit.</span></span>
        </h1>--%>
    </div>
</section>
    


<section class="container offer-content offer-30-day-kit clearfix">
    <h1 class="offer-hdr-top caps">Select the Volumizing System <span class="webfont1 orange normal uncaps"><em>that's right for YOU!</em></span></h1>
    <div class="container3 clearfix order_kits_wrap">
            <div class="order-page-1-col-1 kit_box kit_box_mega kb_active ">
                <div class="">
                    <div class="orderhdr">
                        <span class="order_checkbox"></span>
                        <h2><span class="caps">Incredible Volume</span> <span class="em1 color1 color2">Collection</span></h2>
                    </div>
                    <a href="#" class="prodlink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/e2/selector-incredible.jpg" class="full block" alt="Volaire Incredible Volume Hair Volumizing System" /></a>
                    <div class="benefitsbar"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%></div>
                    <div class="order_bottom_txt">
                        <p class="p1">This customer favorite includes the ultimate multitasker, <strong>Air Magic Texturizing Spray</strong> - it’s like five products – texturizer, style extender, oil absorber, revitalizer, and hair spray – all in one incredible formula!</p>
                        <div class="offer-links">
                            <h3 class="caps">Includes a 30 Day Supply of:</h3>
                            <ul>
                                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                                <li><a href="#pop-air-magic" class="product-pop">Air Magic Texturizing Spray</a></li>
                                <li class="last"><strong><span class="magenta">FREE GIFT</span></strong><br />
                                    <a href="#pop-uplift-volumizing-mist" class="magenta med product-pop">Uplift Volumizing Mist</a></li>
                            </ul>
                        </div>
                    </div>
                    <p class="orderbtn"><asp:Button runat="server" id="btnAddtoCart2" CssClass="btn_ordernow btn_ordernow-1" CommandArgument="132" OnClick="btnAddtoCartE2_OnClick"/></p>
                </div>
            </div>


            <div class="order-page-1-col-2 kit_box kit_box_essentials ">
                <div class="orderhdr">
                        <span class="order_checkbox"></span>
                        <h2><span class="caps">Volume Essentials</span> <span class="em1 color1">Collection</span></h2>
                    </div>
                <div class="">
                    <a href="#" class="prodlink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/e2/selector-essentials.jpg" class="full block" alt="Volaire Volume Essentials Hair Volumizing System" /></a>
                    <div class="benefitsbar"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%></div>
                    <div class="order_bottom_txt">
                        <p class="p1"><strong>Get gorgeous, weightless, lasting volume</strong> with this comprehensive system.</p>
                        <div class="offer-links">
                            <h3 class="caps">Includes a 30 Day Supply of:</h3>
                            <ul>
                                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                                <li class="last"><strong class="magenta">FREE GIFT</strong><br />
                                    <a href="#pop-uplift-volumizing-mist" class="magenta med product-pop">Uplift Volumizing Mist</a></li>
                            </ul>
                        </div>
                    </div>
                    <p class="orderbtn"><asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-1" CommandArgument="133" OnClick="btnAddtoCartE2_OnClick"/></p>
                </div>
                
            </div></div>
                
                
                

</section>
    

<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <div id="kit_mega_legal" class="footnotes">
            <p>*VOLAIRE Incredible Volume Collection, 30 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE YOUR GIFT AND FREE SHIPPING! For today’s 30 Day Incredible Volume Collection, you will be charged 1 payment of $39.95, plus any applicable tax.</p>
            <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 4 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Incredible Volume  Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $39.95, per installment plus $3.33 per installment for shipping and handling, and any applicable sales tax, unless you call to cancel. There is no commitment and no minimum to buy. Please note exact shipment times may vary. To customize future shipments and charges, <span class="iblock">call customer service anytime a 1-800-201-6539.</span></p>
        </div>
        <div id="kit_essentials_legal" class="footnotes" style="display: none;">
            <p>*VOLAIRE Volume Essentials Collection, 30 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE YOUR GIFT AND FREE SHIPPING! For today’s 30 Day Volume Essentials Collection, you will be charged 1 payment of $29.95, plus any applicable tax.</p>
            <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 4 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Volume Essentials Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $29.95, per installment plus $3.33 per installment for shipping and handling, plus any applicable sales tax, unless you call to cancel. There is no commitment and no minimum to buy. Please note exact shipment times may vary. To customize future shipments and charges, <span class="iblock">call customer service anytime a 1-800-201-6539.</span></p>
        </div>
        
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
    
</section>



<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
