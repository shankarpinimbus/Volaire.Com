<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.CONTROL.contact" EnableSessionState="True" %>

<%@ Register Src="UserControls/ContactUs.ascx" TagName="ContactUs" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagPrefix="uc" TagName="TrackingPixels" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

<%#CSBusiness.DynamicVersion.Helper.IncludeFile("/Shared/scripts-top.html")%>
<link href="/styles/global.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
<div class="wrapper">


    <div class="bg">
        <img src="Content/Images/home_bg.jpg" /></div>

    <div class="container" style="background: rgba(255,255,255,.98);">
        <h2>Contact Us</h2>
        <p style="padding-bottom: 40px"></p>
        <div class="fleft" style="width: 300px;">
        </div>
        <div class="fright">
            <form runat="server" id="billing1">
                <asp:ScriptManager ID="Scriptmanager1" runat="server">
                    <Scripts>
                        <asp:ScriptReference Path="/scripts/FixFocus.js" />
                    </Scripts>
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:Panel ID="Panel_Contactus" runat="server">
                            <uc:ContactUs ID="ucContactUs" runat="server" />
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>

        <div class="clear"></div>

    </div>
</div>



<%#CSBusiness.DynamicVersion.Helper.IncludeFile("/Shared/scripts-bottom.html")%>
<uc:TrackingPixels runat="server" ID="TrackingPixels" />
</body>
</html>
