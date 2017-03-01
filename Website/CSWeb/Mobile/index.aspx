<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">

<div class="container">

<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header.html")%>

<div class="content">

    <div class="hometop">
        <h1>Banish Foot Pain Today!</h1>
        <h2>Instant, Soothing Relief for Aching Feet</h2>
        <img src="//d39hwjxo88pg52.cloudfront.net/tryfootrescue/images/mobile/home1.jpg" usemap="#Maphome" class="block full" />
      <map name="Maphome">
          <area shape="rect" coords="306,13,626,190" href="https://d39hwjxo88pg52.cloudfront.net/tryfootrescue/video/ctavideo.mp4" class="fancymedia">
        <area shape="rect" coords="24,588,309,676" href="tel:18000000000">
        <area shape="rect" coords="331,588,618,676" href="tv-introductory-offer.aspx">
        <area shape="circle" coords="440,344,85" href="#guarantee" class="guarantee">
      </map>
    
    </div>

    <div class="contentpad">

        <div class="home1b_txt">
            <h2>Are you ready for relief?</h2>
            <p>
                <img src="//d39hwjxo88pg52.cloudfront.net/tryfootrescue/images/mobile/home1a.jpg" class="fright" style="width: 47%; margin-left: 10px">
                Are your sexy high heels leaving you sore? Are your running shoes rubbing and chafing? Does standing all day leave you grimacing at night? Don’t let aching feet keep you from looking and feeling your best. It’s time to get Foot Rescue!
            </p>        </div>
    </div>



    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/tryfootrescue/images/mobile/homenav.png" usemap="#Maphome2" class="block full" />
        <map name="Maphome2">
          <area shape="rect" coords="2,1,638,84" href="howitworks.aspx">
          <area shape="rect" coords="2,93,638,176" href="testimonials.aspx">
          <area shape="rect" coords="2,184,638,268" href="faq.aspx">
          <area shape="rect" coords="2,274,638,357" href="mailto:[enter your email address]?subject=Email from TryFootRescue&body=Just sending a reminder to order from Foot Rescue! Simply visit http://www.tryfootrescue.com to banish foot pain!">
        </map>
    </div>
</div>

 <uc:Footer ID="Footer" runat="server" />


</div>
  
 </form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
