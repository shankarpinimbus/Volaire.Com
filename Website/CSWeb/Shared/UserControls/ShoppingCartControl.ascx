﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.ShoppingCartControl" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>

<h1 class="pagetitle">Shopping Cart</h1>

<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound" OnItemCommand="rptShoppingCart_OnItemCommand">
    <HeaderTemplate>
        <div class="cart_table clearfix">
            <%--<div class="cart_image cart_hdrs">Item</div>
            <div class="cart_txt">&nbsp;</div>
            <div class="cart_select">Quantity</div>
            <div class="cart_price cart_hdrs">Payment</div>--%>
        </div>
        <div class="horizontal_dots">
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="cart_table clearfix">
            <div class="cart_image">
                <asp:Image runat="server" ID="imgProduct" />
            </div>
            <div class="cart_txt">
                <div class="basket_title">
                    <asp:Label runat="server" ID="lblSkuCode"></asp:Label>
                </div>
                <div class="basket_description">
                    <asp:Label runat="server" ID='lblSkuDescription'></asp:Label>
                </div>
            </div>
            <div class="cart_price" runat="server" visible="false">

                <asp:TextBox runat="server" ID="txtQuantity" Font-Size="8pt" Text='1' MaxLength="3"
                    Columns="2" OnTextChanged="OnTextChanged_Changed"></asp:TextBox>
                <asp:Label runat="server" ID="lblQuantity" CssClass="cart_select">
                </asp:Label>
            </div>
            <div class="cart_price">
                <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
                <td runat="server" width="1%" id='holderRemove' visible="false">
                    <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                        Visible="" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/images/delete.gif" />
                </td>
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
                Subtotal:<br />
                Shipping & Handling:<br />
                Estimated Tax:<br />
                Total:
            </div>
            <div class="cart_totals_right">
                <asp:Literal runat="server" ID='lblSubtotal'></asp:Literal><br />
                <asp:Literal runat="server" ID="lblShipping"></asp:Literal><br />
                <asp:Literal runat="server" ID="lblTax"></asp:Literal><br />
                <asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal>
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
    </asp:PlaceHolder>
</asp:Panel>
<asp:Literal ID="ltOfferDetail" runat="server" Visible="False"></asp:Literal>
<asp:Literal ID="ltPhoneNum" runat="server" Visible="False"></asp:Literal>