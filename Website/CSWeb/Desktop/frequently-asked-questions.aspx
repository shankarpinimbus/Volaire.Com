<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.index_cart_C" EnableSessionState="True" %>
<%@ Register Src="~/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>VOLAIRE™ FAQ's & Customer Care</title>
<meta name="description" content="Volaire questions, hair care questions, volumizer questions, shampoo and conditioner questions, ingredients, and learn about how to use VOLAIRE™" />
<meta name="keywords" content="" />
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
</head>
 
<body>
<form runat="server" id="fm1">
<uc:Header ID="Header" runat="server" />

<section class="hero hero-faq gradient">
    <div class="hero-faq1">
        <div class="container">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hero-faq.jpg" alt="Frequently Asked Questions" class="block" />
        </div>
    </div>
</section> 

<div class="container faq">
    <dl>
        <dt>What is VOLAIRE?</dt>
        <dd>VOLAIRE<sup>™</sup> is the revolutionary Volumizing Hair System that uses AirWeight Technology<sup>™</sup> to deliver full-proof results for everyday, effortless, lasting volume. </dd>

        <dt>How is VOLAIRE different than other volumizing products?</dt>
        <dd>VOLAIRE doesn’t use heavy silicone to “thicken” each individual strand of hair that ultimately weigh it down. The secret is AirWeight Technology. This triple action complex mimics the look and feel of thicker hair by adding positively-charged oxygen spheres that naturally create weightless space between each hair strand, giving them instant lift and weightless volume. </dd>

        <dt>How do I use VOLAIRE?</dt>
        <dd>Just shampoo and condition your hair using the Weightless Volumizing Shampoo and Weightless Fortifying Conditioner. It's just that easy to get the instant and lasting volume you want. For extra texture, body and lift, use the Uplift Volumizing Mist and Air Magic Texturizing Spray.</dd>

        <dt>Can I use VOLAIRE every day?</dt>
        <dd>VOLAIRE is gentle enough to use every day. The frequency of use depends on your hair’s thickness and condition (oily versus dry and/or color treated). Because Volaire extends your style longer, you may find that you need to wash your hair less often.</dd>

        <dt>How do I use VOLAIRE?</dt>
        <dd>The Volaire Hair Volumizing System was created to work perfectly together to give you effortless volume, all day long.
            <ul>
                <li><strong class="med">Weightless Volumizing Shampoo – </strong> Dispense a large dollop of shampoo into palm and activate lather by rubbing hands together. 	Massage lather into wet hair, from roots to ends. Rinse thoroughly. Repeat as needed.</li>		
                <li><strong class="med">Weightless Fortifying Conditioner – </strong> After shampooing, apply a quarter size amount to wet hair, starting from the bottom half of the hair 		and working down to the tips, distributing the product evenly. Rinse thoroughly with cool water.</li>
                <li><strong class="med">Uplift Volumizing Mist – </strong> After showering, on combed, towel-dried hair, liberally spray mist directly onto roots in sections and work 			through the ends. Follow with normal hair drying and styling routine.	 </li>
                <li><strong class="med">Air Magic Texturizing Mist – </strong> After drying hair into desired style, lift hair in sections and spray liberally underneath from root to tip. Use 			fingertips to add volume and texture. Spray all over hair to finish your look.</li>
            </ul>
        </dd>

        <dt>I never use conditioners because they weigh my hair down, <br />
            why should I use VOLAIRE’S Weightless Fortifying Conditioner?</dt>
        <dd>Conditioner helps balance the pH levels in your hair while adding nutrients and hydration to help prevent breakage and to smooth cuticles for healthier, shiny hair with better body and bounce. </dd>

        <dt>Is VOLAIRE suitable for my hair type?</dt>
        <dd>VOLAIRE is suitable for all hair types, whether long, short, curly, straight, flat, fine, thinning, unruly, color treated, or chemically-treated.</dd>

        <dt>How quickly will I see results with VOLAIRE?</dt>
        <dd>You will experience instant volume and texture with Volaire. Your full-bodied style will last longer while hair remains smooth and touchable. </dd>

        <dt>Can I use VOLAIRE if I color my hair?</dt>
        <dd>Absolutely! Volaire doesn't contain sulfates, parabens, or phthalates so it doesn’t strip away color.</dd>

        <dt>Can I use styling tools with VOLAIRE?</dt>
        <dd>While you may find less need to use your styling tools after using Volaire, you can continue to use your styling tools as needed. </dd>

        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/faq-quote-mell.jpg" alt="'It feels like there's air in my hair. It is unbelievable. It's great. I LOVE IT.' - Mell, Age 52" class="fright" style="margin: 2rem -2% 0 2%;" />

        <dt>PAYMENT OPTIONS</dt>
        <dd>We accept debit and credit cards including Visa, MasterCard, American Express and Discover. We do not accept cash, personal checks, money orders, or cash-on-delivery.</dd>

        <dt>SALES TAX</dt>
        <dd>Sales tax will be applied to orders shipping to California, Georgia, Ohio, Utah, and Virginia.</dd>

        <dt>ORDER PROCESSING AND SHIPPING</dt>
        <dd>Orders are typically processed within 1-2 business days and delivered within 5-7 business days, Monday through Saturday, excluding holidays. </dd>

        <dt>ORDER TRACKING</dt>
        <dd>When your order ships from our fulfillment center, you will receive a shipment confirmation email that includes a tracking number from a major US carrier.</dd>

        <dt>RETURNS / EXCHANGES</dt>
        <dd>Your satisfaction is important to us! We have a 30 day return policy. See the full details on our <a href="" class="med black scored">Guarantee page</a>.</dd>

    </dl>
</div>

     
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>

    
<uc:Footer ID="Footer" runat="server" />
</form>
<%#CSBusiness.DynamicVersion.Helper.IncludeFile("popups.html")%>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
