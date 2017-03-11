<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>See Ratings and Read Reviews for Volaire™ Products</title>
<meta name="description" content="Read real reviews and customer ratings about how Volaire is the easiest, fastest way to get bouncing, weightless volume that LASTS and without a salon!" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <div class="hero-reviews">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-reviews.jpg" alt="Thicker, Fuller Looking Hair with AirWeight™ Technology " class="block" />
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
    
    <div class="contentpad2">
        <div class="yotpo yotpo-main-widget"
            data-product-id="120"
            data-name="Volume Essentials 30 Day Collection"
            data-url="https://www.volaire.com/tv-introductory-offer"
            data-image-url="https://d39hwjxo88pg52.cloudfront.net/volaire/images/cart-volaire-volume-essentials-collection.jpg"
            data-description="Volaire">
        </div>
    </div>
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
