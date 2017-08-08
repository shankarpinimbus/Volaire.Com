<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/ShippingBillingCreditForm_MOBILE.ascx" TagName="ShippingBillingCreditForm" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Get Volaire™ Hair Care Products </title>
<meta name="description" content="Easy checkout for Volaire Hair Care Products " />

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>

</head>
 
<body id="cart" class="cart_i2">
<form runat="server" id="fm_credit">
<div class="container">
<uc:Header ID="Header" runat="server" />
    <section class="steps_hdr  gradient">
        <div class="container clearfix">
            <div class="steps_hdr_step step_a step_on step_on_1b">
                <strong class="steptxt">STEP 1</strong> Upgrade Your Kit
            </div>
            <div class="steps_hdr_step step_b step_on step_on_1b">
                <strong class="steptxt">STEP 2</strong> Add Ons
            </div>
            <div class="steps_hdr_step step_c step_on step_on_1">
                <strong class="steptxt">STEP 3</strong> Check Out
            </div>
            <div class="steps_hdr_step step_d step_off step_off_1b">
                <strong class="steptxt">STEP 4</strong> Confirmation
            </div>
        </div>
    </section>

 <uc:ShippingBillingCreditForm ID="sbcfShippingBillingCreditForm" runat="server" RedirectUrl="AddProduct.aspx" />


  <uc:Footer ID="Footer" runat="server" />
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
