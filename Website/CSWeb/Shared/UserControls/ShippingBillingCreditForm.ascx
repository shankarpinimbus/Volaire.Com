<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Shared.UserControls.ShippingBillingCreditForm" CodeBehind="ShippingBillingCreditForm.ascx.cs" %>
<%@ Register Src="~/Shared/UserControls/AmazonPayment.ascx" TagPrefix="uc" TagName="AmazonPayment" %>
<%@ Register Src="~/Shared/UserControls/ShoppingCartControl.ascx" TagName="ShoppingCartControl" TagPrefix="uc" %>
<script type="text/javascript" src="/Scripts/autoTab.js"></script>
<%-- PLACEHOLDER function for IE - http://jamesallardice.github.io/Placeholders.js/ --%>
<%-- .click function below should have the ID of the submit button! --%>
<%-- we might need to update this to only show on earlier IE versions --%>
<!--[if IE]>
<script src="/scripts/placeholders.min.js"></script>
<script type="text/javascript">
$(function(){
$('#bfcBillingShippingCreditInfo_imgBtn').click(function() {
   Placeholders.disable();
});
    //$('#reset').click(function() {
   // Placeholders.enable();
//});
});
</script>
<![endif]-->

<script type = "text/javascript">
    function ValidateCheckBox(sender, args) {
        if (document.getElementById("<%=cbAgree.ClientID %>").checked == true) {
            args.IsValid = true;
        } else {
            args.IsValid = false;
        }
    }
</script>
<script type="text/javascript">
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
function BeginRequestHandler(sender, args) {
document.getElementById('<%= lblMessage.ClientID %>').innerText = "Processing...";
    //document.getElementById('<%= imgBtn.ClientID %>').Im = "Processing";
    document.getElementById("<%= imgBtn.ClientID %>").src = "//d39hwjxo88pg52.cloudfront.net/images/loader.gif";
    args.get_postBackElement().disabled = true;
    //MM_showHideLayers('mask', '', 'show');
}
</script>
<script type="text/javascript">

    var pointerToMicrosoftValidator = ValidatorUpdateIsValid;
    ValidatorUpdateIsValid = function () {
        pointerToMicrosoftValidator();
        if (Page_IsValid) {

        } else {
            MM_showHideLayers('mask', '', 'hide');
        }
        // do something after Microsoft finishes 
    }
    window.scrollTo = function () { };
</script>

<asp:ScriptManager runat="server" ID="sm1">
    <Scripts>
        <asp:ScriptReference Path="/scripts/FixFocus.js" />
    </Scripts>
</asp:ScriptManager>

