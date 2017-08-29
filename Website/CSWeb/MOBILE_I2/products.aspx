<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.products" EnableSessionState="True" %>
<%@ Register Src="/shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Products_I2.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
       <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>

</head>
<body class="mobile_products_page productpages">

<form runat="server" id="fm1">
    <uc:Header runat="server"/>

    <a href="tv-introductory-offer"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_i2/hero-VOLAIRE-Volume-Essentials-3-1.jpg" alt="BEST offer! Volume Essentials Collection" class="block full" /></a>


    <div class="shop_products_main">
        <div class="clearfix"><uc:Products runat="server"></uc:Products></div>

        
    </div>

    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
    
<!-- end content area -->
<uc:Footer ID="Footer" runat="server" />

</form>  
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>