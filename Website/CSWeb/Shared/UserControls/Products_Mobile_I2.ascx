﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products_Mobile_I2.ascx.cs" Inherits="CSWeb.UserControls.Products_Mobile_I2" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register Src="MiniCart_M.ascx" TagName="MiniCart" TagPrefix="uc" %>

<asp:Label ID="lblMessage" runat="server" />
<ul class="products_list">
    <h2>Sets</h2>
     <asp:Repeater ID="rptProducts3" runat="server" OnItemDataBound="rptProducts3_ItemDataBound"
        OnItemCommand="rptProducts3_ItemCommand">

        <ItemTemplate>
            <li class="products_item">
                
                    <div class="product_grid_item clearfix">
                        <asp:LinkButton runat="server" CssClass="block" ID="product_anchor" PostBackUrl="/category.aspx">
                            <asp:Image ID="imgProduct" runat="server" CssClass="product_grid_item_img" />
                        </asp:LinkButton>
                        <div class="product_info">
                            <asp:LinkButton runat="server" CssClass="block" ID="product_anchor2" PostBackUrl="/category.aspx">
                                <h3>
                                    <asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                <div class="productinfo productinfo_description">
                                    <asp:Label ID="lblSkuDescription" runat="server" />
                                </div>

                                <div class="productinfo productinfo_size med">
                                    <asp:Label runat="server" ID="lblSize"></asp:Label>
                                </div>
                                <div class="productinfo productinfo_value" style="display: none">
                                    <label class="detail_label">Product Value:</label>
                                    <asp:Label ID="lblRetailPrice" runat="server" />
                                </div>
                                <div class="productinfo productinfo_retail bold">
                                    <label class="detail_label">Retail Price:</label>
                                    <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                </div>
                            </asp:LinkButton>
                            <div class="product_actions">
                            <%-- <div class="yotpo bottomLine"
                                              data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
                                              data-domain="specificbeauty.com"
                                              data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>"
                                              data-product-models="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-name="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-url="The url to the page where the product is url escaped"
                                              data-image-url="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>"
                                              data-description="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-bread-crumbs="Product categories">
                                         </div>	 --%>
                            <%--<div class="yotpo bottomLine"
                                data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                            </div>--%>
                                <div class="yotpowrap">
                                    <div class="yotpo bottomLine"
                                        data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                                    </div>
                                </div>
                            

                                <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                 runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" CssClass="products_add_to_cart" />
                        </div>
                        
                    </div>




                
                
                <%--<img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" class="add_to_cart" />--%>

            </li>
        </ItemTemplate>
    </asp:Repeater>

     <h2>Volumizers</h2>
    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound"
        OnItemCommand="rptProducts_ItemCommand">

        <ItemTemplate>
            <li class="products_item">
                
                    <div class="product_grid_item clearfix">
                        <asp:LinkButton runat="server" CssClass="block" ID="product_anchor" PostBackUrl="/category.aspx">
                            <asp:Image ID="imgProduct" runat="server" CssClass="product_grid_item_img" />
                        </asp:LinkButton>
                        <div class="product_info">
                            <asp:LinkButton runat="server" CssClass="block" ID="product_anchor2" PostBackUrl="/category.aspx">
                                <h3>
                                    <asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                <div class="productinfo productinfo_description">
                                    <asp:Label ID="lblSkuDescription" runat="server" />
                                </div>

                                <div class="productinfo productinfo_size med">
                                    <asp:Label runat="server" ID="lblSize"></asp:Label>
                                </div>
                                <div class="productinfo productinfo_value" style="display: none">
                                    <label class="detail_label">Product Value:</label>
                                    <asp:Label ID="lblRetailPrice" runat="server" />
                                </div>
                                <div class="productinfo productinfo_retail bold">
                                    <label class="detail_label">Retail Price:</label>
                                    <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                </div>
                            </asp:LinkButton>
                            <div class="product_actions">
                            <%-- <div class="yotpo bottomLine"
                                              data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
                                              data-domain="specificbeauty.com"
                                              data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>"
                                              data-product-models="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-name="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-url="The url to the page where the product is url escaped"
                                              data-image-url="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>"
                                              data-description="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-bread-crumbs="Product categories">
                                         </div>	 --%>
                            <%--<div class="yotpo bottomLine"
                                data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                            </div>--%>
                                 <div class="yotpowrap">
                                    <div class="yotpo bottomLine"
                                        data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                                    </div>
                                </div>

                            

                                <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                 runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" CssClass="products_add_to_cart" />
                        </div>
                        
                    </div>




                
                
                <%--<img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" class="add_to_cart" />--%>

            </li>
        </ItemTemplate>
    </asp:Repeater>
     <h2>Brushes</h2>
     <asp:Repeater ID="rptProducts2" runat="server" OnItemDataBound="rptProducts2_ItemDataBound"
        OnItemCommand="rptProducts2_ItemCommand">

        <ItemTemplate>
            <li class="products_item">
                
                    <div class="product_grid_item clearfix">
                        <asp:LinkButton runat="server" CssClass="block" ID="product_anchor" PostBackUrl="/category.aspx">
                            <asp:Image ID="imgProduct" runat="server" CssClass="product_grid_item_img" />
                        </asp:LinkButton>
                        <div class="product_info">
                            <asp:LinkButton runat="server" CssClass="block" ID="product_anchor2" PostBackUrl="/category.aspx">
                                <h3>
                                    <asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                <div class="productinfo productinfo_description">
                                    <asp:Label ID="lblSkuDescription" runat="server" />
                                </div>

                                <div class="productinfo productinfo_size med">
                                    <asp:Label runat="server" ID="lblSize"></asp:Label>
                                </div>
                                <div class="productinfo productinfo_value" style="display: none">
                                    <label class="detail_label">Product Value:</label>
                                    <asp:Label ID="lblRetailPrice" runat="server" />
                                </div>
                                <div class="productinfo productinfo_retail bold">
                                    <label class="detail_label">Retail Price:</label>
                                    <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                </div>
                            </asp:LinkButton>
                            <div class="product_actions">
                            <%-- <div class="yotpo bottomLine"
                                              data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
                                              data-domain="specificbeauty.com"
                                              data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>"
                                              data-product-models="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-name="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-url="The url to the page where the product is url escaped"
                                              data-image-url="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>"
                                              data-description="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                              data-bread-crumbs="Product categories">
                                         </div>	 --%>
                            <%--<div class="yotpo bottomLine"
                                data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                            </div>--%>
                                <div class="yotpo bottomLine yotpo-small" data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>" data-yotpo-element-id="2"> <span class="yotpo-display-wrapper" style="visibility: hidden;">  <div class="standalone-bottomline"> <div class="yotpo-bottomline pull-left  star-clickable">  <span class="yotpo-stars"> <span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span> </span>   <div class="yotpo-clr"></div> </div> <div class="yotpo-clr"></div> </div>   <div class="yotpo-clr"></div> </span></div>
                                 <div class="yotpowrap">
                                    <div class="yotpo bottomLine"
                                        data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                                    </div>
                                </div>
                            

                                <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                 runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" CssClass="products_add_to_cart" />
                        </div>
                        
                    </div>




                
                
                <%--<img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" class="add_to_cart" />--%>

            </li>
        </ItemTemplate>
    </asp:Repeater>
    </ul>
<asp:LinkButton ID="btn1" runat="server" style="visibility: hidden;" /> 
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeMiniCart" TargetControlID="btn1"
                                PopupControlID="pnlMiniCart" PopupDragHandleControlID="pnlMiniCart" />

<asp:Panel ID="pnlMiniCart" runat="server" CssClass="modalPopup">
    <div class="autoship_modal_bg"></div>
    <div class="autoship_modal">
        <div class="autoship_modal_close text-right">
            <p><asp:LinkButton ID="lbCancel" CssClass="btn btn-danger" runat="server" CausesValidation="false" OnClick="lbCancel_OnClick"><img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/xclose.png" alt="Close"></asp:LinkButton></p>
        </div>
        <uc:MiniCart ID="ucMiniCart" runat="server" />
        <div>
            <asp:LinkButton ID="LinkButton2" runat="server" Text="Save" Visible="False" OnClick="btnSaveOrder_Click" CssClass="btn btn-success"><i class="icon-save"></i> Save</asp:LinkButton> 
        </div>
    </div>
   
</asp:Panel>
