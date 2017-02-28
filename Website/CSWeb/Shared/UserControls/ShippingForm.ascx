<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Shared.UserControls.ShippingForm" CodeBehind="ShippingForm.ascx.cs" %>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPWAx1fj8r3gX9_G87BkjXById3EfPWfc&libraries=places"></script>
<script src="/Scripts/string.min.js"></script>
<script src="/Scripts/location.autocomplete.js"></script>
<%-- PLACEHOLDER function for IE - http://jamesallardice.github.io/Placeholders.js/--%>
<%-- .click function below should have the ID of the submit button! --%>
<%-- we might need to update this to only show on earlier IE versions --%>
<!--[if IE]>
<script src="/scripts/placeholders.min.js"></script>
<script type="text/javascript">
$(function(){
$('#sfcShippingInfo_imgBtn').click(function() {
   Placeholders.disable();
});
    //$('#reset').click(function() {
   // Placeholders.enable();
//});
});
</script>
<![endif]-->


<%--<script src="/Scripts/formValidationCustomization.js"></script>--%>
<script type="text/javascript">
    function InvalidMsg(textbox) {
        if (textbox.value == '') {
            textbox.setCustomValidity("<%= CSBusiness.ResourceHelper.GetResoureValue("EmailErrorMsg")%>");
        }
        else if (textbox.validity.typeMismatch) {
            textbox.setCustomValidity("<%= CSBusiness.ResourceHelper.GetResoureValue("EmailValidationErrorMsg")%>");
        }
        else {
            textbox.setCustomValidity('');
        }
    return true;
}
</script>
<asp:ScriptManager runat="server" ID="sm1">
    <Scripts>
        <asp:ScriptReference Path="/scripts/FixFocus.js" />
    </Scripts>
</asp:ScriptManager>
<asp:UpdatePanel ID="upBillingForm" runat="server">
    <ContentTemplate>




