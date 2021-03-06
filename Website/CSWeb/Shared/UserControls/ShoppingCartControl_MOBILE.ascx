﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.ShoppingCartControl" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>

<% if ( versionName.ToLower().EndsWith("i2")  || versionName.ToLower().EndsWith("j2")
        || versionName.ToLower().EndsWith("k2")) %>
    <% { %>
                <h1 class="shopping-cart-hdr orange"><a href="products" class="orange unscored">Continue Shopping</a></h1>
   
    <% } else  { %>
                <h1 class="shopping-cart-hdr orange">Your Shopping Cart</h1>
    <% } %>



<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound" OnItemCommand="rptShoppingCart_OnItemCommand">
    <HeaderTemplate>
        <div class="cart_table cart_hdrs clearfix">
            <div class="cart_image_txt_hdr">Product Description</div>
            <div class="cart_qty_hdr">Quantity</div>
            <%--<div class="cart_price1_hdr">Price</div>--%>
            <div class="cart_price2_hdr">Total</div>
        </div>
        <div class="horizontal_dots2">
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="cart_table table clearfix">
            <div class="trow">
                <div class="tcell cart_skudetails">
                    <div class="cart_image">
                        <asp:Image runat="server" ID="imgProduct" />
                    </div>
                    <div class="cart_text">
                        <div class="basket_title">
                            <asp:Label runat="server" ID="lblSkuCode"></asp:Label>
                        </div>
                        <div class="basket_description">
                            <asp:Label runat="server" ID='lblSkuDescription'></asp:Label>
                        </div>

                        
                        <div class="cart_remove">
                            <td runat="server" width="1%" id='holderRemove' visible="true">
                                <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                                    Visible="true" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/remove.png" />
                            </td>
                        </div>
                    </div>
                </div>
                
                <div class="tcell cart_qty" runat="server" visible="true">
                    <div>
                        <asp:TextBox runat="server" ID="txtQuantity" Font-Size="8pt" Text='1' Visible="False" MaxLength="3"
                            Columns="2" OnTextChanged="OnTextChanged_Changed"></asp:TextBox>
                        <asp:Label runat="server" ID="lblQuantity" CssClass="cart_select">
                        </asp:Label>
                    </div>

                    <asp:HiddenField runat="server" ID="hidSkuId" />
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="1" Visible="false" />
                    <asp:DropDownList ID="ddlQty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged1">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="tcell cart_unitprice" runat="server" visible="false">
                    <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
                </div>
                    
                <div class="tcell cart_totalprice">
                    <asp:Label runat="server" ID="lblTotalPrice"></asp:Label>
                </div>

            </div>
            
        </div>
    </ItemTemplate>
</asp:Repeater>
<div class="cart_table table clearfix" runat="server" id="dfreeGift">
    <div class="trow">
        <div class="tcell cart_skudetails">
            <div class="cart_image">
                <img class="img block" src="<%=ltImagePath.Text %>" />
            </div>
            <div class="cart_text">
                <div class="basket_description">
                    <%=ltImageDescription.Text %>
                </div>
            </div>
            <div class="cart_remove">
	        &nbsp;
            </div>
                    
        </div>

        <div class="tcell cart_qty">
            &nbsp;<asp:Literal runat="server" ID="ltQty" ></asp:Literal>
        </div>
        <%--<div class="tcell cart_unitprice">
            FREE
        </div>--%>
                    
        <div class="tcell cart_totalprice">
            FREE
        </div>
    </div>
</div>
<asp:Literal runat="server" id="ltImagePath" Visible="False"></asp:Literal>
<asp:Literal runat="server" id="ltImageDescription" Visible="False"></asp:Literal>

