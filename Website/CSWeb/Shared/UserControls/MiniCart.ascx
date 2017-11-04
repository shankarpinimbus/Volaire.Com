<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MiniCart.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.MiniCart" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<div id="MinCrt" class="minicart" style="" runat="server" visible="false">
    <a href="#" class="close_minicart">X</a>
    <p class="text-left webfont2 brown pad6 intro"><%=itemCount %> Item(s) Added to Your Shopping Bag.</p>
    <div class="horizontal_dots" style="margin-top: 0;"></div>
<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound" OnItemCommand="rptShoppingCart_OnItemCommand">
   <ItemTemplate>
        <div class="cart_table table clearfix">
            <div class="trow">
                <div class="tcell">
                    <div class="cart_image">
                        <asp:Image runat="server" ID="imgProduct" />
                    </div>
                    <div class="cart_text">
                        <div class="basket_title">
                            <asp:Label runat="server" ID="lblSkuCode"></asp:Label>
                        </div>
                        <div class="basket_description">
                            <asp:Label runat="server" ID='lblSkuDescription'></asp:Label>

                            <p class="minicart_price pad0">
                                <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="cart_remove" style="display: none;">
                        <td runat="server" width="1%" id='holderRemove' visible="true">
                            <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                                Visible="true" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/remove.png" />
                        </td>
                    </div>
                </div>
                
                <div class="tcell cart_qty" runat="server" visible="false">
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
                    
                <div class="tcell cart_totalprice" style="display: none;">
                    Retail Price <asp:Label runat="server" ID="lblTotalPrice"></asp:Label>
                </div>

            </div>
            
        </div>
        <div class="horizontal_dots"></div>
    </ItemTemplate>
</asp:Repeater>
    <p class="webfont2 text-right pad12" style="font-size: 1.125rem; color: #8c7359;">Shopping Bag Total: </p>
    <p class="text-right"><a href="cart.aspx"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_checkout.png" alt="Check Out Now" /></a></p>
    <div class="minicart_shipping_text text-center">
        <p class="p1 pad0"><span class="med caps block">FREE SHIPPING</span></p>
        <p class="pad0" runat="server" id="pShipping"><%=remainingAmount %> remaining for Free Shipping.</p>
        <p class="pad6" runat="server" id="pFreeShipping" Visible="False">You now qualify for free shipping.</p>
    </div>
    
    </div>
