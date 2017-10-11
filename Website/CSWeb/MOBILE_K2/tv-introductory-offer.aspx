<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tv-introductory-offer.aspx.cs" Inherits="CSWeb.Mobile.tvintroductoryoffer" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Buy Volaire™ Hair Care & Styling Products </title>
<meta name="description" content="Buy Volaire Hair Volumizing Products. Choose which Volaire Hair Care system works best for your hair." />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body class="offers-cart">
<form id="form1" runat="server">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_k2/hero-volaire-volume-essentials-vol40.jpg" alt="VOLAIRE Volume Essentials" class="block full" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>

    <div class="contentpad2" style="margin-top: .6rem; padding-bottom: 1rem;">
        <p><strong>Get gorgeous, weightless, lasting volume</strong> with our <span class="iblock">VOLUME ESSENTIALS COLLECTION.</span> Plus, enjoy the ultimate multitasker, <strong>Air Magic Texturizing Spray</strong> for <strong class="magenta">FREE</strong>. It’s like five products – texturizer, style extender, oil absorber, revitalizer, and hair spray – all in one incredible formula!</p>

        <div class="offer-links">
            <h3>Includes a 30 Day Supply of:</h3>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-60DMBG.png" alt="60 Day Money Back Guarantee" class="fright" style="width: 28.75%; margin: 1rem 0 1rem 1%;" />
            <ul>
                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                <li><a href="#pop-uplift-volumizing-mist" class="product-pop">Uplift Volumizing Mist</a></li>
                <li class="last"><strong class="magenta">FREE GIFT</strong><br />
                    <a href="#pop-air-magic" class="magenta med product-pop">Air Magic Texturizing Spray</a></li>
            </ul>
        </div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/price-offer1.png" alt="$29.95 + Free Shipping" class="block"  />
        <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-1" OnClick="btnAddtoCart_OnClick"/>
    </div>

    
<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <p>*VOLAIRE Volume Essentials Collection, 30 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE YOUR GIFT AND FREE SHIPPING! For today’s 30 Day Volume Essentials Collection, you will be charged 1 payment of $29.95, plus any applicable tax.</p>
        <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 4 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Volume Essentials Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $29.95, per installment plus $3.33 per installment for shipping and handling, plus any applicable sales tax, unless you call to cancel.  There is no commitment and no minimum to buy. Please note exact shipment times may vary. To customize future shipments and charges, <span class="iblock">call customer service anytime a 1-800-201-6539.</span></p>
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
    
</section>


</div>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
        <uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
