<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products_I2.ascx.cs" Inherits="CSWeb.Store.UserControls.Products_I2" %>

<div class="container3 all_products">
    <div class="row">
        <asp:Label ID="lblMessage" runat="server" />
        
        <h2 class="products_hdr">Sets</h2>
        <ul class="products_list clearfix">
            <asp:Repeater ID="rptProducts3" runat="server" OnItemDataBound="rptProducts3_ItemDataBound"
                          OnItemCommand="rptProducts3_ItemCommand">
                <ItemTemplate>
                    <li class="row_kits">
                        <asp:LinkButton runat="server" ID="product_anchor3a" PostBackUrl="/category.aspx">
                            <div class="product_grid_item">
                                <div class="products_img">
                                    <asp:Image ID="imgProduct" CssClass="products_grid_img" runat="server" />
                                    <%--<div class="productimginfo productinfo_description">--%>
                                    <asp:Label ID="lblSkuDescription" runat="server" Visible="false" />
                                    <%--</div>--%>
                                </div>
                                <div class="product_info_wrap clearfix">
                                    <div class="product_info_left">
                                        <h3><asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                    </div>
                                    <div class="product_info_right">
                                        <div class="productinfo <%--productinfo_value --%>productinfo_retail">
                                            <label class="detail_label">Retail Price:</label>
                                            <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                        </div>
                                    </div>
                                    
                                    <div class="productinfo productinfo_size" style="display: none;">
                                        <asp:Label runat="server" ID="lblSize"></asp:Label>
                                    </div>
                                    <div class="productinfo productinfo_retail" style="display: none">
                                        <label class="detail_label">Retail Price:</label>
                                        <asp:Label ID="lblRetailPrice" runat="server" />
                                    </div>
                                    <div class="product_actions">
                                        <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                            <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </asp:LinkButton>
                        <div class="product_grid_item_bottom clearfix">
                            <div class="product_grid_item_bottom_left">
                                <asp:LinkButton runat="server" ID="product_anchor3b" PostBackUrl="/category.aspx">
                                    <div class="product_grid_item_review">
                                          <div class="yotpowrap">
                                              <div class="yotpo bottomLine"
                                                data-product-id="<%# GetAttributeValue(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SkuId")),"groupid_review")%>">
                                              </div>
                                          </div>
                                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="product_grid_item_bottom_right">
                                <div class="products_addtocart">
                                    <asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/btn_addtobag.png" CssClass="add_to_cart" />

                                </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>

            </asp:Repeater>
        </ul>
            <h2 class="products_hdr">Volumizers</h2>
            <ul class="products_list clearfix">
            <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound"
                OnItemCommand="rptProducts_ItemCommand">
                <ItemTemplate>
                    <li class="">
                        <asp:LinkButton runat="server" ID="product_anchor1a" PostBackUrl="/category.aspx">
                            <div class="product_grid_item">
                                <div class="products_img">
                                    <asp:Image ID="imgProduct" CssClass="products_grid_img" runat="server" />
                                    <div class="productimginfo productinfo_description">
                                        <asp:Label ID="lblSkuDescription" runat="server" />
                                    </div>
                                </div>
                                <div class="product_info_wrap clearfix">
                                    <div class="product_info_left">
                                        <h3><asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                    </div>
                                    <div class="product_info_right">
                                        <div class="productinfo <%--productinfo_value --%>productinfo_retail">
                                            <label class="detail_label">Retail Price:</label>
                                            <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                        </div>
                                    </div>
                                    
                                    <div class="productinfo productinfo_size" style="display: none;">
                                        <asp:Label runat="server" ID="lblSize"></asp:Label>
                                    </div>
                                    <div class="productinfo productinfo_retail" style="display: none">
                                        <label class="detail_label">Retail Price:</label>
                                        <asp:Label ID="lblRetailPrice" runat="server" />
                                    </div>
                                    <div class="product_actions">
                                        <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                            <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </asp:LinkButton>
                        <div class="product_grid_item_bottom clearfix">
                            <asp:LinkButton runat="server" ID="product_anchor1b" PostBackUrl="/category.aspx">
                            <div class="product_grid_item_bottom_left">
                                <div class="product_grid_item_review">
                                    <div class="yotpowrap">
                                        <div class="yotpo bottomLine"
                                        data-product-id="<%# GetAttributeValue(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SkuId")),"groupid_review")%>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product_grid_item_bottom_right">
                                <div class="products_addtocart">
                                    <span class="btn_learnmore"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/btn_learnmore.png" alt="Learn More" class="add_to_cart" /></span>
                                    <span style="display: none;"><asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                    runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/btn_addtobag.png" CssClass="add_to_cart" /></span>
                                </div>
                            </div>
                            </asp:LinkButton>
                        </div>
                    </li>
                </ItemTemplate>

            </asp:Repeater>
            </ul>



            <h2 class="products_hdr">Brushes</h2>
            <ul class="products_list clearfix">
             <asp:Repeater ID="rptProducts2" runat="server" OnItemDataBound="rptProducts2_ItemDataBound"
                OnItemCommand="rptProducts2_ItemCommand">
                <ItemTemplate>
                    <li class="row_brushes">
                        <asp:LinkButton runat="server" ID="product_anchor2a" PostBackUrl="/category.aspx">
                            <div class="product_grid_item">
                                <div class="products_img">
                                    <asp:Image ID="imgProduct" CssClass="products_grid_img" runat="server" />
                                    <div class="productimginfo productinfo_description">
                                        <asp:Label ID="lblSkuDescription" runat="server" />
                                    </div>
                                </div>
                                <div class="product_info_wrap clearfix">
                                    <div class="product_info_left">
                                        <h3><asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                    </div>
                                    <div class="product_info_right">
                                        <div class="productinfo <%--productinfo_value --%>productinfo_retail">
                                            <label class="detail_label">Retail Price:</label>
                                            <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                        </div>
                                    </div>
                                    
                                    <div class="productinfo productinfo_size" style="display: none;">
                                        <asp:Label runat="server" ID="lblSize"></asp:Label>
                                    </div>
                                    <div class="productinfo productinfo_retail" style="display: none">
                                        <label class="detail_label">Retail Price:</label>
                                        <asp:Label ID="lblRetailPrice" runat="server" />
                                    </div>
                                    <div class="product_actions">
                                        <asp:DropDownList runat="server" ID="ddlQuantity" Visible="False">
                                            <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </asp:LinkButton>
                        <asp:Literal runat="server" ID="ltGroupID" Visible="False"></asp:Literal>
                        <div class="product_grid_item_bottom clearfix">
                            <div class="product_grid_item_bottom_left">
                                <asp:LinkButton runat="server" ID="product_anchor2b" PostBackUrl="/category.aspx">
                                   <div class="product_grid_item_review">
                                        <div class="yotpowrap">
                                            <div class="yotpo bottomLine"
                                            data-product-id="<%# GetAttributeValue(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SkuId")),"groupid_review")%>">
                                            </div>
                                        </div>
                                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="product_grid_item_bottom_right">
                                <div class="products_addtocart">
                                    <span class="btn_learnmore"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/btn_learnmore.png" alt="Learn More" class="add_to_cart" /></span>
                                    <span style="display: none;"><asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                    runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/products/btn_addtobag.png" CssClass="add_to_cart" /></span>
                                </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>

            </asp:Repeater>
            </ul>


            

    </div>
    <!-- //row -->
</div>
<!-- //container3 -->
