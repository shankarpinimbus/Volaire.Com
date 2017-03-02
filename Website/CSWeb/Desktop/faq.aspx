<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>

<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />
    
<link rel="stylesheet" type="text/css" href="/Styles/fontawesome/css/font-awesome.min.css">
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">

    <a href="#faq1" class="togglefaq"><i class="icon-plus"></i>Is the Cinchy a bag or a mat?</a>
    <div class="faqanswer">
        <p>
            Both! Cinchy is a mat and a bag. That's the genius behind Cinchy – it makes packing up quicker and easier than ever. Lay Cinchy out as a mat, place your item on the mat, then cinch it up! Now Cinchy is a bag that goes wherever you go!
        </p>
    </div>

    <a href="#faq2" class="togglefaq"><i class="icon-plus"></i>What size is the Cinchy when it is converted into a mat?</a>
    <div class="faqanswer">
        <p>
            When converted into a mat, Cinchy is 36 inches across.
        </p>
    </div>

    <a href="#faq3" class="togglefaq"><i class="icon-plus"></i>What is the length of the straps?</a>
    <div class="faqanswer">
        <p>
            When Cinchy is converted into a bag, the strap drop is 23-27 inches.
        </p>
    </div>

    <a href="#faq4" class="togglefaq"><i class="icon-plus"></i>How many patterns does the Cinchy come in?</a>
    <div class="faqanswer">
        <p>
            Cinchy comes in five stylish patterns: Grey Damask, Peacock Mum, Blue Chevron, Owl Dots, and Pink Lemonade.
        </p>
    </div>

    <a href="#faq5" class="togglefaq"><i class="icon-plus"></i>Is the Cinchy machine washable?</a>
    <div class="faqanswer">
        <p>
            Yes! You can wash your Cinchy so you always have a clean way to quickly pack a bag, or take a trip to the park.
        </p>
    </div>

     

</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
