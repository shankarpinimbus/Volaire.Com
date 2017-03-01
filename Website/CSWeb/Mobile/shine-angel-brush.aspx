<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shine-angel-brush.aspx.cs" Inherits="CSWeb.Mobile.shineangelbrush" EnableSessionState="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RadioButton runat="server" ID="rbMedium" Text="Medium" GroupName="shineangelbursh" Checked="True"/>
        <asp:RadioButton runat="server" ID="rbSmall" Text="Small" GroupName="shineangelbursh"/>
        <asp:Button runat="server" id="btnAddtoCart" Text="Add to Cart" OnClick="btnAddtoCart_OnClick"/>
        <a href="tangle-angel-brush">No Thank you</a>
    </div>
    </form>
</body>
</html>
