<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shine-angel-brush.aspx.cs" Inherits="CSWeb.Desktop.shineangelbrush" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Richard Ward Shine Angel Brush</title>
<meta name="description" content="Richard Ward's revolutionary Shine Angel Pro Brush gives you an incredible boost of shine as you blow dry" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body id="shine_angel_brush">
<form id="form1" runat="server">

<header>
    <section class="steps_hdr  gradient">
        <div class="container clearfix">
            <div class="steps_hdr_step step_on step_on_1b">
                <a href="mega-volume-collection"><strong>STEP 1</strong> <span class="steps_spacer">></span> Upgrade Your Kit</a>
            </div>
            <div class="steps_hdr_step step_on step_on_1">
                <strong>STEP 2</strong> <span class="steps_spacer">></span> Add Ons
            </div>
            <div class="steps_hdr_step step_off step_off_1">
                <strong>STEP 3</strong> <span class="steps_spacer">></span> Check Out
            </div>
            <div class="steps_hdr_step step_off step_off_1b">
                <strong>STEP 4</strong> <span class="steps_spacer">></span> Confirmation
            </div>
        </div>
    </section>
    <section class="hdr_shadow bgwhite">
    	<div class="container clearfix">
        	<div class="nav-logo"><h1><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-logo.png" alt="Volaire" class="block" /></h1></div>
        	<div class="nav-offer-promo">
                <%--<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-banner-shine-angel-brush.png" alt="Make Your Results Shine Today!" class="block" />--%>
                &nbsp;
        	</div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/volaire-v.png" alt="Volaire" class="block nav-v" />
        </div>
    </section>
</header>

<section class="hero hero-shine-angel-brush gradient">
    <div class="hero-shine-angel-brush-inner">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-shine-angel-brush.png" alt="Volaire Mega Volumizing System" class="block" />
            <h1>
                Style Like <span class="part2"><span class="webfont1 ital uncaps lightblue">a pro.</span></span>
                <span class="line2">Illuminate your locks with Richard Ward's</span>
                <span class="line3 lightblue">Shine Angel Pro Styling Brush</span>
            </h1>
            <h2>Richard Ward <span class="part2">celebrity & royal Stylist</span></h2>
        </div>
    </div>
    
</section>

<section class="container offer-content offer-shine-angel-brush clearfix" style="position: relative;">
    <div class="offer-left">
        <p>Dubbed by the UK press as <strong><em>HRH Kate Middleton’s "Mane Man"</em>, <span class="caps">Richard Ward</span></strong><br />
            shares his tips and tricks for achieving his <strong class="orange">signature Chelsea Blow Dry</strong><br />
            for that truly royal finish every girl wants.</p>
        <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/shine-angel-brush-details.jpg" alt="Shine Angel Brush" class="block" /></p>
    </div>
    <div class="offer-right">
        <div class="clearfix">
            <p><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/ShineAngelBrush.mp4" class="videolink fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/vid-shine-angel-brush.jpg" alt="Watch Me" /></a></p>
            <div class="offer-cta">
                <div class="fleft" style="width: 50%;">
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/price-shine-angel-brush.png" alt="One Easy Payment of $19.95* + Free Shipping" class="block" />
                </div>
                <div class="fleft size_selector" style="width: 50%;">
                    <h3>Choose Size:</h3>
                    
                    <div class="select_wrap clearfix">
                        <label class="size_select" for="rbMedium">
                            <asp:RadioButton runat="server" ID="rbMedium" GroupName="shineangelbursh" Checked="True"/>
                            <span class="checkbox"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/checkmark.png" alt="checked"></span>
                            <strong>Medium –</strong> 2.3” barrel
                        </label>
                    </div>
                    <div class="select_wrap clearfix">
                        <label class="size_select" for="rbSmall">
                            <asp:RadioButton runat="server" ID="rbSmall" GroupName="shineangelbursh"/>
                            <span class="checkbox"></span>
                            <strong>Small –</strong> 2” barrel
                        </label>
                    </div>
                </div>
                <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-3" OnClick="btnAddtoCart_OnClick"/>
                <div class="text-center">
                    <a href="tangle-angel-brush" class="btn_no_thanks">No, thank you.</a>
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
