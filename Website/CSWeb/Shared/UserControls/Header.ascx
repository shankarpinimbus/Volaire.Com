<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CSWeb.Shared.UserControls.Header" %>
<header>
	<section class="topbanner">
    	<div class="container clearfix">
        	
            	
                <% if (versionName.ToLower().Contains("g2") || versionName.ToLower().Contains("h2") || versionName.ToLower().Contains("i2") || versionName.ToLower().Contains("j2")
                       || versionName.ToLower().Contains("k2")
                       || versionName.ToLower().Contains("jj2")) %>
                <%
                   { %>
                        <div class="topbanner-links topbanner-links-shop">
                            <a href="frequently-asked-questions" class="nav-top-faqs uncaps">&gt; FAQ's</a>
            	            <a href="mega-promise-money-back-guarantee" class="nav-top-guarantee">&gt; Guarantee</a>
            	            <a href="hair-styles-and-tips" class="visiblet nav-top-tips">&gt; Hair Styles & Tips</a>
                            <a href="products" class="nav-top-shop">&gt; Shop Products</a>
                        </div>
                <% }  else  { %>
                        <div class="topbanner-links">
                            <a href="frequently-asked-questions" class="nav-top-faqs uncaps">&gt; FAQ's</a>
            	            <a href="mega-promise-money-back-guarantee" class="nav-top-guarantee">&gt; Guarantee</a>
            	            <a href="hair-styles-and-tips" class="visiblet nav-top-tips">&gt; Hair Styles & Tips</a>
                        </div>
    <% } %>
            
            <div class="topbanner-promo">
                <% if (versionName.ToLower().Contains("g2") || versionName.ToLower().Contains("h2") || versionName.ToLower().Contains("i2") || versionName.ToLower().Contains("j2")
                       || versionName.ToLower().Contains("k2")
                       || versionName.ToLower().Contains("jj2")) %>
                <%
                   { %>
                <div class="shopping_cart_nav"><a href="cart"><span class="cart_item_count"><%= itemCount %></span >Shopping Bag</a></div>
                <% } %>


                <% if (versionName.ToLower().EndsWith("b2") || versionName.ToLower().EndsWith("b3") || versionName.ToLower().EndsWith("b4")) %>
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
    <% }
        else if (versionName.ToLower().EndsWith("e2") || versionName.ToLower().EndsWith("g2") || versionName.ToLower().EndsWith("h2")
 || versionName.ToLower().EndsWith("i2") || versionName.ToLower().EndsWith("j2")
 || versionName.ToLower().EndsWith("k2")
 || versionName.ToLower().EndsWith("get_a1") || versionName.ToLower().EndsWith("get_aa1") )
        { %>
                <h2>
                    <a href="tv-introductory-offer">
                	    <span class="part1">Save 40%</span> 
                	    <span class="part2a">+</span> 
                	    <span class="part2b">Free Shipping</span> 
                	    <span class="part3"><span style="margin-right: 2px;">|</span> Promo Code</span> 
                	    <span class="part4">VOL40</span>
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
        </div>
    </section>
    <section>
    	<div class="container clearfix">
        	<div class="nav-logo"><h1><a href="index"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-LOGO-Bronze.png" alt="Best way to get hair volume is with VOLAIRE - no salon needed! Get beautiful, long-lasting volume that gives you 2xs the volume!" class="block" /></a></h1></div>
            <div class="nav-btn"><a href="tv-introductory-offer"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/Get-TV-Offer.png" alt="Get touchable, weightless volume INSTANTLY! Hairstyles that will last all day with VOLAIRE. Use coupon to get free shipping + free gift" class="block" /></a></div>
            <div id="cssmenu" class="nav-inner">
            	<h3 class="nav-phone"><%=GetDynamicSidData("phone") %></h3>
                <ul class="nav">
                	<li><a href="air-weight-technology" class="nav-tech">Airweight Technology™</a></li>
                    <% if (versionName.ToLower().Contains("g2")) %>
                <%
                   { %> <li><a href="products" class="nav_products">Products</a>
                <% }
                       else if (versionName.ToLower().Contains("g2") || versionName.ToLower().Contains("h2") || versionName.ToLower().Contains("i2") || versionName.ToLower().Contains("j2")
                                || versionName.ToLower().Contains("k2"))
                       { %>
                        <li class='has-sub'><a href="products" class="nav_products">Products</a>
                        <ul class="subnav">
                            <li><a href="hair-volumizing-products" class="nav-reviews">About Our Products</a></li>
                            <li><a href="tv-introductory-offer" class="nav-reviews">Shop TV Offer</a></li>
                            <li><a href="products" class="nav-reviews">Shop All Products</a></li>
                        </ul>
                       </li>
                <% }  else  { %>
                <li><a href="hair-volumizing-products" class="nav-products">Products</a></li>
                <% } %>

                    
                	<li><a href="volaire-reviews" class="nav-reviews">Reviews</a></li>
                	<li class="tablet-last"><a href="volaire-befores-and-afters" class="nav-before-afters">Before & Afters</a></li>
                	<li><a href="hair-styles-and-tips" class="hiddent nav-tips">Hair Styles & Tips</a></li>
                </ul>
            </div>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-LOGO-V.png" alt="VOLAIRE gives you softer, smoother hair with two times the volume. VOLAIRE supports stronger, healthier hair with each use!" class="block nav-v" />
        </div>
    </section>
</header>