<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Airweight Technology Designed to Add Weightless Volume</title>
<meta name="description" content="Airweight™ Technology gives you instant, touchable, weightless volume after just ONE use! Avocado Oil, Kelp & Seaweed promotes healthy hair and strength" />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

<div class="legal">
        
        <!--#include virtual="/Shared/terms-txt.html" -->

</div>
    


<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
