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
<body class="offers-cart mega-collection-page i2 tv-offer-upsells">
<form id="form1" runat="server">
<div class="container">
    <section class="steps_hdr  gradient">
        <div class="container clearfix">
            <div class="steps_hdr_step step_a step_on step_on_1">
                <strong class="steptxt">STEP 1</strong> Upgrade Your Kit
            </div>
            <div class="steps_hdr_step step_b step_off step_off_1">
                <strong class="steptxt">STEP 2</strong> Add Ons
            </div>
            <div class="steps_hdr_step step_c step_off step_off_1">
                <strong class="steptxt">STEP 3</strong> Check Out
            </div>
            <div class="steps_hdr_step step_d step_off step_off_1b">
                <strong class="steptxt">STEP 4</strong> Confirmation
            </div>
        </div>
    </section>
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_i2/hero-mega.jpg" alt="VOLAIRE Mega Volumizing System" class="block full" />
    

    <div class="contentpad2" style="margin-top: .6rem; padding-bottom: 1rem;">
        <p class="p1 text-center">Save yourself some time (and <span style="border-bottom: #222 solid 1px;">money</span>!) and upgrade to the <strong class="iblock">Mega Volume Collection &ndash;</strong> the same 4 great products in our&nbsp;JUMBO sizes. This way you’ll be saving more, have  <strong class="iblock">3 easy payments of $29.95,</strong> and be  <strong>covered for 90 days.</strong></p>

        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>

        <div class="offer-links" style="margin-top: .7rem;">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_i2/price-offer2.png" alt="Just 3 Payments of $29.95 + Free Shipping" class="iblock vmid" style="width: 70%;" />
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-60DMBG.png" alt="60 Day Money Back Guarantee" class="iblock vmid" style="width: 28.7%;" />
            <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-2" OnClick="btnAddtoCart_OnClick"/>
            <div class="text-center">
                <a href="shine-angel-brush" class="btn_no_thanks caps">No, thank you.</a>
            </div>

            <h2 class="tvoffer-upsells-hdr">Mega Volume <span class="part2 ital brown2 uncaps webfont2 normal">Collection</span></h2>
            
            <h3>The 4-Piece, 90 Day Collection Includes:
            </h3>
            
            <ul>
                <li><a href="#pop-weightless-volumizing-shampoo" class="product-pop">Weightless Volumizing Shampoo - Jumbo Size</a></li>
                <li><a href="#pop-weightless-fortifying-conditioner" class="product-pop">Weightless Fortifying Conditioner - Jumbo Size</a></li>
                <li><a href="#pop-uplift-volumizing-mist" class="product-pop">Uplift Volumizing Mist - Jumbo Size</a></li>
                <li class="last"><a href="#pop-air-magic" class="magenta bold product-pop">FREE Air Magic Texturizing Spray - Jumbo Size</a></li>
            </ul>
            
            
        </div>
    </div>

<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <p>*VOLAIRE Mega Volume Collection, 90 Day Supply. WITH YOUR ORDER TODAY, YOU’LL RECEIVE A FREE FULL-SIZE BONUS GIFT, AND FREE SHIPPING! For today’s Mega Volume Collection, 90 Day Supply, you will be charged 1 payment of $29.95, plus any applicable tax, plus two additional monthly payments of $29.95.</p>
        <p>This offer includes enrollment in the VOLAIRE MVP Subscription Program. Approximately 12 weeks after your first order is shipped, and then approximately every 12 weeks thereafter, you will be sent a new 90 Day supply of the Mega Volume Collection. Each shipment will be charged to the card you provide today, in three installments, approximately every 4 weeks at the guaranteed low price of $29.95, per installment plus $3.33 per installment for shipping and handling, plus any applicable sales tax, unless you call to cancel. There is no commitment and no minimum to buy. Please note exact shipment times may vary.  To customize future shipments and charges, call customer service anytime at 1-800-201-6539.</p>
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
    

</section>

</div>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
</body>
</html>
