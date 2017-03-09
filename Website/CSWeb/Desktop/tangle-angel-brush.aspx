<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tangle-angel-brush.aspx.cs" Inherits="CSWeb.Desktop.tangleangelbrush" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Richard Ward Tangle Angel Brush</title>
<meta name="description" content="Richard Ward's Tangle Angel detangling brush. Perfect for detangling wet or dry hair and it's perfect for all hair types including  children’s hair" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body id="tangle_angel_brush">
<form id="form1" runat="server">


<header>
    <section>
    	<div class="container clearfix">
        	<div class="nav-logo"><h1><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-logo.png" alt="Volaire" class="block" /></h1></div>
        	<div class="nav-offer-promo">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-banner-tangle-angel-brush.png" alt="Make Your Results Shine Today!" class="block" />
        	</div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-v.png" alt="Volaire" class="block nav-v" />
        </div>
    </section>
</header>

<section class="hero hero-tangle-angel-brush gradient">
    <div class="hero-tangle-angel-brush-inner">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-tangle-angel-brush.png" alt="Volaire Mega Volumizing System" class="block" />
            <h1>
                Detangle <span class="part2"><span class="webfont1 ital uncaps normal lightblue">those strands.</span></span>
                <span class="line2">Effortlessly detangle with</span>
                <span class="line3">this hair-styling must-have!</span>
            </h1>
            <h2>Richard Ward <span class="part2">celebrity & royal Stylist</span></h2>
        </div>
    </div>
    
</section>

<section class="container offer-content offer-tangle-angel-brush clearfix" style="position: relative;">
    <div class="offer-left">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tangle-angel-brush-details-txt.png" alt="Tangle Angel Brush" class="tangle-angel-brush-details" />
        
    </div>
    <div class="offer-right">
        <div class="clearfix">
            <p><a href="#video" class="videolink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/vid-tangle-angel-brush.jpg" alt="Watch Me" /></a></p>
            <div class="offer-cta">
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/price-tangle-angel-brush.png" alt="One Easy Payment of $9.95* + Free Shipping" class="block" />
                <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-4" OnClick="btnAddtoCart_OnClick"/>
                <div class="text-center">
                    <a href="cart" class="btn_no_thanks">No, thank you.</a>
                </div>
            </div>
        </div>
    </div>
</section>
    

<section class="container offer-footer">
    <div class="offer-footer-content">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="" class="iblock" /></p>
        <p class="footer-copyright">© <script>document.write(new Date().getFullYear())</script> VOLAIRE™. All Rights Reserved.</p>
    </div>
</section>






<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
