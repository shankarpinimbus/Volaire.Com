﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs"
    Inherits="CSWeb.ProductDetail"  MaintainScrollPositionOnPostback="true" EnableSessionState="True" %>
<%@ Register Src="/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">

<link href="/styles/global_store.css" rel="stylesheet" type="text/css" />
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
</head>
<body>
   
<form runat="server">
    <uc:Header runat="server"/>
    <div class="toppad"></div>

    <div class="container3">
        <div id="page_products" class="content">
            <div style="display: none;"><asp:Label ID="lblSkuDescription" runat="server" /></div>
            <div class="productdetail_box clearfix">
                <p class="breadcrumbs"><a href="index">Home</a> &gt; <a href="products.aspx">Shop Skin Care Products</a> &gt; <span class="caps red"><asp:Label ID="lblSkuTitle" runat="server" /></span></p>
                
                <div class="productdetail_img">
                    <asp:Image ID="imgSku" runat="server" />
                </div>

                <div class="productdetail_text">
                   <div class="productdetail_text_top">
                       <h1><%=lblSkuTitle.Text %></h1>
			 			</div>
                    <asp:Panel runat="server" visible="false" id="chooseSizePanel">
                        Choose Size <asp:Button runat="server" ID="bigSizeSelectButton"/> &nbsp&nbsp&nbsp&nbsp<asp:Button runat="server" ID="smallSizeSelectButton" />
                    </asp:Panel>
                    <asp:Panel runat="server" Visible="false" ID="productRetailPricePanel">
                        Product Value : <asp:Label runat="server" ID="productValue"></asp:Label><br />
                        Retail Price : <asp:Label runat="server" ID="retailPrice"></asp:Label>
                    </asp:Panel>
                    <div class="product_various_info clearfix">
                        <div class="product_various_info_left" style="display:none">
                            <div class="productdetail_price" style="display: none"><span class="price_label">Product Value: </span> $<asp:Label ID="lblRetailPrice" runat="server" /></div>
                            <div class="productdetail_price"><span class="price_label"><strong>Retail Price: </strong></span> <strong><asp:Label ID="lblSkuPrice" runat="server" /></strong></div>
                            <p class="product_size"><asp:Label runat="server" ID="lblSize"></asp:Label></p>
                        </div>
                        <div class="product_various_info_right">
                            <div>
                                <strong>Quantity:</strong>
                                <asp:DropDownList runat="server" ID="ddlQuantity" CssClass="product_detail_select">
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
                            <asp:ImageButton ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/btn_addtocart.png" CssClass="btn_addtocart" />

                        </div>
                    </div>
                     <div class="productdetail_text_top">
                        <asp:Literal ID="ltDetailDescription" runat="server" />
                    </div>
                   <div class="reviewlink"><span class="reviewlinkoverlay"></span>
<%--<div class="yotpo bottomLine"
  data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
  data-domain="specificbeauty.com"
  data-product-id="<%=skuID.ToString() %>"
  data-product-models="<%=lblSkuTitle.Text %>"
  data-name="<%=lblSkuTitle.Text %>"
  data-url="The url to the page where the product is url escaped"
  data-image-url="<%=imagePath %>"
  data-description="<%=lblSkuTitle.Text %>"
  data-bread-crumbs="Product categories">
</div>--%>
                       <div class="yotpo bottomLine" 
                            data-product-id="<%=skuID.ToString() %>"> 
                       </div>
                   </div>
                    

                </div>
                <div class="clear">
                </div>


                <p class="product_social">
                    <strong>Share it </strong>
                    <a href="https://www.facebook.com/SpecificBeauty" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-fb.png" alt="Follow us on Facebook" /></a>
                    <a href="https://twitter.com/SpecificBeauty" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-tw.png" alt="Follow us on Twitter" /></a>
                    <a href="https://www.instagram.com/specificbeautyskincare/" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-ig.png" alt="Follow us on Instagram" /></a>
                    <a href="https://www.pinterest.com/specificbeauty/" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-pn.png" alt="Follow us on Pinterest" /></a>
                    <a href="mailto:?Subject=Specific Beauty"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/productdetails/icon-email.png" alt="Email a friend" /></a>
                </p>
                
                 <div>
                                     <asp:Literal ID="ltIngredients" runat="server" />
					 </div>
               <%-- <a name="tabs"></a>
                <div class="productdetail_tabs">
                    <ul class="tablinks">
                        <li>
                            <a href="#tab-1" data-tab="tab-1" class="tablink active">Directions</a> 
                        </li>
                        <li>
                            <a href="#tab-2" data-tab="tab-2" class="tablink">Ingredients</a> 
                        </li>
                        <li>
                            <a href="#tab-3" data-tab="tab-3" class="tablink tablink3">Reviews</a> 
                        </li>
                    </ul>
                    <div class="tabcontent">
                        <div class="tab tab-1 tab-directions">
                            <asp:Literal runat="server" ID="ltDirection"></asp:Literal>
                        </div>


                        <div class="tab tab-2 tab-ingredients" style="display: none;">
                            <asp:Literal runat="server" ID="ltIngredients"></asp:Literal>
                        </div>

                        <div class="tab tab-3 tab-reviews" style="display: none;">
                            <div class="yotpo yotpo-main-widget"
                                 data-product-id="<%=skuID.ToString() %>"
                                 data-name="<%=lblSkuTitle.Text %>"
                                 data-url="https://www.specificbeauty.com"
                                 data-image-url="<%=imagePath %>"
                                 data-description="<%=lblSkuTitle.Text %>">
                            </div>
                        </div>
                    </div>
                </div>--%>

            </div>

            
        </div>
    </div>

        


    <!-- end content area -->


    <!-- spacer so bottomcta doesn't cover up content above -->
    <div style="height: 15rem;"></div>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("bottomcta.html")%>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
    <uc:Footer ID="Footer1" runat="server" />
</form>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
    </html>
