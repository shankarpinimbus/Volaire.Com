<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.ShoppingCartControl" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>

<h1 class="shopping-cart-hdr orange">Your Shopping Cart</h1>

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
                            <td runat="server" width="1%" id='holderRemove' visible="false">
                                <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                                    Visible="" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/remove.png" />
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
            &nbsp;
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
    <asp:PlaceHolder runat="server" ID="holderTaxAndShipping">
        <div class="cart_totals clearfix">
            <div class="cart-promo-code-txt">**Promo Code Applied</div>
            <div class="cart_totals_left caps med">
                Subtotal:<br />
                Tax:<br />
                S&H:<br />
                <div style="height: .8rem"></div>
                 <strong class="magenta">Total:</strong>
            </div>
            <div class="cart_totals_right">
                <strong><asp:Literal runat="server" ID='lblSubtotal'></asp:Literal></strong><br />
                <strong><asp:Literal runat="server" ID="lblTax"></asp:Literal></strong><br />
                <strong><asp:Literal runat="server" ID="lblShipping"></asp:Literal></strong><br />
                <div style="height: .8rem"></div>
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
        
        <% if (versionName.ToLower().EndsWith("b2") ) %>
    <% { %>
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile_b2/cart-promo-code.png" class="block" />
    <% } else  { %>
                <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/mobile/cart-promo-code.png" class="block" />
    <% } %>

            <div class="cart-hr"></div>
    </asp:PlaceHolder>
</asp:Panel>
<asp:Literal ID="ltOfferDetail" runat="server" Visible="false"></asp:Literal>
<asp:Literal ID="ltPhoneNum" runat="server" Visible="False"></asp:Literal>