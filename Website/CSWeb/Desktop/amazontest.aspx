<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="amazontest.aspx.cs" Inherits="CSWeb.Desktop.amazontest" EnableSessionState="True" %>

<%@ Register Src="~/Shared/UserControls/AmazonPayment.ascx" TagPrefix="uc1" TagName="AmazonPayment" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:AmazonPayment runat="server" ID="AmazonPayment" />
    </div>
    </form>
</body>
</html>
