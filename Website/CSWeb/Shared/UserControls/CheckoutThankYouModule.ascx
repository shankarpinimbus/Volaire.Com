﻿<%@ Control Language="C#" Inherits="CSWeb.Shared.UserControls.CheckoutThankYouModule" %>


<div class="contentpad1 clearfix">
    <div class="receipt_content">

    <h1 class="receipt_top orange text-center ital">Your order has been submitted!</h1>
    <h2 class="receipt_top caps">Get Ready for Va-Va Volume!</h2>

    <asp:Literal ID="LiteralOrderNumber" runat="server" Visible="false"></asp:Literal>
                
    <p class="intro">Thank you for your order. We’re so excited to share the VOLAIRE™ difference with you, and can’t wait for you to experience the soft, touchable, full-bodied volume you deserve. Please check your order below, and contact us if you have any questions at <span class="iblock">1-800-201-6539,</span> 6am–6pm PST, Monday–Friday and 7am–1pm PST Saturday.</p>



<table border="0" cellspacing="0" cellpadding="0" id="receipt_table1" style="width: 100%;">
<tr>
    <td colspan="3">
        <h2 class="receipt_hdr">Order Confirmation</h2>
        <div class="horizontal_dots" style="margin-top: 0;"></div>
    </td>
</tr>

<tr>
    <td colspan="3">
        <div class="receipt_info receipt_info_col_1">
            <h2>Shipping Address</h2>
            <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal>
        </div>
        <div class="receipt_info receipt_info_col_2">
            <h2>Billing Address</h2>
            <asp:Literal ID="LiteralName_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
            <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal>
        </div>
        <div class="receipt_info receipt_info_col_3">
            <h2>Payment Method</h2>
            <asp:Literal runat="server" ID="ltCardType"></asp:Literal><br />
            xxxx-xxxx-xxxx-<asp:Literal runat="server" ID="ltCardNumber"></asp:Literal><br />
            Ex: 
            <asp:Literal runat="server" ID="ltExpDate"></asp:Literal>
        </div>
        
    </td>
</tr>
    <tr><td colspan="3"><div class="horizontal_dots" style="margin-top: 0;"></div></td></tr>
<tr>

    <td width="76%" class="table_hdrs">
        Product Description
    </td>
    <td width="12%" align="center" class="table_hdrs">
        Quantity
    </td>
    <td width="12%" class="table_hdrs">
        Total
    </td>
</tr>
<asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
    <ItemTemplate>
        <tr>
            <td valign="top" class="table_txt_1">
                <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
            </td>
            <td valign="top" align="center" class="table_txt_1">
                <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
            </td>

            <td valign="top" class="table_txt_1">$<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
            </td>

        </tr>
    </ItemTemplate>
</asp:DataList>


<asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
        <tr><td colspan="3"><div class="horizontal_dots"></div></td></tr>
<tr>
    <td valign="top" colspan="3" class="table_txt_2">
                
        <div class="fleft text-right" style="width: 88%;">
Subtotal:<br />
        <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
            Rush S &amp; H:<br />
        </asp:Panel>
        Tax:<br />
        S &amp; H:<br /><br />

        <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
            Discount:<br />
        </asp:Panel>
        <strong class="magenta">Total:</strong>
        </div>
        <div class="fleft text-right bold" style="width: 12%; padding-right: 3%;">
            $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
        <asp:Panel ID="pnlRush" runat="server" Visible="false">
            $<asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
        </asp:Panel>
        $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
        $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br /><br />

        <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
            <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
        </asp:Panel>
        $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
        </div>
                
    </td>
</tr>

</table>

    


    <br />

    <asp:Panel class="cart_offer_details_wrap" runat="server" id="cart_offer_wrap">
        <div class="cart_offer_details">
            <asp:Literal runat="server" ID="ltOfferDetails"></asp:Literal>
        </div>
    </asp:Panel>
        <br /><br />
    <div class="clearfix">
                    <div class="cart-guarantee-1"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/VOLAIRE-60DMBG.png" alt="No risk 60 day money back guarentee with VOLAIRE. Volume that is easy to achieve and lasts all day long with VOLAIRE." /></div>
                    <div class="cart-guarantee-2">
                        <h2>OUR MEGA &nbsp;<span class="webfont1 orange ital normal">promise</span></h2>
                        <p>At VOLAIRE<sup>™</sup> we are committed to you achieving the full-bodied, touchable volume you’ve always dreamed of. If, for any reason, you’re not 100% satisfied with any of our products, simply return them within 60 days of purchase for a full refund (less s&h). </p>
                    </div>
                    <div class="cart-guarantee-3"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/ssl.png" alt="SSL Secured Online Ordering" /></div>
                    <%--<p class="text-center">
                        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/cart-guarantee.png" alt="30 Day Money Back Guarantee - SSL Secured Online Ordering" />
                    </p>--%>
            </div>

    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("include_guarantee.html")%>
    <br />
</div>
</div>
