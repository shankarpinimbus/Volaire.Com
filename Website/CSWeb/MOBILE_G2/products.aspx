<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.products" EnableSessionState="True" %>
<%@ Register Src="/shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Products.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
       <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<link href="/styles/global_store.css" rel="stylesheet" type="text/css" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts.html")%>
    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>

</head>
<body class="mobile_products_page productpages">

<form runat="server" id="fm1">
    <uc:Header runat="server"/>
    <div class="toppad"></div>

    <div class="content">
       	<div class="container"><a href="order-page"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/all_products_hero_mobile.jpg" class="scale-with-grid all_products_hero" /></a></div>
    </div>
    <div class="content" style="padding-top: 1em;">
        <div class="clearfix"><uc:Products runat="server"></uc:Products></div>

        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
           <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
    </div>


    
<!-- end content area -->
<uc:Footer ID="Footer" runat="server" />

</form>  
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>