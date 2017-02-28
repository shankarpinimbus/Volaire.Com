<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Desktop.PayPalProcess" CodeBehind="PayPalProcess.aspx.cs" EnableSessionState="True" %>

<%@ Register Src="~/Shared/UserControls/PayPalResponseForm.ascx" TagName="PayPalResponseForm" TagPrefix="uc" %>
 
<%@ Register Src="~/Shared/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server" id="head1">
<meta charset="utf-8">    
<title></title>
<meta name="description" content=""/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script src="/Scripts/jquery.cycle.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global.js"></script>
<script src="/Scripts/Overlay.js"></script>
<link href="/styles/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server" id="fm1">
    <uc:PayPalResponseForm ID="bfcPayPalResponseForm1" runat="server"  />
    </form>

    
        <form action="https://www.sandbox.paypal.com/webapps/adaptivepayment/flow/pay" target="PPDGFrame" class="standard">

          <label for="buy">Buy Now:</label>
          <input type="image" id="submitBtn" value="Pay with PayPal" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif">
           <input id="type" type="hidden" name="expType" value="mini">
           <input id="paykey" type="hidden" name="paykey" value="<%=apino %>">
        </form>
        <script type="text/javascript" charset="utf-8">
            var dgFlowMini = new PAYPAL.apps.DGFlowMini({ trigger: 'submitBtn' });
        </script>
        
        
    <uc:TrackingPixels ID="TrackingPixels" runat="server" />     
</body>
</html>
