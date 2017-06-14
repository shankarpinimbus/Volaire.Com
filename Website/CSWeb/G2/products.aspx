<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Store.products" EnableSessionState="True" %>
<%@ Register Src="/shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Products.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<link href="/styles/global.css" rel="stylesheet" type="text/css" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts.html")%>

    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
</head>
<body class="products_page">

<form runat="server" id="fm1">
    <uc:Header runat="server"/>
    <div class="toppad"></div>

    <div class="content">
      	<div class="container"></div>
    </div>
    <div class="content" style="padding-top: 1em; padding-bottom: 3em;">
        <div class="clearfix"><uc:Products runat="server"></uc:Products></div>
    </div>


    
<!-- end content area -->


    <!-- spacer so bottomcta doesn't cover up content above -->
    <div style="height: 10rem;"></div>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
   <uc:Footer ID="Footer1" runat="server" />
</form>  
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
