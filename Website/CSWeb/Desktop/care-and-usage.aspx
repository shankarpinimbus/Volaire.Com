<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ Care and Usage</title>
<meta name="description" content="Care and usage directions for Volaire hair care products." />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="tech">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-care-usage gradient">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Care-Usage.png" alt="Use the shampoo, conditioner, mist/heat protectant & hair spray for best body and volume from your own home!" class="block" />
        <h1>Care & Usage</h1>
        <div class="care_info care-1">
            <h2>Weightless Volumizing Shampoo</h2>
            <p><em>directions:</em> Dispense a large dollop of shampoo into palm and activate lather by rubbing hands together. Massage lather into wet hair, from roots to ends. Rinse thoroughly. Repeat as needed.</p>
        </div>
        <div class="care_info care-2">
            <h2>Weightless Fortifying Conditioner</h2>
            <p><em>directions:</em> After shampooing, apply a quarter size amount to wet hair, starting from the bottom half of the hair and working down to the tips, distributing the product evenly. Rinse thoroughly with cool water.</p>
        </div>
        <div class="care_info care-3">
            <h2>Uplift Volumizing Mist</h2>
            <p><em>directions:</em> After showering, on combed, towel-dried hair, liberally spray mist directly onto roots in sections and work through the ends. Follow with normal hair drying and styling routine.</p>
        </div>
        <div class="care_info care-4">
            <h2>Air Magic<br />
                Ttexturizing<br />
                Spray</h2>
            <p><em>directions:</em> After drying hair into desired style, lift hair in sections and spray liberally underneath from root to tip. Use fingertips to add volume and texture. Spray all over hair to finish your look.</p>
        </div>
        <div class="care-tips-link"><a href="hair-styles-and-tips">> Hair Styling & Tips</a></div>
    </div>
</section> 




    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
