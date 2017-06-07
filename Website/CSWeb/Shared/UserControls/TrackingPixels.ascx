<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackingPixels.ascx.cs" Inherits="CSWeb.Shared.UserControls.TrackingPixels" %>
<!-- All Pixels Here -->
<input type="hidden" id="wppoHitsLinkVersionName" value="<%=Session["wppohitslinkversionname"]%>" />
<input type="hidden" id="wppoPageTitle" value="<%=Session["wppopagetitle"]%>" />
<input type="hidden" id="wppoOrderId" value="<%=Session["wppoorderid"]%>" />
<input type="hidden" id="wppoSubTotal" value="<%=Session["wpposubtotal"]%>" />
<input type="hidden" id="wppoShipping" value="<%=Session["wpposhipping"]%>" />
<input type="hidden" id="wppoTax" value="<%=Session["wppotax"]%>" />
<input type="hidden" id="wppoTotal" value="<%=Session["wppototal"]%>" />
<input type="hidden" id="wppoGTMSkuItem" value="<%=Session["wppogtmskuitem"]%>" />
<input type="hidden" id="wppoGTMSkuItemFB" value="<%=Session["wppogtmskuitemFB"]%>" />
<input type="hidden" id="wppoPaymentPlan" value="<%=Session["wppopaymentplan"]%>" />
<input type="hidden" id="wppoCouponCode" value="<%=Session["wppocouponcode"]%>" />
<input type="hidden" id="wppoOrderDate" value="<%=Session["wppoorderdate"]%>" />
<input type="hidden" id="wppoEmailAddress" value="<%=Session["wppoEmailAddress"]%>" />
<input type="hidden" id="wppoName" value="<%=Session["wppoName"]%>" />
<input type="hidden" id="wpposubid" value="<%=Session["wpposubid"]%>" />

<asp:Panel ID="pnlHomePage" runat="server" Visible="false">
</asp:Panel>

<asp:Panel ID="pnlAllPages" runat="server" Visible="false">
</asp:Panel>
<asp:Panel ID="pnlHomeAndSubPages" runat="server" Visible="false">
</asp:Panel>
<asp:Panel ID="pnlCartPages" runat="server" Visible="false">

    <script>
        dataLayer = [{
            "transactionTotal": <%= ltTotal.Text%>,
            "transactionCurrency": "USD",
            "transactionProducts": [
        <%= ltGTMtransactionProducts.Text%>
            ]
        }];
    </script>

</asp:Panel>
<asp:Panel ID="pnlReceiptPage" runat="server" Visible="false">
   

    <script>
        dataLayer = [{
            'ecommerce': {
                'purchase': {
                    'actionField': {
                        'id': '<%= ltOrderId.Text%>',
                        'revenue': '<%= ltTotal.Text%>',
                        'tax': '<%= ltTax.Text%>',
                        'shipping': '<%= ltShipping.Text%>'
                    },
                    <%= ltGTMSkuItem.Text%>

                }
            },
            "transactionId": "<%= ltOrderId.Text%>",
            "transactionDate": "<%= lttransactionDate.Text%>",
            "transactionTotal": <%= ltTotal.Text%>,
            "transactionCurrency": "USD"
        }];
        dataLayer.push({ 'customFirstTime': '<%= ltFirstTime.Text%>' });
        dataLayer.push({ 'virtualPageURL': '<%= ltvirtualPageURL.Text%>' });
        dataLayer.push({ 'virtualPageTitle': '<%= ltvirtualPageTitle.Text%>' });
    </script>
    <asp:Literal ID="litGAReceiptPixel" Visible="False" runat="server" />
</asp:Panel>

<asp:Literal runat="server" Visible="False" ID="ltEmail"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltFirstName"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltLastName"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltOrderId"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltSubTotal"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltShipping"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltTax"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltHandling" Text="0.00"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltTotal"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltSkuItem"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltCartSkuItem"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltGTMSkuItem"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltFirstTime"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltvirtualPageURL"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltvirtualPageTitle"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltCustomOrderItem"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="lttransactionDate"></asp:Literal>
<asp:Literal runat="server" Visible="False" ID="ltGTMtransactionProducts"></asp:Literal>

<asp:Panel ID="pnlVolaire" runat="server">
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MC9R5ZW');</script>
<!-- End Google Tag Manager -->
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MC9R5ZW"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
    </asp:Panel>
<asp:Panel ID="pnlGetVolaire" runat="server" Visible="False">
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                                                  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-TZGPTPX');</script>
    <!-- End Google Tag Manager -->
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TZGPTPX"
                      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
</asp:Panel>
