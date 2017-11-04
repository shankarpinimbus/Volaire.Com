<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MiniCart_M.ascx.cs"
    Inherits="CSWeb.Shared.UserControls.MiniCart_M" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<div id="MinCrt" class="minicart" style="" runat="server">
    <p><%=itemCount %> item added to your cart.</p>
    <p>Shopping Bag Total: $ <%=subTotal.ToString("n2") %></p>
    <a href="cart.aspx">CheckOut</a>
    <p runat="server" id="pShipping"> <%=remainingAmount.ToString("n2") %> remaining for Free Shipping.</p>
    <p runat="server" id="pFreeShipping" Visible="False"> FREE SHIPPING You now qualify for free shipping.</p>
    </div>