<section class="container cart-wrap">
<fieldset class="form">
<asp:UpdatePanel ID="pnlShippingBillingCreditForm" runat="server">
    <ContentTemplate>
        <div class="cart_content_B clearfix">

            <uc:ShoppingCartControl ID="ShoppingCartControl" runat="server" />


        
            <div class="cartB">
                <asp:Panel ID="pnlBillingInfo" runat="server" Visible="true">
                    <div class="main_cart_hdr">Please Enter Your Email Address:</div>
                    
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="cata" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                Display="Dynamic" CssClass="cata" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                            <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Email Address*</label>
                        <asp:TextBox ID="txtEmail" required="required" runat="server" MaxLength="100" CssClass="text-1" placeholder="*Email"></asp:TextBox>
                        <%-- <input required="required" title="" pattern="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" id="txtEmail" runat="server" class="text-1" maxlength="100" placeholder="Email" />--%>
                    </div>
                    
                    <div class="main_cart_hdr">Shipping Address:</div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvFirstName" runat="server" Display="Dynamic"
                                ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblFirstNameError" CssClass="none" runat="server" Visible="false">
                            </asp:Label>
                        </div>
                        <label class="label-1">
                            First Name*</label>
                        <input type="text" required="required" id="txtFirstName" runat="server" maxlength="14" clientidmode="Static" class="text-1" placeholder="*First Name" />
                    </div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvLastName" runat="server" Display="Dynamic"
                                ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblLastNameError" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Last Name*</label>
                        <input type="text" required="required" id="txtLastName" runat="server" maxlength="14" clientidmode="Static" class="text-1" placeholder="*Last Name" />
                    </div>

                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvAddress1" runat="server" Display="Dynamic"
                                ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblAddress1Error" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Address 1*</label>

                        <input required="required" id="txtAddress1" runat="server" maxlength="30" clientidmode="Static" class="text-1 billingad1" placeholder="*Address" type="text" />
                    </div>
                    <div class="form_line clearfix">
                        <label class="label-1">
                            Address 2
                        </label>
                        <input id="txtAddress2" maxlength="30" class="text-1" type="text" clientidmode="Static" runat="server" visible="true" placeholder="Address 2" />
                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvCity" CssClass="cata" runat="server" Display="Dynamic"
                                ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblCityError" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            City*</label>
                        <input required="required" type="text" id="txtCity" runat="server" maxlength="30" clientidmode="Static" class="text-1" placeholder="*City" />
                    </div>
                    <div class="form_line clearfix">
                        <label class="label-1">
                            Country*</label>
                        <asp:DropDownList ID="ddlCountry" required="required" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                            AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                            CssClass="text-1">
                        </asp:DropDownList>
                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label>

                        </div>
                        <label class="label-1">
                            State*</label>
                        <asp:DropDownList ID="ddlState" required="required" runat="server" DataTextField="NAME" ClientIDMode="Static" CssClass="text-1" size="1">
                        </asp:DropDownList>
                        <asp:HiddenField ID="ddlStateJS" runat="server" />
                        <%-- <select name="ddlState" id="ddlState" runat="server" datatextfield="NAME" class="text-1" size="1">
                    </select>--%>
                    </div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvZipCode" runat="server" Display="Dynamic"
                                ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label>
                        </div>
                            
                        
                        <label class="label-1">
                            Zip Code*</label>
                        <asp:TextBox required="required" id="txtZipCode" runat="server" maxlength="5" clientidmode="Static" class="text-1" placeholder="*ZIP Code" AutoPostBack="true" OnTextChanged="ZipCode_TextChanged" />
                    </div>

                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                                ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Phone*</label>
                        <asp:TextBox required="required" ID="txtPhoneNumber" runat="server" MaxLength="15" CssClass="text-2" placeholder="*Phone" />
                        <span style="font-size: 11.5px; padding-left: 10px; padding-top: 2px;">For delivery questions only</span>
                    </div>
                    
                    <div class="clear"></div>


                    <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label>
                            </div>
                            <label class="label-1">
                                Quantity*</label>
                            <asp:DropDownList ID="ddlQuantityList" runat="server" CssClass="text-1">
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
                </asp:Panel>
                <div class="form_line clearfix" style="padding-top: 6px; padding-bottom: 0;">
                    <label class="label-3" for="sbcfShippingBillingCreditForm_cbShippingSame">
                        Is this also your Billing Address
                    </label>
                    <asp:CheckBox ID="cbShippingSame" runat="server" CssClass="checkbox-left" OnCheckedChanged="cbShippingSame_CheckedChanged" AutoPostBack="true" Checked="true" />
                </div>

                <div class="clear"></div>

                <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                    
                    <div class="main_cart_hdr">Billing Address:</div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" CssClass="cata" Display="Dynamic"
                                ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblShippingFirstName" CssClass="none" runat="server" Visible="false">
                            </asp:Label>
                        </div>
                        <label class="label-1">
                            First Name*</label>
                        <input required="required" type="text" id="txtShippingFirstName" runat="server" clientidmode="Static" maxlength="14" class="text-1" placeholder="*First Name" />

                    </div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvShippingLastName" CssClass="cata" runat="server" Display="Dynamic" ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblShippingLastName" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Last Name*</label>
                        <input required="required" type="text" id="txtShippingLastName" runat="server" clientidmode="Static" maxlength="14" class="text-1" placeholder="*Last Name" />

                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvShippingAddress1" CssClass="cata" runat="server" Display="Dynamic"
                                ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblShippingAddress1Error" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Billing Address*</label>
                        <input required="required" type="text" id="txtShippingAddress1" runat="server" maxlength="30" class="text-1" placeholder="*Address" />
                    </div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                        </div>
                        <label class="label-1">
                            Address 2</label>
                        <input id="txtShippingAddress2" runat="server" maxlength="30" class="text-1" placeholder="Address 2" />
                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" CssClass="cata" Display="Dynamic"
                                ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblShippingCityError" CssClass="none" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            City*</label>
                        <input required="required" type="text" id="txtShippingCity" runat="server" maxlength="30" class="text-1" placeholder="*City" />

                    </div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Country*</label>
                        <asp:DropDownList ID="ddlShippingCountry" required="required" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                            AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                            CssClass="text-1">
                        </asp:DropDownList>
                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label>

                        </div>
                        <label class="label-1">
                            State*</label>
                        <asp:DropDownList ID="ddlShippingState" required="required" runat="server" DataTextField="NAME" class="text-1" size="1">
                        </asp:DropDownList>
                        <asp:HiddenField ID="ddlShippingStateJS" runat="server" />
                    </div>
                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvShippingZipCode" CssClass="cata" runat="server" Display="Dynamic"
                                ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1">
                            Zip Code*</label>
                        <asp:TextBox required="required" type="text" id="txtShippingZipCode" runat="server" clientidmode="Static" maxlength="5" class="text-1" placeholder="*ZIP Code" AutoPostBack="true" OnTextChanged="ZipCode_TextChanged" />
                    </div>
                    
                    
                    <div class="clear"></div>
                </asp:Panel>

                <div class="form_line clearfix" runat="server" visible="False">
                    <label class="label-3">
                        Additional Shipping Charge</label>
                    <div class="error-2">
                        <asp:DropDownList ID="ddlAdditionShippingCharge" runat="server" CssClass="text-2">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="clear"></div>

                <div class="main_cart_hdr">Select Your Payment Method:</div>

                <div class="form_line clearfix paydrop" runat="server" visible="False">
                    <label class="label-1">Payment Method</label>
                    <asp:DropDownList runat="server" ID="ddlPaymentMethod" AutoPostBack="True" OnSelectedIndexChanged="ddlPaymentMethod_OnSelectedIndexChanged" CssClass="text-1" Style="float: none">
                        <asp:ListItem Text="Select Payment Method" Value=""></asp:ListItem>
                        <asp:ListItem Text="Credit Card" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Pay with Amazon" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Pay with PayPal" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <uc:AmazonPayment runat="server" Visible="False" ID="AmazonPayment" />
                </div>



                <asp:Panel runat="server" ID="pnlCreditCard" Visible="False">
                    <div class="form_line clearfix" runat="server" visible="true">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvCCType" CssClass="cata" runat="server" Display="Dynamic"
                                ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>

                        </div>
                        <label class="label-1 bold">Credit Card Type</label>
                        <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label>
                        <select id="ddlCCType" required="required" name="ddlCCType" runat="server" class="text-1"></select>

                    </div>

                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvCreditCard" CssClass="cata" ControlToValidate="txtCCNumber1" runat="server" Display="Dynamic" ErrorMessage="Please enter valid card number" />
                            <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1 bold">
                            Card Number*</label>
                        <asp:TextBox name="txtCCNumber1" required="required" AutoCompleteType="Disabled" ID="txtCCNumber1" ClientIDMode="Static" runat="server" CssClass="text-1" MaxLength="16" placeholder="*Credit Card Number" autocomplete="off"></asp:TextBox>
                    </div>
                    
                    <div class="form_line clearfix" style="margin-left: -4%;">
                        <div class="error-1c">
                            <asp:RequiredFieldValidator CssClass="cata" ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                            <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-2 bold">
                            CVC* 
                        </label>
                        <input id="txtCvv" required="required" size="4" runat="server" autocomplete="off" clientidmode="Static" class="text-1 text-3" maxlength="4" placeholder="*CVV" />
                        <%--<a class="cvv" href="//d39hwjxo88pg52.cloudfront.net/images/mobile/cvv.png">What is this?</a>--%>

                    </div>
                    
                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNameOnCard" runat="server" Display="Dynamic" ErrorMessage="Please enter valid name" />
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1 bold">
                            Name on Card*</label>

                        <asp:TextBox ID="txtNameOnCard" runat="server" required="required" CssClass="text-1" MaxLength="50" placeholder=""></asp:TextBox>
                    </div>

                    <div class="clear"></div>

                    <div class="form_line clearfix">
                        <div class="error-1b">

                            <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label>
                        </div>
                        <label class="label-1 bold">
                            Expiration Date*</label>

                        <select name="ddlExpMonth" required="required" id="ddlExpMonth" clientidmode="Static" runat="server" class="text-2a">
                        </select>
                        <select name="ddlExpYear" required="required" id="ddlExpYear" runat="server" clientidmode="Static" class="text-2">
                        </select>
                        <div class="error-1">
                            <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" CssClass="cata" Display="Dynamic"
                                ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvExpYear" CssClass="cata" runat="server" Display="Dynamic"
                                ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                            <asp:Label ID="Label2" CssClass="cata" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                    
                    <div class="clear"></div>

                    <div class="main_cart_hdr">Promocode: <input type="text" value="SAVE40" class="text-2 text-promocode" disabled /></div>
                    
                    <div class="clear"></div>

                    <div class="form_line2 clearfix" runat="server" visible="false">
                        <asp:CheckBox ID="cbxSignup" runat="server" CssClass="checkbox-left" Checked="false" />
                        <label class="label-3" for="sbcfShippingBillingCreditForm_cbxSignup">
                            I would like to get product updates and special&nbsp;offers
                        </label>
                    </div>

                    <div class="cart_offer_details_wrap">
                        <div class="cart_offer_details">
                            <asp:Literal runat="server" ID="ltOfferDetails"></asp:Literal>
                        </div>
                        <div class="form_line2 clearfix">
                        <div class="error-1c">
                            <asp:Label ID="lblcbAgree" runat="server" Visible="false"></asp:Label>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please agree to our Terms and Conditions" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                        </div>
                        <asp:CheckBox ID="cbAgree" runat="server" CssClass="checkbox-left" Checked="false" />
                        <label class="label-3b" for="sbcfShippingBillingCreditForm_cbAgree">
                            By checking this box, you are electronically signing your order, agreeing to the terms above and to our general <a href="#pop-terms" class="terms black scored" target="_blank">Terms and Conditions</a>, including our no-commitment auto-replenishment program, and authorizing us to charge payments to the credit card you have provided.
                    
                           
                        </label>
                    </div>
                    </div>


                    

                    <div class="form_line_btn" runat="server" id="dCompleteOrder" visible="False">
                        <div style="display: none;">
                            <asp:ValidationSummary ID="valSum" CssClass="error-1" DisplayMode="List" runat="server" HeaderText="Please fix the below errors: " />
                            <asp:Label runat="server" ID="lblErrorSummary" Visible="False" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                        </div>
                        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/volaire/images/btn_submit.png" CssClass="submit iblock" OnClick="imgBtn_OnClick" />

                    </div>


                </asp:Panel>

                <div>
                    
                    <p class="text-center">
                        <img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/cart-guarantee.png" alt="30 Day Money Back Guarantee - SSL Secured Online Ordering" />
                    </p>
            </div>
     
    </ContentTemplate>
</asp:UpdatePanel>
</fieldset>
</section>

<div id="pop-terms" class="legal" style="display: none;">
    <div class="overlay_content">
        <div class="txt-closex">
            <a href="javascript:void(0);" onclick="$.fancybox.close();">X CLOSE</a>
        </div>
        <!--#include virtual="/Shared/terms-txt.html" -->
    </div>
</div>