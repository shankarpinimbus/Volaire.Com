<%@ Control Language="C#" Inherits="CSWeb.Shared.UserControls.CheckoutThankYouModule" %>


<div id="receipt_content" style="width: 875px; padding: 30px 0; margin: 0 auto;">

    <h2>Thank you for your order!</h2>


    <p>
        Your order has been placed. You'll receive an email when your order is ready to ship.
        Your order number is:
                <asp:Literal ID="LiteralOrderNumber" runat="server"></asp:Literal>
    </p>



    <table border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
        <tr>
            <td colspan="3">
                <div class="horizontal_dots"></div>
            </td>
        </tr>

        <tr>

            <th class="receipt_col_1 receipt_hdrs">
                <strong>Description</strong>
            </th>
            <th class="receipt_col_2 receipt_hdrs">
                <strong>Quantity</strong>
            </th>
            <th class="receipt_col_3 receipt_hdrs">
                <strong>Total</strong>
            </th>
        </tr>
        <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <tr>
                    <td class="receipt_col_1">
                        <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                    </td>
                    <td class="receipt_col_2">
                        <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                    </td>

                    <td class="receipt_col_2">$<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                    </td>

                </tr>
            </ItemTemplate>
        </asp:DataList>


        <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
        <tr>
            <td colspan="3">
                <div class="horizontal_dots"></div>
            </td>
        </tr>
        <tr>
            <td valign="top"></td>
            <td valign="top">Subtotal:<br />
                S &amp; H:<br />
                <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                    Rush S &amp; H:<br />
                </asp:Panel>
                Tax:<br />
                <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                    Discount:<br />
                </asp:Panel>
                Total:
            </td>
            <td valign="top">$<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    $<asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
                </asp:Panel>
                $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                    <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                </asp:Panel>
                $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="horizontal_dots"></div>
            </td>
        </tr>
    </table>

    <div class="receipt_table2_wrap">
        <table border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
            <tr>
                <th colspan="2" valign="top">Shipping Information:</th>
                <th colspan="2" valign="top">Billing Information:</th>
            </tr>
            <tr>
                <td class="rec_info_1">Name:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralName" runat="server"></asp:Literal></td>
                <td class="rec_info_3">Name:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralName_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">Address:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralAddress" runat="server"></asp:Literal></td>
                <td class="rec_info_3">Address:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">Address 2:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal></td>
                <td class="rec_info_3">Address 2:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">City:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralCity" runat="server"></asp:Literal></td>
                <td class="rec_info_3">City:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">State:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralState" runat="server"></asp:Literal></td>
                <td class="rec_info_3">State:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralState_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">Zip Code:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralZip" runat="server"></asp:Literal></td>
                <td class="rec_info_3">Zip Code:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">Country:</td>
                <td class="rec_info_2"><asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></td>
                <td class="rec_info_3">Country:</td>
                <td class="rec_info_4"><asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="rec_info_1">Email Address:</td>
                <td class="rec_info_2" colspan="3"><asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></td>
            </tr>
        </table>
    </div>

</div>
