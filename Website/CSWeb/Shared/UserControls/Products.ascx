<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products.ascx.cs" Inherits="CSWeb.Store.UserControls.Products" %>

<div class="container3 all_products">
    <div class="row">
        <asp:Label ID="lblMessage" runat="server" />
        <ul class="products_list">
            <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound"
                OnItemCommand="rptProducts_ItemCommand">
                <ItemTemplate>
                    <li class="col span4 spanm6 <%# GetItemClass() %>">
                        <asp:LinkButton runat="server" ID="product_anchor" PostBackUrl="/category.aspx">


                            <div class="product_grid_item">
                                <asp:Image ID="imgProduct" CssClass="products_grid_img" runat="server" />
                                <div class="product_info_wrap">
                                    <div class="product_info">
                                    <h3>
                                        <asp:Label ID="lblSkuTitle" runat="server" /></h3>
                                    <div class="productinfo productinfo_description">
                                        <asp:Label ID="lblSkuDescription" runat="server" />
                                    </div>

                                    <div class="productinfo productinfo_size">
                                        <asp:Label runat="server" ID="lblSize"></asp:Label>
                                    </div>
                                    <div class="productinfo <%--productinfo_value --%>productinfo_retail">
                                        <label class="detail_label">Retail Value:</label>
                                        <asp:Label ID="lblSkuInitialPrice" runat="server" />
                                    </div>
                                    <div class="productinfo productinfo_retail" style="display: none">
                                        <label class="detail_label">Retail Price:</label>
                                        <asp:Label ID="lblRetailPrice" runat="server" />
                                    </div>
                                </div>
                                <div class="product_actions">
                                    <%--<div class="yotpo bottomLine"
                                               data-appkey="q7aSfVYvWU7lRAFGbTPY2DwzuBBm72cg1baI71Yt"
                                               data-domain="specificbeauty.com"
                                               data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>"
                                               data-product-models="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                               data-name="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                               data-url="The url to the page where the product is url escaped"
                                               data-image-url="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>"
                                               data-description="<%# DataBinder.Eval(Container.DataItem, "Title")%>"
                                               data-bread-crumbs="Product categories">
                                          </div>--%>
                                    <%--<div class="yotpo bottomLine"
                                        data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>">
                                    </div>--%>
                                    <div class="yotpo bottomLine yotpo-small" data-product-id="<%# DataBinder.Eval(Container.DataItem, "SkuId")%>" data-yotpo-element-id="2"> <span class="yotpo-display-wrapper" style="visibility: hidden;">  <div class="standalone-bottomline"> <div class="yotpo-bottomline pull-left  star-clickable">  <span class="yotpo-stars"> <span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span><span class="yotpo-icon yotpo-icon-empty-star pull-left"></span> </span>   <div class="yotpo-clr"></div> </div> <div class="yotpo-clr"></div> </div>   <div class="yotpo-clr"></div> </span></div>

                                    


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



                            <%--</div>--%><!-- //col -->

                        </asp:LinkButton>
                        <div class="products_addtocart"><asp:ImageButton ID="btnViewProduct" CommandName="ViewProduct" CommandArgument="details"
                                                                         runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/allproducts_addtocart.png" CssClass="add_to_cart" />
                            <%--<img src="" class="add_to_cart" />--%>
                        </div>
                    </li>
                </ItemTemplate>

            </asp:Repeater>
        </ul>
    </div>
    <!-- //row -->
</div>
<!-- //container3 -->
