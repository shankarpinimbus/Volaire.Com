<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

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
<uc:Header ID="Header" runat="server" />
    
<section class="hero hero-customer-care">
    <div class="container">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Customer-Care.jpg" alt="The VOLAIRE Hair Volumizing System was created to work perfectly together to give you effortless volume, all day long" class="block" />
        <div class="hero-customer-care-content">
            <h1 class="black">Have a<br />
                Hair-Raising
                <span class="line2 webfont1 ital normal orange uncaps">question?</span>
            </h1>
            <p class="intro"><span class="part1">then talk to us!</span> For information about your order, our products, or any other questions, check out our <a href="frequently-asked-questions" class="black scored bold">FAQs</a> or reach out to us below!</p>
            <div class="contact-box gradient">
                <div class="contact-row clearfix">
                    <div class="contactinfo icon-phone">
                        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/icon-phone.png" alt="Call Us" />
                    </div>
                    <div class="contact-text">
                        <h3>Call Us:</h3>
                        <p>1-800-201-6539 6am–6pm PST, Monday–Friday and 7am–1pm PST Saturday</p>
                    </div>
                </div>
                <div class="contact-row clearfix">
                    <div class="contactinfo icon-email">
                        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/icon-email.png" alt="Call Us" />
                    </div>
                    <div class="contact-text">
                        <h3>Email Us:</h3>
                        <p>Click <a href="mailto:customercare@volaire.com" class="black scored">here</a> to reach us by email, and we promise to get back to you within 1–2 business days</p>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</section> 

<section class="container">
    <div class="customer-care-main">
        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Yvette-2.jpg" alt="After using VOLAIRE hair has tons of body and it keeps your curl all day long! Perfect for all age types!" class="block" />
        <a href="//d39hwjxo88pg52.cloudfront.net/volaire/video/yvette.mp4" class="watch_demo fancy_video">Watch Her Story</a>
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("note-txt.html")%>
    </div>
</section>




<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
