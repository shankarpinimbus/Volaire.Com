<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs"
    Inherits="CSWeb.Mobile.ProductDetail_MobileI2" MaintainScrollPositionOnPostback="true" EnableSessionState="True" %>

<%@ Register Src="/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/Shared/UserControls/Header_Mobile.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="/shared/UserControls/Footer_Mobile.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
    <title>Volaire™| Hair Volumizing Products</title>
    <meta charset="utf-8">
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
    <script type="text/javascript">
        (function e() { var e = document.createElement("script"); e.type = "text/javascript", e.async = true, e.src = "//staticw2.yotpo.com/itGFmlqh7twU16FRq19FlRC31nQvBIQab9nDaHuQ/widget.js"; var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(e, t) })();
    </script>
     <script type="text/javascript">

         $(document).ready(function () {
             if (buttonClicked.value == "" || buttonClicked.value == undefined) {
                 $("#bigSizeSelectButton").addClass('btn_on');
                 $("#smallSizeSelectButton").removeClass('btn_on');
             }
             else if (buttonClicked.value == "small") {
                 $("#bigSizeSelectButton").removeClass('btn_on');
                 $("#smallSizeSelectButton").addClass('btn_on');
             }
             else if (buttonClicked.value == "big") {
                 $("#bigSizeSelectButton").addClass('btn_on');
                 $("#smallSizeSelectButton").removeClass('btn_on');
             }
         });

    </script>
</head>
<body class="productpages">

    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server"><ContentTemplate>
        <uc:Header runat="server" />
         <asp:HiddenField id="buttonClicked" runat="server"/>

        <div class="shop_products_detail">


            <div class="productdetail_box clearfix">
                <p class="breadcrumbs">
                    <a href="index">Home</a> &gt; <a href="products.aspx">Shop Products</a> &gt; <span class="caps red">
                        <asp:Label ID="lblSkuTitle" runat="server" /></span>
                </p>
                <!-- left column -->
                <div class="productdetail_text_top">
                    <h1><%=lblSkuTitle.Text %></h1>
                </div>

                <div class="productdetail_img">
                    <asp:Image ID="imgSku" CssClass="main_img" runat="server" />
                </div>
                <!-- smaller product images-->
                <div class="imgcheck clearfix">
                    <asp:Image CssClass="thumbnail" data-thumb="1" ID="smallImage1" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="2" ID="smallImage2" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="3" ID="smallImage3" runat="server" />
                    <asp:Image CssClass="thumbnail" data-thumb="4" ID="smallImage4" runat="server" />

                    <div class="productdetail_social">
                        <div class="yotpo bottomLine product_reviewsnip"
                    data-product-id="<%=GroupId %>">
                        </div>
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

                <!-- right column -->

                <div class="productdetail_text">
                    
                    
                    <asp:Panel runat="server" Visible="false" ID="chooseSizePanel">
                        <p class="webfont2 choosesize">
                            Choose Size: &nbsp; 
                            <asp:Button runat="server" ID="bigSizeSelectButton" OnClick="bigSizeSelectButton_Click" CssClass="btn1 sizebtn" CommandArgument="" />
                        &nbsp&nbsp&nbsp&nbsp<asp:Button runat="server" ID="smallSizeSelectButton" CssClass="btn2 sizebtn" OnClick="smallSizeSelectButton_Click" />
                        </p>
                        
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="kitprices" Visible="false" ID="productRetailPricePanel">
                        Product Value :
                            <span class="strikeout">$<asp:Label runat="server" ID="productValue"></asp:Label></span><br />
                        Retail Price :
                            $<asp:Label runat="server" ID="retailPrice"></asp:Label>
                    </asp:Panel>
                     <asp:Panel runat="server" CssClass="kitprices" Visible="false" ID="pnlKitSelection">
                    <div class="checkboxwrap">
                        <asp:RadioButton runat="server" GroupName="KitSelection" ID="rbOneTime" AutoPostBack="True" OnCheckedChanged="OnCheckedChanged"/>
                        <label for="rbOneTime" class="label_purchase_type"><span class="label_price_txt_1">One Time Purchase: </span> <span class="label_price_txt_2">$39.95</span></label>
                    </div>
                    <div class="checkboxwrap">
                        <asp:RadioButton runat="server" GroupName="KitSelection" ID="rbAuto" Checked="True" AutoPostBack="True" OnCheckedChanged="OnCheckedChanged"/>
                        <label for="rbAuto" class="label_purchase_type"><span class="label_price_txt_1">Auto Delivery: </span> <span class="label_price_txt_2 red">$29.95*</span> <span class="label_price_txt_3 red">(Save an additional 20% + FREE S&H)</span></label>
                    </div>
                </asp:Panel>
               

<div class="productdetail_price" style="display: none;">
    <span class="price_label">Product Value: </span><%--$<asp:Label ID="lblRetailPrice" runat="server" />--%>
</div>
<div class="productdetail_price" style="display: none;">
    <span class="price_label">Retail Value: </span>
    <asp:Label ID="lblSkuPrice" runat="server" />
</div>
<div class="product_various_info_bottom" style="display: none;">
    <p class="product_size">
        <asp:Label runat="server" ID="lblSize"></asp:Label></p>
</div>

                    <div class="product_various_info clearfix">
                        <span class="product_add-price">
                            <span class="product_various_info_add"><asp:LinkButton ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="Add to Bag" CssClass="txtbtn_addtocart" /></span>
                            | <span class="product_various_info_price webfont2"><asp:Label ID="lblRetailPrice" runat="server" /></span>
                        </span>
                        <div class="product_various_info_right">
                            <div class="webfont2 choosesize">
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
                        </div>
                        <asp:Panel runat="server" CssClass="subscription_details" Visible="false" ID="subscriptionDetails">
                        <p>*In approximately 4 weeks, you'll automatically receive a new 90-day supply and then every 3 months thereafter for only $29.95 and $3.33 S&H per month. Cancel anytime.</p>
                    </asp:Panel>
                            
                        <asp:Literal ID="ltDetailDescription" runat="server" />
                    </div>

                </div>
                <div class="clear"></div>


    </div>
</div>



<div class="product_detail_mid">
        <div class="product_detail_mid_content">
            <asp:Literal ID="ltIngredients" runat="server" />
        </div>
</div>




<div class="shop_products_detail">
                <!-- begin tabs -->
<script>
    //hide above section if it has no content
    $(document).ready(function () {
        if (!$.trim($('.product_detail_mid_content').html()).length) {
            $('.product_detail_mid').hide();
        }

        $('img[src=""]').css("display","none");

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

        
<div class="imgcheck" style="display: none;"><%--just preloading images for the rollovers--%>
    <asp:Image ID="bigImage1" runat="server" />
    <asp:Image ID="bigImage2" runat="server" />
    <asp:Image ID="bigImage3" runat="server" />
    <asp:Image ID="bigImage4" runat="server" />
</div>
        <!-- end content area -->
        <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
        <uc:Footer ID="Footer" runat="server" />
        </ContentTemplate></asp:UpdatePanel>
    </form>
    <uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
