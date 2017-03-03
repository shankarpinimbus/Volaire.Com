<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Products for Volumizing, Texture and Healthy Scalp and Hair</title>
<meta name="description" content="Volaire is a sulfate-free and paraben-free hair volumizing system that gives healthy, beautiful hair with natural shine and weightless texture and volume" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="before-afters">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero before-afters-hdr">
    <div class="container">
        <h1>
            Volume for <span class="pink webfont1 ital uncaps normal">every hair type.</span>
        </h1>
    </div>
</section> 

<section class="before-afters">
    <div class="container">
        <div class="row">
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-angie.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Angie, <em>Age 56</em></div>
                <div class="ba-spacer">
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-kana.jpg" alt="Before and After" class="block ba-img" />
                    <div class="ba-attr">Kana, <em>Age 33</em></div>
                </div>
            </div>
            <div class="col span8 quote-dawn">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-quote-dawn.jpg" alt="Before and After" class="block ba-img" />
                <a href="#video" class="watch_demo">Watch Her Story</a>
                <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
            </div>
        </div>
        <div class="row">
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-barbara.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Barbara, <em>Age 65</em></div>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-nancy.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Nancy, <em>Age 64</em></div>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-yvette.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Yvette, <em>Age 41</em></div>
            </div>
        </div>
        <div class="basic-note"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%></div>
        <div class="row">
            <div class="col span8 quote-lindsay">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-quote-lindsay.jpg" alt="Before and After" class="block ba-img quote-lindsay-img" />
                <a href="#video" class="watch_demo">Watch Her Story</a>
                <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-abra.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Abra, <em>Age 29</em></div>
                <div class="ba-spacer">
                    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-cyndi.jpg" alt="Before and After" class="block ba-img" />
                    <div class="ba-attr">Cyndi, <em>Age 52</em></div>
                    <div class="basic-note2"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-taunya.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Taunya, <em>Age 43</em></div>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-brittney.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Brittney, <em>Age 21</em></div>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-mel.jpg" alt="Before and After" class="block ba-img" />
                <div class="ba-attr">Mel, <em>Age 57</em></div>
            </div>
        </div>
        <div class="row">
            <div class="col span8 quote-cyndi">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-quote-cyndi.jpg" alt="Before and After" class="block ba-img quote-lindsay-img" />
                <a href="#video" class="watch_demo">Watch Her Story</a>
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-selfies-wanted.jpg" alt="Before and After Selfies Wanted!" class="block ba-img" />
            </div>
        </div>
        <div class="basic-note"><%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%></div>
    </div>
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-bottom.jpg" alt="Still Think We're Teasing?" class="block" style="margin-bottom: 1.5rem;" />
    </div>
</section>



<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
