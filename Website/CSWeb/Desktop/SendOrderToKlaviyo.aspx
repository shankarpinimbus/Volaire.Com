<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendOrderToKlaviyo.aspx.cs" Inherits="CSWeb.Desktop.SendOrderToKlaviyo"
    EnableEventValidation="false" EnableSessionState="true" %>
<!doctype html>
<html> 
<head id="Head1" runat="server">
<meta charset="utf-8">   
    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script src="/Scripts/Overlay.js"></script>

    <title>Order Sent to Master list in Klaviyo</title>  
    <script type="text/javascript">
        var _learnq = _learnq || [];
        _learnq.push(['account', 'Jgt6kg']);
        (function () {
            var b = document.createElement('script'); b.type = 'text/javascript'; b.async = true;
            b.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'a.klaviyo.com/media/js/analytics/analytics.js';
            var a = document.getElementsByTagName('script')[0]; a.parentNode.insertBefore(b, a);
        })();


        ///////////////////////////////////////
            

        function SendOrder(email, firstname, lastname, ordersource, orderdate, ordernumber, totalorders, totalamount, totalitems, promocode) {

            _learnq = _learnq || [];

            // Identifying a person and tracking special Klaviyo properties.
            _learnq.push(['identify', {
                '$email': email,
                '$first_name': firstname,
                '$last_name': lastname
            }]);

            // Adding custom properties. Note that Klaviyo understands different data types.
            _learnq.push(['identify', {
                'OrderSource': ordersource,
                'OrderDate':orderdate,
                'OrderNumber': ordernumber,
                'TotalOrdersTillDate': totalorders,
                'TotalAmountofOrder': totalamount,
                'TotalItemCodes': totalitems,
                'PromoCode': promocode,
             }]);
          
            _learnq.push(['track', 'Fulfillment Order']);
        }
    </script> 
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="Orders"/>
    <asp:Panel ID="pnlManual" runat="server">
    
        The orders have been sent, please check klaviyo list for more details.

    </asp:Panel>
    </form>
     <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
</body>
</html>
