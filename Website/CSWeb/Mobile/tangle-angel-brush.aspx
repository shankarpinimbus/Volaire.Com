<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tangle-angel-brush.aspx.cs" Inherits="CSWeb.Mobile.tangleangelbrush" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Richard Ward Tangle Angel Brush</title>
<meta name="description" content="Richard Ward's Tangle Angel detangling brush. Perfect for detangling wet or dry hair and it's perfect for all hair types including children’s hair" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
<body class="offers-cart tangle-angel-brush-page">
<form id="form1" runat="server">
<div class="container">
<uc:Header ID="Header" runat="server" />

    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-tangle.jpg" alt="Detangle those strands. Tangle Angel Brush" class="block" />

    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/tangle-main.jpg" alt="Richard Ward's Tangle Angel Brush" class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/TangleAngelBrush.mp4" class="fancy_video maplink tanglevideolink"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/vid-tangle-angel-brush.jpg" alt="Watch Me" /></a>
    </div>
    
    <div class="contentpad2">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/price-tangle-angel-brush.png" alt="One Easy Payment of $9.95 + Free Shipping!" class="block" />
        <asp:Button runat="server" id="btnAddtoCart" CssClass="btn_ordernow btn_ordernow-4" OnClick="btnAddtoCart_OnClick"/>
        <div class="text-center">
            <a href="cart" class="btn_no_thanks">No, thank you.</a>
        </div>
    </div>


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
