<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CSWeb.Shared.UserControls.Header" %>
<header>
	<section class="topbanner">
        <div class="topbanner-promo">
            <% if (versionName.ToLower().EndsWith("b2") || versionName.ToLower().EndsWith("b3") ) %>
    <% { %>
                    <h2>
                    <a href="tv-introductory-offer">
                	    <span class="part1">Save 33%</span> 
                	    <span class="part2a">+</span> 
                	    <span class="part2b">Free Shipping</span> 
                	    <span class="part3"><span style="margin-right: 2px;">|</span> Promo Code</span> 
                	    <span class="part4">VOL33</span>
                    </a>
                </h2>
    <% } else  { %>
                <h2>
                    <a href="tv-introductory-offer">
                	    <span class="part1">Save 40%</span> 
                	    <span class="part2a">+</span> 
                	    <span class="part2b">Free Shipping</span> 
                	    <span class="part3"><span style="margin-right: 2px;">|</span> Promo Code</span> 
                	    <span class="part4">Save40</span>
                    </a>
                </h2>
    <% } %>
        </div>
        <%--display mega collection --%>
        <div class="header-mega">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/hdr-mega.png" alt="Do Not Miss This Amazing Offer" class="block full" />
        </div>
        <div class="header-shine">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/header-shine.png" alt="Make Your Results Shine Today!" class="block full" />
        </div>
        <div class="header-tangle">
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/header-tangle.png" alt="Final Chance to Save Big Today!" class="block full" />
        </div>
    </section>
    <section>
        <div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/header.png" alt="Best way to get hair volume is with VOLAIRE - no salon needed! Get beautiful, long-lasting volume that gives you 2xs the volume!" class="block full" />
            <a href="index" class="maplink hdrlink1">Home</a>
            <a href="#" class="maplink hdrlink2 toggleNav">Menu</a>

            <%--display ssl only on offer pages and cart pages--%>
            <div class="header-ssl">
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/ssl.png" alt="SSL - Secure Online Ordering" class="block" />
            </div>


            <ul id="headernav" class="nav">
                <li><a href="index">Home</a></li>
                <li><a href="air-weight-technology">Airweight Technology™</a></li>
                <li><a href="hair-volumizing-products">Products</a></li>
                <li><a href="volaire-reviews">Reviews</a></li>
                <li><a href="volaire-befores-and-afters">Before & Afters</a></li>
                <li><a href="hair-styles-and-tips">Hair Styles & Tips</a></li>
                <li><a href="frequently-asked-questions">FAQs</a></li>
                <li><a href="mega-promise-money-back-guarantee">Guarantee</a></li>
                <li><a href="volaire-customer-care">Customer Care</a></li>
                <li><a href="care-and-usage">Care and Usage</a></li>
                <li><a href="terms-and-conditions">Terms and Conditions</a></li>
                <li><a href="privacy-policy">Privacy Policy</a></li>
            </ul>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-LOGO-V.png" alt="VOLAIRE gives you softer, smoother hair with two times the volume. VOLAIRE supports stronger, healthier hair with each use!" class="block nav-v" />
        </div>
    </section>
</header>

<div class="stickynav">
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/stickynav.png" alt="Menu" class="block full" />
    <a href="tel:<%= GetCleanPhoneNumber(GetDynamicSidData("phone"))%>" class="maplink stickylink1">Call Now</a>
    <a href="tv-introductory-offer" class="maplink stickylink2">Order Now!</a>
</div>
<div class="stickynav-landscape">
    <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/stickynav-landscape.png" alt="Menu" class="block full" />
    <a href="tel:<%= GetCleanPhoneNumber(GetDynamicSidData("phone"))%>" class="maplink stickylink1">Call Now</a>
    <a href="tv-introductory-offer" class="maplink stickylink2">Order Now!</a>
</div>