﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs"
    Inherits="CSWeb.ProductDetail"  MaintainScrollPositionOnPostback="true" EnableSessionState="True" %>
<%@ Register Src="/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <title>Volaire™| Hair Volumizing Products</title>
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
    <script type="text/javascript">
        
        //this was moved to pageLoad function in global.js

    </script>
</head>
<body>

<form runat="server">
<uc:Header runat="server" />
    <asp:HiddenField id="buttonClicked" runat="server"/>
<div id="page_products">
    <div class="container product_detail_top clearfix">
        <div style="display: none;">
            <asp:Label ID="lblSkuDescription" runat="server" /></div>
        <div class="productdetail_box clearfix">
            <p class="breadcrumbs"><a href="index">Home</a> &gt; <a href="products.aspx">Shop Products</a> &gt; <span class="brown">
                <asp:Label ID="lblSkuTitle" runat="server" /></span></p>

            <div class="productdetail_img">
                <asp:Image ID="imgSku" CssClass="main_img" runat="server" />
                <div>
                    <asp:Image CssClass="thumbnail" data-thumb="1" ID="smallImage1" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="2" ID="smallImage2" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="3" ID="smallImage3" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="4" ID="smallImage4" runat="server" />


                    

                    <div class="productdetail_social">
                        <script>
                            $(document).ready(function () {
                                var thispage = window.location.href;
                                thispage = encodeURIComponent(thispage);
                                var fblink = "https://www.facebook.com/sharer/sharer.php?u=";
                                $('.social_link_fb').attr("href", fblink + thispage);
                                var pn_attr2 = $('.main_img').attr("src");
                                pn_attr2 = "http://" + pn_attr2;
                                pn_attr2 = encodeURIComponent(pn_attr2);
                                var pn_link = "https://pinterest.com/pin/create/button/?url=" + thispage + "&media=" + pn_attr2;
                                $('.social_link_pn').hover(function () {
                                    pn_attr2 = $('.main_img').attr("src");
                                    pn_attr2 = "http://" + pn_attr2;
                                    pn_attr2 = encodeURIComponent(pn_attr2);
                                    pn_link = "https://pinterest.com/pin/create/button/?url=" + thispage + "&media=" + pn_attr2;
                                    $('.social_link_pn').attr("href", pn_link);
                                });
                                $('.social_link_pn').attr("href", pn_link);
                            });
                        </script>
                        <a href="https://www.facebook.com/VolaireHair/" class="iblock social_link_fb" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-Facebook.png" alt="VOLAIRE Facebook page. Volumizing products that let you achieve instant volume no matter what hair type you have."></a> 
                        <a href="https://www.instagram.com/volairehair/" class="iblock social_link_ig" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-Instagram.png" alt="VOLAIRE Instagram page.Get instantaneous volume, just by using VOLAIRE. Best hair care system for lasting, instant volume."></a> 
                        <a href="https://www.pinterest.com/volairehair/" class="iblock social_link_pn" target="_blank"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-Pinterest.png" alt="VOLAIRE Pinterest page: VOLAIRE gives you thicker, fuller looking hair and volume instantly with our hair care products."></a> 
                    </div>
                </div>



                
            </div>
                <!-- smaller product images-->
                
            <div class="productdetail_text">
                <div class="productdetail_text_top">
                    <h1><%=lblSkuTitle.Text %></h1>
                </div>
                <div class="yotpo bottomLine product_reviewsnip"
                    data-product-id="<%=GroupId %>">
                </div>
                <asp:Panel runat="server" Visible="false" ID="chooseSizePanel">
                    <p class="webfont2 choosesize">
                        <span style="font-size: 1.125rem;">Choose Size:</span> &nbsp;&nbsp; 
                        <asp:Button runat="server" ID="bigSizeSelectButton" CssClass="btn1 sizebtn" OnClick="bigSizeSelectButton_Click" CommandArgument="" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="smallSizeSelectButton" CssClass="btn2 sizebtn" OnClick="smallSizeSelectButton_Click" />
                    </p>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="kitprices" Visible="false" ID="productRetailPricePanel">
                    <span class="price_title">Product Value: </span>
                    <span class="strikeout">$<asp:Label runat="server" ID="productValue"></asp:Label></span><br />
                    <span class="price_title">Retail Price: </span>
                    $<asp:Label runat="server" ID="retailPrice"></asp:Label>
                </asp:Panel>
                <div class="product_various_info clearfix">
                    <span class="product_add-price">
                        <span class="product_various_info_add"><asp:LinkButton ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="Add to Bag" CssClass="txtbtn_addtocart" /></span>
                        | <span class="product_various_info_price webfont2">$<asp:Label ID="lblRetailPrice" runat="server" /></span>
                    </span>
                    <div class="product_various_info_right">
                        <div class="webfont2 choosesize">
                            Quantity: &nbsp; &nbsp;
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
                        
                    </div>




<div class="product_various_info_left" style="display: none">
    <div class="productdetail_price" style="display: none"><span class="price_label">Product Value: </span><%--$<asp:Label ID="lblRetailPrice" runat="server" />--%></div>
    <div class="productdetail_price"><span class="price_label"><strong>Retail Price: </strong></span><strong>
        <asp:Label ID="lblSkuPrice" runat="server" /></strong></div>
    <p class="product_size">
        <asp:Label runat="server" ID="lblSize"></asp:Label></p>
</div>

                    
                </div>
                <div class="productdetail_text_top">
                    <asp:Literal ID="ltDetailDescription" runat="server" />
                </div>
            </div>


        </div>
    </div>



    <div class="product_detail_mid">
        <div class="container">
            <div class="product_detail_mid_content">
                <asp:Literal ID="ltIngredients" runat="server" />
            </div>
        </div>
    </div>

<script>
    //hide above section if it has no content
    $(document).ready(function() {
        if (!$.trim($('.product_detail_mid_content').html()).length) {
            $('.product_detail_mid').hide();
        }
    });
</script>
            
        <div class="container product_reviews">
            <div class="reviewlink">
                <span class="reviewlinkoverlay"></span>
                <a name="tabs"></a>
                <div class="productdetail_tabs">

                    <div class="tabcontent">

                        <div class="tab tab-3 tab-reviews">
                            <div class="yotpo yotpo-main-widget"
                                data-product-id="<%=GroupId%>"
                                data-name="<%=lblSkuTitle.Text %>"
                                data-url="https://www.volaire.com/"
                                data-image-url="<%=imagePath %>"
                                data-description="<%=lblSkuTitle.Text %>">
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div> 
        


            
</div>



<div style="display: none;"><%--just preloading images for the rollovers--%>
    <asp:Image ID="bigImage1" runat="server" />
    <asp:Image ID="bigImage2" runat="server" />
    <asp:Image ID="bigImage3" runat="server" />
    <asp:Image ID="bigImage4" runat="server" />
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
