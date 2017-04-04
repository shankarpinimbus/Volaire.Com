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
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/DIY-2.png" alt="Getting volume on your own at home is easy with VOLAIRE. Your hairstyle will not fall with VOLAIRE AirWeight Technology!" class="block" />
        </div>
    </div>
</section> 

<section class="tips-main">
    <div class="container">
        <div class="tips-top">
            <h2>Get these <span class="med caps lightblue2">Everyday ‘do</span>s!</h2>
            <p class="intro">Create your own fave salon styles with ease using <strong class="med caps">Volaire’s Hair Volumizing system</strong>. Choose a look below to see our stylists in action or get step-by-step techniques to create on your own. </p>
            <div class="row">
                <div class="tips-left">
                    <p class="p1">Richard Ward’s Signature Chelsea blow dry</p>
                    <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/chelsea.mp4" class="fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Chelsea-BlowDry.jpg" alt="Get Kate Middleton's signature Chelsea Blow Out at home and easier than ever using VOLAIRE hair care products." class="iblock" /></a>
                    <p class="p2"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/chelsea.mp4" class="watch_demo fancy_video">Watch Me</a></p>
                </div>
                <div class="tips-right">
                    <p class="p1">Dean Banowetz – Beach Waves </p>
                    <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/beachy-wave.mp4" class="fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Beach-Waves.jpg" alt="Create easy boho beach waves that last all day long using VOLAIRE. Perfect hair for a date, night out or work!" class="iblock" /></a>
                    <p class="p2"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/beachy-wave.mp4" class="watch_demo fancy_video">Watch Me</a></p>
                </div>
            </div>
            <div class="row">
                <div class="tips-left">
                    <p class="p1">Dean Banowetz - Modern Up-Do</p>
                    <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/twist-updo.mp4" class="fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Twist-Updo.png" alt="Beautiful, elegant hairstyle that is perfect for any occasion. Wedding hair, bridal shower hair, night out hair!" class="iblock" /></a>
                    <p class="p2"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/twist-updo.mp4" class="watch_demo fancy_video">Watch Me</a></p>
                </div>
                <div class="tips-right">
                    <p class="p1">Dean Banowetz – Modern Blow Out</p>
                    <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/modern-blow-out.mp4" class="fancy_video"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Modern-Blowout.png" alt="Classic, gorgeous hairstyle that is perfect for any occasion. Volume and style will last all day with VOLAIRE." class="iblock" /></a>
                    <p class="p2"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/modern-blow-out.mp4" class="watch_demo fancy_video">Watch Me</a></p>
                </div>
            </div>
        </div>
        
        <div class="row tip-bottom">
            <div class="col span8 tips-quote-luke">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Luke-Oconnor-2.png" alt="Have the confidence to create gorgeous hair styles from your own home using VOLAIRE! Easy hairstyles with volume!" class="block" />
            </div>
            <div class="col span4">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/before-after/Selfies-Wanted.jpg" alt="Send a selfie of your best hairstyle when using VOLAIRE to get a chance to be feautred on our infomercial!" class="block tips-before-after-selfies-wanted" />
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
