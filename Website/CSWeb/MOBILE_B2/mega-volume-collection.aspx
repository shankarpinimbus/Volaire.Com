<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mega-volume-collection.aspx.cs" Inherits="CSWeb.Mobile.megavolumecollection" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Get Volaire™ Mega Volume Collection</title>
<meta name="description" content="Volaire 90 Day Full Size Mega Volume Collection, Free Shipping, Free Full Size Gift" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body class="offers-cart mega-collection-page">
<form id="form1" runat="server">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-mega.jpg" alt="VOLAIRE Volume Essentials" class="block full" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>

    <div class="contentpad2" style="margin-top: .6rem; padding-bottom: 1rem;">
        <p>Upgrade now to our <span class="iblock">MEGA VOLUME COLLECTION.</span> and receive our 90 Day supply of VOLAIRE. Plus, <strong>GET&nbsp;A&nbsp;FREE <span class="orange">JUMBO SIZE GIFT</span></strong> + <strong>FREE SHIPPING</strong> on&nbsp;today's&nbsp;order!</p>

        <div class="offer-links">
            <h3>The 4-Piece, 90 Day Mega Volume<br />
                Collection Includes <span class="orange">Jumbo</span> Sizes of:
            </h3>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-30-day-money-back-guarantee.png" alt="30 Day Money Back Guarantee" class="fright" style="width: 28.75%; margin: 1rem 0 1rem 1%;" />
            <ul>
                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo</a></li>
                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner</a></li>
                <li><a href="#pop-uplift-volumizing-mist" class="product-pop">Uplift Volumizing Mist</a></li>
                <li class="last"><strong><span class="magenta">INSTANT UPGRADE TO A</span> <span class="orange">JUMBO SIZE GIFT</span></strong><br />
                    <a href="#pop-air-magic" class="magenta med product-pop">Air Magic Texturizing Spray</a></li>
            </ul>
            
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_b2/price-offer2.png" alt="Just 3 Payments of $39.95 + Free Shipping" class="block" style="margin-top: .5rem; width: 98%;" />
            <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-2" OnClick="btnAddtoCart_OnClick"/>
            <div class="text-center">
                <a href="shine-angel-brush" class="btn_no_thanks">No, thank you</a>
            </div>
        </div>
    </div>

<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <p>*VOLAIRE Mega Volume Collection, 90 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE A FREE FULL-SIZE BONUS GIFT, AND FREE SHIPPING! For today’s Mega Volume Collection, 90 Day Supply, you will be charged 1 payment of $39.95, plus any applicable tax, plus two additional monthly payments of $39.95.</p>
        <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 12 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Mega Volume Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $39.95, per installment plus $3.33 per installment for shipping and handling, plus any applicable sales tax, unless you call to cancel. There is no commitment and no minimum to buy. Please note exact shipment times may vary.  </p>
        <p>To customize future shipments and charges, call customer service anytime at 1-800-201-6539.</p>
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
    
</section>

</div>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
</body>
</html>
