<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shine-angel-brush.aspx.cs" Inherits="CSWeb.Mobile.shineangelbrush" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Richard Ward Shine Angel Brush</title>
<meta name="description" content="Richard Ward's revolutionary Shine Angel Pro Brush gives you an incredible boost of shine as you blow dry" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body class="offers-cart shine-angel-brush-page">
<form id="form1" runat="server">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-shine.jpg" alt="Style like a pro. Shine Angel Pro Styling Brush" class="block full" />

    <div class="contentpad2 clearfix" style="padding-top: 1rem;">
        <div class="fleft" style="width: 50%; margin-right: 2%;">
            <p>Dubbed by the UK press as <strong><em>HRH Kate Middleton’s "Mane Man"</em>, <span class="caps">Richard Ward</span></strong> 
            shares his tips and tricks for achieving his <strong class="orange">signature Chelsea Blow Dry</strong> 
            for that truly royal finish every girl wants.</p>
        </div>
        <div class="fleft" style="width: 48%;">
            <p><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/ShineAngelBrush.mp4" class="videolink fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/chelsea.jpg" alt="Watch Me" /></a></p>
        </div>
    </div>

    <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/shine-angel-brush-details.jpg" alt="Shine Angel Brush" class="block" /></p>

<section class="container offer-content offer-shine-angel-brush clearfix" style="position: relative;">
    <div class="clearfix">
            
        <div class="offer-cta">
            <div class="fleft" style="width: 50%;">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/price-shine-angel-brush.png" alt="One Easy Payment of $19.95* + Free Shipping" class="block" />
            </div>
            <div class="fleft size_selector" style="width: 50%; margin-top: -.3rem;">
                <h3 class="text-right">Choose Size:</h3>
                    
                <div class="select_wrap text-right clearfix">
                    <label class="size_select" for="rbMedium">
                        <asp:RadioButton runat="server" ID="rbMedium" GroupName="shineangelbursh" Checked="True"/>
                        <span class="checkbox"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/checkmark.png" alt="checked"></span>
                        <strong>MEDIUM –</strong> 2.3” barrel
                    </label>
                </div>
                <div class="select_wrap text-right clearfix">
                    <label class="size_select" for="rbSmall">
                        <asp:RadioButton runat="server" ID="rbSmall" GroupName="shineangelbursh"/>
                        <span class="checkbox"></span>
                        <strong>SMALL –</strong> 2” barrel
                    </label>
                </div>
            </div>
            <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-3" OnClick="btnAddtoCart_OnClick"/>
            <div class="text-center">
                <a href="tangle-angel-brush" class="btn_no_thanks">No, thank you.</a>
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
    
</div>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</form>
</body>
</html>
