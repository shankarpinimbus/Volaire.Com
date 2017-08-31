<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ 60-day Mega Promise Guarantee</title>
<meta name="description" content="Learn more about Volaire Mega Promise 60-day Money Back Guarantee" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />
    
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-guarantee-mega-promise-60day.jpg" alt="No risk money back guarantee with VOLAIRE Hair Volumizing System! Try our products risk free for 60 days!" class="block full" />
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/Richard-Ward-Guarantee.jpg" alt="VOLAIRE gives your hair texture, volume, bounce and life! Best offer on VOLAIRE Hair Volumizing System!" class="block full" />
    
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
