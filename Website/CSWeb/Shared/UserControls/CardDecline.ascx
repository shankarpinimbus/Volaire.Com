<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Shared.UserControls.CardDecline" CodeBehind="CardDecline.ascx.cs" %>
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
<%--<asp:UpdatePanel ID="upShippingForm" runat="server">
    <ContentTemplate>--%>

        <p class="f18 red bold pad20">Sorry, but there was a problem with your credit card.</p>
        <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
            <tr>
                <td class="horizontal_dots2" colspan="3"></td>
            </tr>
            <tr>

                <td width="76%" valign="top" style="padding-bottom: 20px">
                    <strong>Description</strong>
                </td>
                <td width="12%" valign="top" align="center">
                    <strong>Quantity</strong>
                </td>
                <td width="12%" valign="top">
                    <strong>Total</strong>
                </td>
            </tr>
            <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr>
                        <td valign="top" style="padding-bottom: 20px">
                            <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                        </td>
                        <td valign="top" align="center">
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </td>

                        <td valign="top">$<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%></td>

                    </tr>
                </ItemTemplate>
            </asp:DataList>


            <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
            <tr>
                <td class="horizontal_dots2" colspan="3"></td>
            </tr>
            <tr>
                <td valign="top">&nbsp;
                    
                </td>
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
                <td class="horizontal_dots2" colspan="3"></td>
            </tr>
        </table>

        <div class="cartB">
            <div class="form_line clearfix">
                <div class="error-2">
                    <asp:Label ID="Label2" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <label class="label-2">
                    Do you want to review your shipping address?</label><div
                        class="clear">
                    </div>
                <asp:RadioButtonList ID="rblUpdateShippingAddress" runat="server" OnSelectedIndexChanged="rblUpdateShippingAddress_CheckedChanged"
                    CssClass="checkbox-right" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="124">
                    <asp:ListItem Value="true">Yes</asp:ListItem>
                    <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        First Name*</label>
                     <input ID="txtShippingFirstName" type="text" required="required" runat="server" MaxLength="14" class="text-1" placeholder="" />
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Last Name*</label>
 <input ID="txtShippingLastName" type="text" runat="server" MaxLength="14" class="text-1" placeholder="" required="required"/>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Shipping Address*</label>
                    <input ID="txtShippingAddress1" type="text" runat="server" MaxLength="30" class="text-1" placeholder="" required="required"/>   
                </div>
                <div class="form_line clearfix">
                    
                    <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        City*</label>
                    <input required="required" type="text" ID="txtShippingCity" runat="server" MaxLength="30" class="text-1" placeholder=""/>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        State*</label>
                   <select name="ddlShippingState" required="required" ID="ddlShippingState" runat="server" DataTextField="NAME" class="text-1" size="1" AutoPostBack="true">
                    </select>
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Zip Code*</label>
                   <input required="required" type="text" ID="txtShippingZipCode" runat="server" MaxLength="7" class="text-1" placeholder=""/>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        
                        <asp:Label ID="lblShippingPhoneNumberError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Phone*</label>
                   <asp:TextBox ID="txtPhoneNumber" required="required" runat="server" MaxLength="15" CssClass="text-1" placeholder=""></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                       <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Email*</label>
                                    <input ID="txtEmail"  runat="server" MaxLength="100" class="text-1" placeholder="" required="required" title="" pattern="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"/>

                </div>

            </asp:Panel>
            <div class="form_line clearfix">
                <div class="error-2">
                    <asp:Label ID="LabelError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <label class="label-2">
                    Do you want to review your billing address?</label><div
                        class="clear">
                    </div>
                <asp:RadioButtonList ID="rblUpdateBillingAddress" runat="server" OnSelectedIndexChanged="rblUpdateBillingAddress_CheckedChanged"
                    CssClass="checkbox-right" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="124">
                    <asp:ListItem Value="true">Yes</asp:ListItem>
                    <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        First Name*</label>
                   <input type="text" required ="required" id="txtFirstName" runat="server" MaxLength="14" class="text-1" placeholder=""   />
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Last Name*</label>
                    <input type="text" required ID="txtLastName" runat="server" MaxLength="14" class="text-1" placeholder="" /> 
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Billing Address*</label>
                    <input id="txtAddress1" runat="server" MaxLength="30" class="text-1 billingad1" placeholder="" type="text" required="required" />
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    </div>
                    <label class="label-1">
                    </label>
                    <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                   
                    <label class="label-1">
                        City*</label>
                                    <input type="text" required="required" ID="txtCity" runat="server" MaxLength="30" class="text-1" placeholder="" />
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        State*</label>
                    <asp:DropDownList ID="ddlState" runat="server" DataTextField="NAME" CssClass="text-1" size="1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Zip Code*</label>
                <input type="text" required="required" ID="txtZipCode" runat="server" MaxLength="7" class="text-1" placeholder="" />
                </div>
            </asp:Panel>
            <div class="form_line clearfix">
                <label class="label-3">
                    Credit Card*</label>
                <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label>
                 <select id="ddlCCType" name="ddlCCType" runat="server" class="text-2" required="required"></select>
            </div>
            <div class="form_line clearfix">
                 <div class="error-1">
                    
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label>
                </div>
                <label class="label-3">
                    Exp Date*</label>
                
  <select name="ddlExpMonth" ID="ddlExpMonth" runat="server" class="text-2" required="required">
                </select>
                <select name="ddlExpYear" ID="ddlExpYear" runat="server" CssClass="text-2" required="required">
                </select>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Number*</label>
                <div class="error-2">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
                </div>
<asp:TextBox  name="txtCCNumber1" ID="txtCCNumber1" runat="server" CssClass="text-4" MaxLength="4"  required="required"></asp:TextBox>
                
                <asp:TextBox name="txtCCNumber2" ID="txtCCNumber2" runat="server" CssClass="text-4" MaxLength="4"  required="required"/>
                
                <asp:TextBox name="txtCCNumber3" ID="txtCCNumber3" runat="server" CssClass="text-4" MaxLength="4"  required="required"/>
                
                <asp:TextBox name="txtCCNumber4" ID="txtCCNumber4" runat="server" CssClass="text-4" MaxLength="4"  required="required"/>            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Verification #* 
                </label>
 <div class="error-1">
                            
                            <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label>
                        </div>
                <input ID="txtCvv" required="required"  size="4" runat="server" class="text-4" MaxLength="4" placeholder="" />
            </div>
            <div class="form_line clearfix">
                <label class="label-2">
                    Send me new Product Updates
                    <br />
                    and Special Offers.</strong></label>
                <input type="checkbox" checked="checked" class="checkbox-right" />
            </div>
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d39hwjxo88pg52.cloudfront.net/images/try_it_now_btn.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" OnClientClick="MM_showHideLayers('mask', '', 'show');
" />
            </div>

        </div>


 <%--   </ContentTemplate>
</asp:UpdatePanel>--%>
