<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ Volumizing Hair Styles, Tips and Looks </title>
<meta name="description" content="Learn hair care tips, tricks, tutorials, and must-have products, specifically for you. What's your hair type?" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body id="tips">
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-tips-wrap gradient">
    <div class="hero-tips">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-tips.png" alt="Do It Yourself with Volaire!" class="block" />
        </div>
    </div>
</section> 

<section class="tips-main">
    <div class="container">
        <div class="tips-top">
            <h2>Get these <span class="med caps lightblue2">Everyday ‘do</span>s!</h2>
            <p class="intro">Create your own fave salon styles with ease using <strong class="med caps">Volaire’s Hair Volumizing system</strong>. Choose a look below to either see our stylists in action or get step-by-step techniques to create on your own. </p>
            <div class="row">
                <div class="tips-left">
                    <p class="p1">Richard Ward’s Signature Chelsea blow dry</p>
                    <a href="#video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tips-richard-ward-chelsea-blow-dry.jpg" alt="Richard Ward" class="iblock" /></a>
                    <p class="p2"><a href="#video" class="watch_demo">Watch Me</a></p>
                </div>
                <div class="tips-right">
                    <p class="p1">Dean Banowetz – Beach Waves </p>
                    <a href="#video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tips-dean-banowetz-beach-waves.jpg" alt="Dean Banowetz" class="iblock" /></a>
                    <p class="p2"><a href="#video" class="watch_demo">Watch Me</a></p>
                </div>
            </div>
            <div class="row">
                <div class="tips-left">
                    <p class="p1">Dean Banowetz - Modern Up-Do</p>
                    <a href="#video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tips-fpo.jpg" alt="Richard Ward" class="iblock" /></a>
                    <p class="p2"><a href="#video" class="watch_demo">Watch Me</a></p>
                </div>
                <div class="tips-right">
                    <p class="p1">Dean Banowetz – Modern Blow Out</p>
                    <a href="#video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tips-fpo.jpg" alt="Dean Banowetz" class="iblock" /></a>
                    <p class="p2"><a href="#video" class="watch_demo">Watch Me</a></p>
                </div>
            </div>
        </div>
        
        <div class="row tip-bottom">
            <div class="col span8 tips-quote-luke">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/tips-quote-luke-o-connor.jpg" alt="Luke O'Connor" class="block" />
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after-selfies-wanted.jpg" alt="Before and After Selfies Wanted!" class="block tips-before-after-selfies-wanted" />
            </div>
        </div>
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