<asp:Panel ID="pnlTotal" runat="server">
     <asp:PlaceHolder runat="server" ID="pnlDiscount" Visible="false">
                <div class="form_line clearfix">
                    <span>
                        <asp:Label ID="lblCouponMsg" ForeColor="Red" runat="server" Visible="false" Text="<br /><br />Your Shopping Cart is currently empty <br /><br />"></asp:Label></span>
                    <asp:Panel ID="pnlDiscountApply" runat="server" DefaultButton="btnDisount">
                        <div class="shopping_top_totals_shipdrop" id="Shopping_Discount_Div" runat="server">
                            <asp:TextBox runat="server" ID="txtPromotion" serverMaxLength="20" CssClass="input-1b"
                                ValidationGroup="vgPromotion" placeholder="Enter Promo Code" />
                            <asp:LinkButton ID="btnDisount" runat="server" OnClick="btnPromitionCode_OnCommand"
                                ValidationGroup="vgPromotion" CssClass="addcoupon_btn">Apply</asp:LinkButton>

                        </div>
                        <p class="shopmore"><a href="Products" class="btn_continueshopping">Continue Shopping</a></p>
                    </asp:Panel>
                    
                    <asp:Panel runat="server" ID="pnlDiscountCode" DefaultButton="btnRemoveDiscount" Visible="False">
                    </asp:Panel>
                </div>
                    
                </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="holderTaxAndShipping">
        <div class="horizontal_dots" runat="server" id="horizon_dots" style="display: none;">
        </div>
        <div class="cart_totals clearfix">
            <div class="cart-promo-code-txt" runat="server" id="hPromoCode">**Promo Code Applied</div>
            <div class="cart_totals_left caps med">
                Subtotal:<br />
                Tax:<br />
                S&H:<br />
                <div style="height: .8rem"></div>
                <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                    Discount:<br />
                </asp:Panel>
                 <strong class="magenta">Total:</strong>
            </div>
            <div class="cart_totals_right">
                <strong><asp:Literal runat="server" ID='lblSubtotal'></asp:Literal></strong><br />
                <strong><asp:Literal runat="server" ID="lblTax"></asp:Literal></strong><br />
                <strong><asp:Literal runat="server" ID="lblShipping"></asp:Literal></strong><br />
                <div style="height: .8rem"></div>
                <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                    <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                </asp:Panel>
                <strong><asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal></strong>
                <asp:Literal runat="server" ID="lblRushShipping" Visible="false"></asp:Literal>
                <table>
                    <tr id='holderRushShippingTotal' runat="server">
                        <td class='cartSubtotalTitle' align="right" colspan="3">Rush Shipping:
                        </td>
                        <td class='cartSubtotalValue' align="center"></td>
                    </tr>
                    <tr id='holderRushShipping' runat="server" visible="false">
                        <td colspan="4" class="rushShipping">
                            <asp:CheckBox runat="server" ID="chkIncludeRushShipping" OnCheckedChanged="chkIncludeRushShipping_OnCheckedChanged"
                                AutoPostBack="true" Text="Rush Shipping" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Panel runat="server" ID="imgOffer">
        <% if (versionName.ToLower().EndsWith("b2") || versionName.ToLower().EndsWith("b3") || versionName.ToLower().EndsWith("b4")) %>
        <% { %>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_b2/cart-promo-code.png" class="block" />
        <% }
           else if (versionName.ToLower().EndsWith("e2") || versionName.ToLower().EndsWith("g2") || versionName.ToLower().EndsWith("h2") || versionName.ToLower().EndsWith("i2") || versionName.ToLower().EndsWith("j2") || versionName.ToLower().EndsWith("get_mobile_a1") || versionName.ToLower().EndsWith("get_mobile_aa1") )
        { %>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_e2/cart-promo-code.png" class="block" />
        <% }
        else if (versionName.ToLower().EndsWith("k2") )
        { %>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_k2/cart-promo-code_40percent-instant-savings_m.png" class="block" />
        <% } else  { %>
            <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/cart-promo-code.png" class="block" />
        <% } %>
            </asp:Panel>
            <div class="cart-hr"></div>
    </asp:PlaceHolder>
</asp:Panel>
<asp:Literal ID="ltOfferDetail" runat="server" Visible="false"></asp:Literal>
<asp:Literal ID="ltPhoneNum" runat="server" Visible="False"></asp:Literal>