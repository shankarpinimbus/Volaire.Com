<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MiniCart.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.MiniCart" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<div id="MinCrt" class="minicart" style="" runat="server" visible="false">
    <p><%=itemCount %> item added to your cart.</p>
<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound" OnItemCommand="rptShoppingCart_OnItemCommand">
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
                    </div>
                    <div class="cart_remove">
                        <td runat="server" width="1%" id='holderRemove' visible="true">
                            <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                                Visible="true" CssClass="ucRemoveButtonOverlay" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/remove.png" />
                        </td>
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
                <div class="tcell cart_unitprice">
                    <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
                </div>
                    
                <div class="tcell cart_totalprice">
                    <asp:Label runat="server" ID="lblTotalPrice"></asp:Label>
                </div>

            </div>
            
        </div>
        <div class="horizontal_dots" style="margin-bottom: 0;"></div>
    </ItemTemplate>
</asp:Repeater>
    <a href="cart.aspx">CheckOut</a>
    <p runat="server" id="pShipping"> <%=remainingAmount.ToString("n2") %> remaining for Free Shipping.</p>
    <p runat="server" id="pFreeShipping" Visible="False"> FREE SHIPPING You now qualify for free shipping.</p>
    </div>
