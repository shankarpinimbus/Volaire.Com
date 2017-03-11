<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Real Before and After Pictures Of Volaire Customers</title>
<meta name="description" content="Volaire™ real users, real women, photo's and pictures. Amazing volume with before and afters. Soft, touchable, every day effortless volume with Volaire!" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

<section class="before-afters-hdr">
    <h1>
        Volume for <span class="pink webfont1 ital uncaps normal">every hair type.</span>
    </h1>
</section> 

    <div class="quote-dawn">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/before-after-quote-dawn.jpg" alt="Dawn, Age 44" class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/dawn.mp4" class="watch_demo fancy_video">Watch Her Story</a>
    </div>

    <div class="before-afters">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-angie.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Angie, <em>Age 56</em></div>

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-kana.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Kana, <em>Age 33</em></div>

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-barbara.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Barbara, <em>Age 65</em></div>

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-nancy.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Nancy, <em>Age 64</em></div>

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-yvette.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Yvette, <em>Age 41</em></div>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
    

    <div class="quote-lindsay">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/before-after-quote-lindsay.jpg" alt="Lindsay, Age 23" class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/lindsay.mp4" class="watch_demo fancy_video">Watch Her Story</a>
    </div>
    
    <div class="before-afters">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-abra.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Abra, <em>Age 29</em></div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-cyndi.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Cyndi, <em>Age 52</em></div>
        <div class="text-right"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%></div>
    </div>
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hdr_flat.png" alt="Hair Feeling Dull & Flat? make it a thing of the past!" class="block" />

    <div class="before-afters">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-taunya.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Taunya, <em>Age 43</em></div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-brittney.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Brittney, <em>Age 21</em></div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-mel.jpg" alt="Before and After" class="block ba-img" />
        <div class="ba-attr">Mel, <em>Age 57</em></div>
    </div>
    
    <div class="quote-cyndi">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/before-after-quote-cyndi.jpg" alt="Cyndi, Age 52" class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/cyndi.mp4" class="watch_demo fancy_video">Watch Her Story</a>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>

    
    <div class="before-after-twins">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/before-after-twins.jpg" alt="Identical twins tested VOLAIRE..." class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/cyndi.mp4" class="watch_demo fancy_video">Watch Clip</a>
    </div>

    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/before-after-tip.jpg" class="block" alt="" />
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
