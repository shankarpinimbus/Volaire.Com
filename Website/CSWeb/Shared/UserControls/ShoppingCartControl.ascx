<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs"
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

<div><img src="//d39hwjxo88pg52.cloudfront.net/citrinex/images/cart_cta2.jpg" alt="" class="block" />
</div>

<div class="cart_offer hiddenm">
    <asp:Literal runat="server" ID="ltOfferDetail"></asp:Literal>
    <p>
        <strong>CANCELLATION POLICY:</strong><br />
        You can cancel at any time by calling customer service toll-free at <strong class="bigphone iblock"><%--<%=ltPhoneNum.Text %>--%>1-888-263-3991</strong>. Every Citrinex purchase includes a 30-day money-back guarantee of the purchase price less shipping and handling. <strong>If you call to cancel your membership in the preferred customer program, the cancellation will be effective immediately and no future shipments will be sent. For any product returned under our 100% Satisfaction Guarantee, you will receive a refund of your purchase price less shipping and handling.</strong> To customize this program or future shipments and charges, call customer service anytime at <strong class="bigphone iblock"><%--<%=ltPhoneNum.Text %>--%>1-888-263-3991</strong>.<br />
        
    </p>
    <p>Taxable States: AZ, CA, CT, MI, NY, NC, SC, TX, VA, WA, and All Canadian Provinces</p>
    <p>
        <strong class="caps">Your Satisfaction is our Guarantee</strong><br />
        100% Satisfaction Guarantee - We want you to be completely satisfied with every product that you purchase from New Vitality. Every purchase comes with a 30-day money back guarantee beginning on the date you receive each shipment. You may use any New Vitality product for 30-days absolutely risk free and if you do not see or feel the results that you expected, you can return it within 30-days and you'll receive a prompt and complete refund of your purchase price less shipping and handling. If you have purchased more than one bottle of any single product and you wish to return your purchase, return the opened bottle along with any sealed bottles within 30 days beginning on the date of delivery to you and you'll receive a prompt and complete refund of your purchase price less shipping and handling. No questions or explanation required... your complete satisfaction is guaranteed. Period!
    </p>
</div>
<asp:Literal ID="ltPhoneNum" runat="server" Visible="False"></asp:Literal>