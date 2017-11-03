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
<body class="products_page products_page_i2">
<form runat="server" id="fm1">
    
        <div class="clearfix"><uc:Products runat="server"></uc:Products></div>
   


    
<!-- end content area -->


    <!-- spacer so bottomcta doesn't cover up content above -->
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
   <uc:Footer ID="Footer1" runat="server" />
</form>  
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
