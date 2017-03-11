<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.Desktop.CardDecline" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm.ascx" TagName="Form" TagPrefix="uc1" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
 

<!doctype html>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>

<body>
<form id="fm_credit" runat="server">
<!-- loader overlay front end -->
<div id="mask">
    <div class="loader">
        <p><img src="//d39hwjxo88pg52.cloudfront.net/images/loader.gif" /></p>
        <p>Your order is currently being processed.<br />Please do not exit or refresh this page to ensure that your order is processed accurately.</p>
    </div>
</div>
<!-- end loader front end --> 

    <div>
         <p style="color:red; margin: 1rem 0 -1rem; font-size: 1.2rem;">There was a problem with your credit card please try again.</p>
        <uc1:Form id="ucCardDecline" runat="server" />
    </div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
