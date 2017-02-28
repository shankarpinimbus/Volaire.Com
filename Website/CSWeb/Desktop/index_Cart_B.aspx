<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_B" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingForm.ascx" TagName="BillingFormControl"
    TagPrefix="uc" %> 
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


 <uc:BillingFormControl ID="sfcShippingInfo" runat="server" RedirectUrl="/Desktop/AddProduct.aspx" />
 
  
</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
