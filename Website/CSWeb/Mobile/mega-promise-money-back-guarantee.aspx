<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ 30-day Mega Promise Guarantee</title>
<meta name="description" content="Learn more about Volaire Mega Promise 30-day Money Back Guarantee" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-guarantee.jpg" alt="Our Mega Promise " class="block" />
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/guarantee-content.jpg" alt="What I love about Volaire, it’s OMG volume! It’s going to give you so much texture and extra bounce to your hair. - Richard Ward, Celebrity and Royal Stylist" class="block" />
    
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
