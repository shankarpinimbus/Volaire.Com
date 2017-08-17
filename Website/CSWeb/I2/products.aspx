<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Store.products" EnableSessionState="True" %>
<%@ Register Src="/shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Products_I2.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
    <title>Volaire™| Hair Volumizing Products</title>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
</head>
<body class="products_page">

<form runat="server" id="fm1">
    <uc:Header runat="server"/>

<section>
	<div class="shop_products_1">
    	<div class="container">
        	<div class="shop_productstop">
            	<img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/hero-products-2-1.jpg" alt="BEST offer! Volume Essentials Collection - Get TV Offer!" class="block" />
                <a href="tv-introductory-offer" class="home1link">Get TV Offer</a>
            </div>
        </div>
    </div>
</section>


    <div class="container shop_products_main">
        <div class="clearfix"><uc:Products runat="server"></uc:Products></div>
    </div>


    
<!-- end content area -->


    <!-- spacer so bottomcta doesn't cover up content above -->
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
   <uc:Footer ID="Footer1" runat="server" />
</form>  
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
