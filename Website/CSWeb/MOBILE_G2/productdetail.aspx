<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs"
    Inherits="CSWeb.Mobile.ProductDetail"  MaintainScrollPositionOnPostback="true" EnableSessionState="True" %>
<%@ Register Src="/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
       <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
      <script type="text/javascript">
          (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
</head>
<body class="productpages">
   
    <form runat="server">
        <uc:Header runat="server"/>


        <div id="page_products" class="shop_products_main">

    
            <div class="productdetail_box clearfix">
					<p class="breadcrumbs"><a href="index">Home</a> &gt; <a href="products.aspx">Shop Products</a> &gt; <span class="caps red"><asp:Label ID="lblSkuTitle" runat="server" /></span>
					</p>
					<!-- left column -->
							<div class="productdetail_img">
								<asp:Image ID="imgSku" runat="server" />
							</div>
                <!-- smaller product images-->
                        <div>
                            <asp:Image ID="smallImage1" runat="server" />
                            <asp:Image ID="smallImage2" runat="server" />
                            <asp:Image ID="smallImage3" runat="server" />
                            <asp:Image ID="smallImage4" runat="server" />
                        </div>
					
					<!-- right column -->
					
                <div class="productdetail_text">
			 			<div class="productdetail_text_top">
							  <h1><%=lblSkuTitle.Text %></h1>
			 			</div>
                     <div class="yotpo bottomLine"
                            data-product-id="<%=SkuId.ToString() %>">
                        </div>
                   <asp:Panel runat="server" Visible="false" ID="chooseSizePanel">
                            Choose Size
                            <asp:Button runat="server" ID="bigSizeSelectButton" OnClick="bigSizeSelectButton_Click" style="height: 26px" CommandArgument=""/>
                            &nbsp&nbsp&nbsp&nbsp<asp:Button runat="server" ID="smallSizeSelectButton" OnClick="smallSizeSelectButton_Click" />
                        </asp:Panel>
                        <asp:Panel runat="server" Visible="false" ID="productRetailPricePanel">
                            Product Value :
                            <asp:Label runat="server" ID="productValue"></asp:Label><br />
                            Retail Price :
                            <asp:Label runat="server" ID="retailPrice"></asp:Label>
                        </asp:Panel>

                 <div class="product_various_info clearfix">
                   
                    
						  
						 <div class="product_various_info_top">
                                <div class="productdetail_price" style="display:none;">
		 					    <span class="price_label">Product Value: </span> <%--$<asp:Label ID="lblRetailPrice" runat="server" />--%>
		 				     </div>
						     <div class="productdetail_price" style="display:none;">
		 					    <span class="price_label">Retail Value: </span> <asp:Label ID="lblSkuPrice" runat="server" />
		 				     </div>
                             <div class="product_various_info_bottom" style="display:none;">
							  	<p class="product_size"><asp:Label runat="server" ID="lblSize"></asp:Label></p>
								    
						     </div> 
						  
						
		  				    <div class="quantity_drop">
						      <strong>Quantity:</strong>
                                <asp:DropDownList runat="server" ID="ddlQuantity" CssClass="qty_select">
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                </asp:DropDownList>
						
						    </div> 
                             <asp:ImageButton ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/btn_addtocart.png" CssClass="product_btn_addtocart" />
                            <asp:Label ID="lblRetailPrice" runat="server" />
						 </div>
            <asp:Literal ID="ltDetailDescription" runat="server" />
					 </div> 
						  
						  <!-- begin stars  -->
						  		<%--<div class="reviewlink"><span class="reviewlinkoverlay"></span>
						  			<div class="yotpo bottomLine"
						  			data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
						  			data-domain="specificbeauty.com"
						  			data-product-id="<%=skuID.ToString() %>"
						  			data-product-models="<%=lblSkuTitle.Text %>"
						  			data-name="<%=lblSkuTitle.Text %>"
						  			data-url="The url to the page where the product is url escaped"
						  			data-image-url="<%=imagePath %>"
						  			data-description="<%=lblSkuTitle.Text %>"
						  			data-bread-crumbs="Product categories">
						  			</div>
						  		</div>--%>
						  <!-- end stars -->
						  
                </div>
            <div class="clear"></div>
					 
					 
					 
					 
					 
					 
					<!-- begin social -->
						<p class="product_social">
							<strong>Share it </strong>
							<a href="https://www.facebook.com/SpecificBeauty" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-fb.png" alt="Follow us on Facebook" /></a>
							<a href="https://twitter.com/SpecificBeauty" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-tw.png" alt="Follow us on Twitter" /></a>
							<a href="https://www.instagram.com/specificbeautyskincare/" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-ig.png" alt="Follow us on Instagram" /></a>
							<a href="https://www.pinterest.com/specificbeauty/" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-pn.png" alt="Follow us on Pinterest" /></a>
							<a href="mailto:?Subject=Specific Beauty"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-email.png" alt="Email a friend" /></a>
						</p>
						<!-- end social --> 
					 
					 <div>
                                     <asp:Literal ID="ltIngredients" runat="server" />
					 </div>
					<!-- begin tabs -->
                  <div class="reviewlink">
                    <span class="reviewlinkoverlay"></span>
						<a name="tabs"></a>
						<div class="productdetail_tabs">
							<ul class="tablinks">
							<li>
							<%--<a href="#tab-1" data-tab="tab-1" class="tablink active">Directions</a> 
							</li>
							<li>
							<a href="#tab-2" data-tab="tab-2" class="tablink">Ingredients</a> 
							</li>
							<li>--%>
							<a href="#tab-3" data-tab="tab-3" class="tablink tablink3">Reviews</a> 
							</li>
							</ul>
							<div class="tabcontent">
								<%--<div class="tab tab-1 tab-directions">
									<asp:Literal runat="server" ID="ltDirection"></asp:Literal></div>

								<div class="tab tab-2 tab-ingredients" style="display: none;">
									<asp:Literal runat="server" ID="ltIngredients"></asp:Literal></div>--%>

								<div class="tab tab-3 tab-reviews" style="display: none;">
									<div class="yotpo yotpo-main-widget"
									data-product-id="<%=SkuId.ToString() %>"
									data-name="<%=lblSkuTitle.Text %>"
									data-url="https://www.specificbeauty.com"
									data-image-url="<%=imagePath %>"
									data-description="<%=lblSkuTitle.Text %>">
									</div>
								</div>
							</div>
						</div>
					<!-- end tabs -->
            </div>

            

        </div>
        <div class="mbg-care-usage">
        <h2 class="la">Our LIVE EVEN<sup>®</sup> Promise</h2>
        <div class="row">
            <div class="col spanm8">
                <p class="sgreen">At Specific Beauty,<sup>®</sup> we are committed to helping you achieve the brighter, smoother, more even-toned skin you deserve. If for any reason you arenot 100% satisfied with any of our products, simply return them within <span class="iblock">30 days</span> of purchase for a full refund <span class="iblock">(less s&h).</span></p>
            </div>
            <div class="col spanm4 text-center">
                <img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/mobile/mbg.png" alt="30 Day Money Back Guarantee" />
            </div>
        </div>
    </div>
            </div>
        <!-- end content area -->
           <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
<uc:Footer ID="Footer" runat="server" />
    </form>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
    </html>
