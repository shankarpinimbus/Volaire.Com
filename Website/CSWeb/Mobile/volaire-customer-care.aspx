<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>



<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Volaire™ Customer Care | Customer Service</title>
<meta name="description" content="Contact a Volaire™ Customer Care by Phone or Email. Sulfate-free, Paraben-free, Color-Safe, Volumizing Hair Care Products " />
<meta name="keywords" content="" />
    
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<uc:Header ID="Header" runat="server" />

    <div>
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hero-customer-care.jpg" class="block full" />
        <a href="frequently-asked-questions" class="maplink carelink1">FAQ</a>
    </div>


    <div class="contact-box ">
        <div class="contact-row clearfix">
            <div class="contactinfo icon-phone">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/icon-phone.png" alt="Call Us" />
            </div>
            <div class="contact-text">
                <h3>Call Us:</h3>
                <p>1-800-201-6539 6am–6pm PST, <br />
                    Monday–Friday and <br />7am–1pm PST Saturday</p>
            </div>
        </div>
        <div class="contact-row clearfix">
            <div class="contactinfo icon-email">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/icon-email.png" alt="Call Us" />
            </div>
            <div class="contact-text">
                <h3>Email Us:</h3>
                <p>Click <a href="mailto:customercare@volaire.com" class="black scored">here</a> to reach us by email, and we <br />
                    promise to get back to you within 1–2 <br />business days</p>
            </div>
        </div>
                
    </div>

    <section class="container">
    <div class="customer-care-main">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/care-quote-yvette.jpg" alt="VOLAIRE, Yvette" class="block full" />
        <div style="text-align:right; padding-right: 5%;"><a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/yvette.mp4" class="watch_demo fancy_video">Watch Her Story</a></div>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
</section>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>





<uc:Footer ID="Footer" runat="server" />
</div>

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
