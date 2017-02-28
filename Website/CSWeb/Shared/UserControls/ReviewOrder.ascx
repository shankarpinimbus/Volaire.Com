<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewOrder.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.ReviewOrder" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<div class="revieworder_wrap">
<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound"
    OnItemCommand="rptShoppingCart_OnItemCommand">
    <HeaderTemplate>
        <div class="cart_table cart_hdr_row clearfix" style="margin-bottom: 0;">
            <div class="cart_image_hdr">Item</div>
            <div class="cart_text_hdr">Description</div>
            <div class="cart_delete_hdr">Remove</div>
            <div class="cart_qty_hdr">Quantity</div>
            <div class="cart_price_hdr">Price</div>
            <div class="cart_shipping_hdr">S&H</div>
        </div>
        <div class="horizontal_dots hd1">
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="cart_table clearfix">
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
            </div>
            <div class="cart_delete">&nbsp;
                <td runat="server" width="1%" id='holderRemove'>
                    <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                        Visible="" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/wonderflex/images/delete.png" />
                </td>
            </div>
            <div class="cart_qty">
                <asp:HiddenField runat="server" ID="hidSkuId" />
                <asp:TextBox ID="txtQuantity" runat="server" MaxLength="1" Visible="false" />
                <asp:DropDownList ID="ddlQty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged1">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
                <asp:Label runat="server" ID="lblQuantity" CssClass="cart_select">
                </asp:Label>
            </div>
            <div class="cart_price">
                <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
            </div>
            <div class="cart_shipping">
                $<asp:Label runat="server" ID="lblShippingPrice"></asp:Label>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Panel ID="pnlTotal" runat="server">
    <asp:PlaceHolder runat="server" ID="holderTaxAndShipping">
        <div class="horizontal_dots">
        </div>
        <div class="cart_totals clearfix">
            <div class="cart_totals_left">
                <asp:Literal runat="server" ID='lblSubtotal'></asp:Literal><br />
               <%-- Process & Handling<br />
                Tax<br />--%>
                
            </div>
            <div class="cart_totals_right">
                <asp:Literal runat="server" ID="lblShipping"></asp:Literal><br />
                
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
            <div class="clear"></div>
        <div class="horizontal_dots">
        </div>
            <div class="cart_totals clearfix">
                <div class="cart_totals_left">Tax:<br />
                    <strong>Total:</strong>
                </div>
                <div class="cart_totals_right">
                    <asp:Literal runat="server" ID="lblTax"></asp:Literal><br />
                    <strong><asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal></strong></div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Panel>

    <div class="btn_revieworder">
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/wonderflex/images/btn_completeorder.png" CssClass="iblock btn_shadow1" OnClientClick="MM_showHideLayers('mask', '', 'show');submitClicked();" OnClick="imgBtn_OnClick" />
    </div>
</div>