<div class="cartB" runat="server" ID="dSForm" visible="true">
<fieldset class="form">
    <div class="formtop_img">
        <img src="//d39hwjxo88pg52.cloudfront.net/citrinex/images/formtop.png" class="block" />
    </div>
    <div class="form_line clearfix">
        <label class="label-1">First Name*</label>
        <input required="required" id="txtShippingFirstName" type="text" runat="server" maxlength="14" class="text-1" placeholder="" />

    </div>
    <div class="form_line clearfix">

        <label class="label-1">Last Name*</label>
        <input required="required" id="txtShippingLastName" type="text" runat="server" maxlength="14" class="text-1" placeholder="" />
    </div>
    
    <div class="form_line clearfix">

        <label class="label-1">Email Address*</label>

        <asp:TextBox ID="txtEmail" required="required" runat="server" MaxLength="100" CssClass="text-1" placeholder=""></asp:TextBox>
                <div class="error-1 clear clearfix">
            <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
        </div>
    </div>

    
    <div class="form_line clearfix">

        <label class="label-1">Address*</label>
        <input required="required" id="txtShippingAddress1" type="text" runat="server" maxlength="30" class="text-1" placeholder="" />
        
    </div>

    <div class="form_line clearfix">
        <label class="label-1">Address 2</label>
        <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1" placeholder=""></asp:TextBox>
    </div>
   

    <div class="form_line clearfix">

        <label class="label-1">City*</label>
        <input required="required" type="text" id="txtShippingCity" runat="server" maxlength="30" class="text-1" placeholder="" />
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label>
        </div>
        <label class="label-1">
            Country*</label>
        <asp:DropDownList ID="ddlShippingCountry" required="required" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
            AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
            CssClass="text-1" placeholder="">
        </asp:DropDownList>
    </div>
    <div class="form_line clearfix">

        <label class="label-1">State*</label>
        <asp:DropDownList required="required" ID="ddlShippingState" runat="server" DataTextField="NAME" AutoPostBack="True" CssClass="text-1" size="1" OnSelectedIndexChanged="ShippingState_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:HiddenField ID="ddlStateJS" runat="server" />
    </div>

    <div class="form_line clearfix">
        <div class="error-1">

            <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label>
        </div>
        <label class="label-1">ZIP Code*</label>
        <input required="required" type="text" id="txtShippingZipCode" runat="server" maxlength="7" class="text-1" placeholder="" />
    </div>
    <div class="form_line clearfix">
        <div class="error-1">

            <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label>
        </div>
        <label class="label-1">Phone*</label>
        <asp:TextBox required="required" ID="txtPhoneNumber" runat="server" MaxLength="15" CssClass="text-1" placeholder=""></asp:TextBox>
    </div>
    <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label>
            </div>
            <label class="label-1">
                Quantity*</label>
            <asp:DropDownList ID="ddlQuantityList" runat="server" CssClass="text-1" placeholder="">
                <asp:ListItem Value="select" Text="Select"></asp:ListItem>
                <asp:ListItem Value="1" Text="1"></asp:ListItem>
                <asp:ListItem Value="2" Text="2"></asp:ListItem>
                <asp:ListItem Value="3" Text="3"></asp:ListItem>
                <asp:ListItem Value="4" Text="4"></asp:ListItem>
                <asp:ListItem Value="5" Text="5"></asp:ListItem>
                <asp:ListItem Value="6" Text="6"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </asp:Panel>
    <div class="form_line_btn">
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/citrinex/images/btn_ordernow.png" OnClick="imgBtn_OnClick" CssClass="submit btn_shadow" />

    </div>

    <div class="">
        <div>

        <div style="float:left;width:25%;margin-top:3%;margin-left:15%;padding-bottom:1%;">
            <img src="//d39hwjxo88pg52.cloudfront.net/citrinex/images/guarantee.jpg" class="iblock" style="width:100%;"/>
        </div>
        <div style="float:left;width:50%;" align="center">
            <p align="center" class="pad12">
                    <img src="//d39hwjxo88pg52.cloudfront.net/citrinex/images/nortonSecurity.gif" style="width:100px;display:block;margin-top:5%;" class="nortonWindow cursor"/>
                </p>
            </div>
            <script>
                $('.nortonWindow').click(function () {
                    window.open("https://trustsealinfo.websecurity.norton.com/splash?form_file=fdf/splash.fdf&dn=www.citrinex.com&lang=en", null, "height=500,width=600,status=yes,toolbar=no,menubar=no,location=no");
                })
            </script>

            <%-- Norton Seal: Hidden to solve postback auto-hide issue --%>
<%--            <table style="display:none;" width="135" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose Symantec SSL for secure e-commerce and confidential communications." class="pad12">
                <tr>
                    <td width="135" align="center" valign="top"><script type="text/javascript" src="https://seal.websecurity.norton.com/getseal?host_name=www.citrinex.com&amp;size=L&amp;use_flash=NO&amp;use_transparent=NO&amp;lang=en"></script><br />
                    <%--<a href="http://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 5px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a>
                    </td>
                </tr>
            </table>--%>
            <%-- End --%>
        </div>
        <div class="clear clearfix"></div>
    </div>


</fieldset>
</div>
        
</ContentTemplate>
</asp:UpdatePanel>

<script>
    $(document).ready(function () {
        function initShippingForm(options) {
            var service = new window.LocationAutocomplete({
                address: "sfcShippingInfo_txtShippingAddress1",
                city: "sfcShippingInfo_txtShippingCity",
                state: "sfcShippingInfo_ddlShippingState",
                stateHidden: "sfcShippingInfo_ddlStateJS",
                stateName: "sfcShippingInfo$ddlShippingState",
                country: "sfcShippingInfo_ddlShippingCountry",
                countryName: "sfcShippingInfo$ddlShippingCountry",
                zip: "sfcShippingInfo_txtShippingZipCode"
            });

            service.init();
        }

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            initShippingForm();
        });

        initShippingForm();
    });
</script>