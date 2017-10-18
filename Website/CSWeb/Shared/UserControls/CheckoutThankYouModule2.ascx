<%@Control Language="C#" Inherits="CSWeb.Mobile.UserControls.CheckoutThankYouModule2" %>

<div class="receipt-top">
    <h1 class="orange">Your order has been submitted!</h1>
       
    <p class="pad6"><strong>GET READY FOR VA-VA VOLUME!</strong></p>
    <p>Thank you for your order. We’re so excited to share the Volaire™ difference with you, and can’t wait for you to experience the soft, touchable, full-bodied volume you deserve. Please check your order below, and contact us if you have any questions at <span class="iblock">1-800-201-6539,</span> 6am–6pm PST, Monday–Friday <span class="iblock">and 7am–1pm PST Saturday.</span></p>
    <p style="display: none;"> Your order number is
                    <%=orderId.ToString()%>, and an email confirmation will be sent to 
    <%=LiteralEmail.Text%>.</p>
</div>

<div class="receipt_header">Order Confirmation</div>
<table class="table receipt_info">
    <tr>
        <th>Shipping Address</th>
        <th>Billing Address</th>
    </tr>
    <tr>
        <td><asp:Literal ID="LiteralName" runat="server"></asp:Literal></td>
        <td><asp:Literal ID="LiteralName_b" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td>
            <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal>
            <asp:Panel ID="pnlSAddress2" runat="server">
                <br><asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal>
            </asp:Panel>
        </td>
        <td>
            <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal>
            <asp:Panel ID="pnlBAddress2" runat="server">
                <br /><asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td><asp:Literal ID="LiteralCity" runat="server"></asp:Literal>, <asp:Literal ID="LiteralState" runat="server"></asp:Literal><asp:Literal ID="LiteralZip" runat="server"></asp:Literal></td>
        <td><asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal>, <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal> <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td><asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></td>
        <td><asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td><asp:Literal ID="LiteralPhone" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td><asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></td>
    </tr>



    <tr>
        <th colspan="2" style="padding-top: .9rem;">Payment Method</th>
    </tr>
    <tr>
        <td><asp:Literal runat="server" ID="ltCardType"></asp:Literal></td>
    </tr>
    <tr>
        <td>xxxx-xxxx-xxxx-<asp:Literal runat="server" ID="ltCardNumber"></asp:Literal></td>
    </tr>
    <tr>
        <td>Ex: <asp:Literal runat="server" ID="ltExpDate"></asp:Literal></td>
    </tr>
    
</table>
        
          
<table class="receipt_table">
    <tr>
        <th>Product Description</th>
        <th class="text-center">Qty</th>
        <%--<th class="text-center">1st Payment</th>--%>
        <%--<th class="text-center">S&amp;H</th>--%>
        <th class="text-center">Total Price</th>
    </tr>
          
<asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
    <ItemTemplate>
        <tr class="receipt_items">
            <td>
                <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
            </td>
            <td class="text-center bold">
                <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
            </td>
                <%--<td class="text-center bold">
                $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%> 
            </td>--%>
            <%--<td class="text-center bold">
                $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))), 2).ToString()%>
            </td>--%>
            <td class="text-center bold">
                $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))) + Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
            </td>
        </tr>
                           
    </ItemTemplate>
</asp:DataList>
<asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
<tr class="receipt_totals">
    <td colspan="2" style="text-align:right; padding-right: 5px;">
        SUBTOTAL:<br />
         TAX:<br />
        S&H:<br />
        <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
            Rush S &amp; H:<br />
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
            DISCOUNT:<br />
        </asp:Panel>
        <strong class="magenta">TOTAL:</strong>

    </td>
                    
    <td>
        <strong>$<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal></strong><br />
        $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
        $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
        <asp:Panel ID="pnlRush" runat="server" Visible="false">
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
            <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
        </asp:Panel>
        <strong class="magenta"> $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal></strong>
    </td>
</tr></table>
         
         
<asp:Panel class="cart_offer_details_wrap offerdetailsreceipt" runat="server" id="cart_offer_wrap_m">
    <div class="cart_offer_details">
        <asp:Literal runat="server" ID="ltOfferDetails"></asp:Literal>
    </div>
</asp:Panel>

<div class="receipt_guarantee">
    <p><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-60DMBG.png" alt="60 Day Money Back Guarantee" class="iblock footer-mbg" /></p>
    <p>At VOLAIRE™ we are committed to you achieving the full-bodied, touchable volume you’ve always dreamed of. If for any reason you’re not 100% satisfied with any of our products, simply return them within 60 days of purchase for a full refund (less s&h). 

    </p>
</div>