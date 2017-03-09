<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>See Ratings and Read Reviews for Volaire™ Products</title>
<meta name="description" content="Read real reviews and customer ratings about how Volaire is the easiest, fastest way to get bouncing, weightless volume that LASTS and without a salon!" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="reviews">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-reviews">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-volaire-reviews.jpg" alt="Big Results, no teasing." class="block" />
        <h1>
            Big Results,
            <span class="line2"><span class="webfont1 ital uncaps lightblue">no teasing.</span></span>
        </h1>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
</section> 

<div class="container">
    <div class="yotpo yotpo-main-widget"
        data-product-id="120"
        data-name="Volume Essentials 30 Day Collection"
        data-url="https://www.volaire.com/tv-introductory-offer"
        data-image-url="https://d39hwjxo88pg52.cloudfront.net/volaire/images/cart-volaire-volume-essentials-collection.jpg"
        data-description="Volaire">
    </div>

</div>

    <br /><br />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
