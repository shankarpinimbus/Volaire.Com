<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Airweight Technology Designed to Add Weightless Volume</title>
<meta name="description" content="Airweight™ Technology gives you instant, touchable, weightless volume after just ONE use! Avocado Oil, Kelp & Seaweed promotes healthy hair and strength" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/AirWeight-Technology.jpg" alt="Thicker, fuller, hair with more volume just by using VOLAIRE. Get amazing volume instantly with VOLAIRE" class="block full" />
     <div style="margin: .4rem 0 .8rem;">
         <%# CSBusiness.DynamicVersion.Helper.IncludeFile("benefits-txt.html")%>
     </div>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Rise-Above.png" alt="VOLAIRE hair care products do not weigh hair down. Hair care with coconut and vitamins to promote hair health" class="block full" />
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/airweight-2b.jpg" alt="Volume you can see" class="block full" />
    
    <div class="airweight-3">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/airweight-3a.png" alt="VOLAIRE - instant, weightless volume; long-lasting, touchable style; enhances shine and color" class="block full" />
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
    
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/airweight-4.jpg" alt="AirWeight Technology - VOLAIRE creats air between hair" class="block full" />
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/airweight-5.png" alt="Microspheres attach to hair to create space between strands without weighing down hair" class="block" />
    
    <div class="airweight-kristi">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Kristi-1.jpg" alt="VOLAIRE gives you fun, sexy, alive hair that has volume that lasts all day! Instant and lasting volume with VOLAIRE." class="block full" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/kristi.mp4" class="watch_demo fancy_video">Watch Her Story</a>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
    
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Dean-Banowetz-1.jpg" alt="Get volume that lasts all day. Hair styles that take you from day to night, work to play with VOLAIRE!" class="block full" />


    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
