<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingForm.ascx" TagName="BillingFormControl" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
 <form runat="server" id="fm1">
  
<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_cart.html")%>

<div class="content">

 <uc:BillingFormControl ID="sfcShippingInfo" runat="server" RedirectUrl="AddProduct.aspx" />
 </div>
  <uc:Footer ID="Footer" runat="server" />
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
