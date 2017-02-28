<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.Store.index" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>

</head>
 
<body>
<form runat="server" id="fm1">
<div class="container">
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("header_upsell.html")%>

<div class="content">

<!-- additional 1p -->
<div class="page_upsell">

<h2>Get an Additional Month's <br>
Food Supply <strong>and save BIG!</strong></h2>
<p><img src="../Content/Images/mobile/upsell_additional_1p.jpg" width="280" height="328" class="fright" />You're wise enough to prepare for emergencies with a 1 month's supply, keep in mind that is 1 month per person so if you have more members in your family you can add another month's food at a deep discount of 20%. Or simply get a second month's supply for yourself and save. Get your additional 1-month food supply for a special price of $79.99 plus <strong class="red">FREE SHIPPING &amp; HANDLING</strong> when you add it to your purchase today!</p>
<p class="text-right"><label for="qty">How Many? </label>
<select name="qty" required error=" * Please Select Quantity">
<option value="">- Select -</option>
<option value="1">1</option> 
<option value="2">2</option> 
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option> </select>
<span class="block text-right f25" style="padding-top: 6px">Limit 5 per customer</span>
</p>

<span class="ask">Would you like to take <br>
advantage of this special offer? <span class="btns"><a href="javascript:void(0)" bind="no"><img src="/content/images/mobile/nothanks_btn.jpg" /></a><a href="javascript:void(0)" bind="yes"><img src="/content/images/mobile/yes_btn.jpg" /></a><div class="ask_arrow"></div></span>
</span>
<div class="clear"></div>
</div>

<!-- veggies 3p -->
<div class="page_upsell">


<h2><strong>Essential Vegetables </strong>That <br>
Are There When You Need Them!</h2>
    <p><img src="../Content/Images/mobile/upsell_veggie_3p.jpg" /><br><a class="green veggiemobile scored" href="/content/images/mobile/veggie_pop.png"><strong>See What You'll Get!</strong></a></p>
<p class="pad6">In an emergency, it's more important than ever that you get the nutrition that you need, and as we all know, vegetables are a great source of vitamins and minerals! Add the vegetable kit and add even more variety to your food supply. Pay with three easy payments of only $29.99 plus $5.99 shipping and handling. <strong>That's 128 servings of vegetables – add the vegetable kit today!</strong></p>
    <ul class="bold" style="margin-left: 20px">
<li class="pad6"><span class="red">128 Total Servings</span></li>
<li class="pad6"><span class="red">25 Year Shelf Life</span></li>
<li class="pad6"><span class="red">Just Add Water to Rehydrate</span></li>
</ul>
<p class="text-right"><label for="qty">How Many? </label>
<select name="qty" required error=" * Please Select Quantity">
<option value="">- Select -</option>
<option value="1">1</option> 
<option value="2">2</option> 
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option> </select>
<span class="block text-right f25" style="padding-top: 6px">Limit 5 per customer</span>
</p>
<span class="ask">Would you like to take <br>
advantage of this special offer?
<span class="btns"><a href="javascript:void(0)" bind="no"><img src="/content/images/mobile/nothanks_btn.jpg" /></a><a href="javascript:void(0)" bind="yes"><img src="/content/images/mobile/yes_btn.jpg" /></a><div class="ask_arrow"></div></span>
</span>
<div class="clear"></div>
</div>  





<!-- protein 1p -->
<div class="page_upsell">


<h2><strong>Keep Your Strength Up in <br>
the Times When You'll Need It!</strong></h2>
<p class="pad6"><a href="/content/images/mobile/protein_pop.png" class="proteinmobile"><img src="../Content/Images/mobile/upsell_protein_1p.jpg" class="fright" /></a>Protein is the building block of life, and of muscle. To keep yourself strong in an emergency, you want to make sure you're getting enough proteins. That's why for just a single payment of $89.99 today, you can add a protein kit plus get <strong class="red">FREE SHIPPING &amp; HANDLING! </strong>Keep your strength up – add a protein kit today!</p>
    <ul class="bold" style="margin-left: 20px">
<li class="pad6"><span class="red">42 Total Servings</span></li>
<li class="pad6"><span class="red">15 Year Shelf Life</span></li>
<li class="pad6"><span class="red">Just Add Water to Rehydrate</span></li>
</ul>
<p class="text-right"><label for="qty">How Many? </label>
<select name="qty" required error=" * Please Select Quantity">
<option value="">- Select -</option>
<option value="1">1</option> 
<option value="2">2</option> 
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option> 
</select>
<span class="block text-right f25" style="padding-top: 6px">Limit 5 per customer</span>
</p>
<span class="ask">Would you like to take <br>
advantage of this special offer?
<span class="btns"><a href="javascript:void(0)" bind="no"><img src="/content/images/mobile/nothanks_btn.jpg" /></a><a href="javascript:void(0)" bind="yes"><img src="/content/images/mobile/yes_btn.jpg" /></a><div class="ask_arrow"></div></span>
</span>
<div class="clear"></div>
</div>  




<!-- single pay -->
<div class="page_upsell">
<div style="position: absolute; right: 23px; top: 0"><img src="../Content/Images/mobile/upsell_freeshipcall.jpg" width="185" height="170" /></div>

 
<h2>Get <strong>FREE SHIPPING</strong><br>
    by Choosing One Easy <br>
    Payment!</h2>
<p>Save yourself the hassles of monthly payments. If you choose to pay in full today, we'll pay for your shipping, that is a $19.99 SAVINGS for you!</p>
<p><strong>We'll drop the Shipping &amp; Handling: <span class="red" style="text-decoration: line-through"><span class="gray">$19.99</span></span></strong></p>

<span class="ask"><span class="f26">With 1-PAY, you'll only pay <span class="red" style="text-decoration: line-through"><span class="gray">$119.98</span></span>  $99.99</span>
<br>
Would you like to take <br>
advantage of this special offer? <span class="btns"><a href="javascript:void(0)" bind="no"><img src="/content/images/mobile/nothanks_btn.jpg" /></a><a href="javascript:void(0)" bind="yes"><img src="/content/images/mobile/yes_btn.jpg" /></a><div class="ask_arrow"></div></span>
</span>
<div class="clear"></div>

  
</div>
 
</div>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("footer_upsell.html")%>
</div>


</form>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
