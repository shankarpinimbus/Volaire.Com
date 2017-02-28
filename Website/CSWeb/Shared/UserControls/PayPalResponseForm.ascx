<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Shared.UserControls.PayPalResponseForm" CodeBehind="PayPalResponseForm.ascx.cs" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
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
<%--<asp:UpdatePanel ID="upBillingForm" runat="server">
    <ContentTemplate>--%>    
        <div class="cartA">        
            <div class="form_line clearfix">
                
                </div>
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
               
                <label class="label-1">
                    Billing Address*</label>
                <input id="txtAddress1" runat="server" MaxLength="30" class="text-1 billingad1" placeholder="" type="text" required="required" />
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
                    <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Country*</label>
                <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Code" DataValueField="COUNTRYID"
                    AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                    CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
               
                <label class="label-1">
                    State*</label>
  <select name="ddlState" id="ddlState" runat="server" DataTextField="NAME" class="text-1" required="required"
                    size="1"></select>
                
            </div>
              
            <div class="form_line clearfix">
                <div class="error-1">
                               
                                <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label>
                            </div>       
                <label class="label-1">
                    Zip Code*</label>
                <input type="text" required="required" ID="txtZipCode" runat="server" MaxLength="7" class="text-1" placeholder="" />
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                  
                    <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Phone*</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="3" CssClass="text-4"></asp:TextBox>
                             
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                   <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Email*</label>
                                <input required="required" title="" pattern="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" id="txtEmail" runat="server" class="text-1" maxlength="100" placeholder="" />

            </div>
              <div class="form_line clearfix" style="padding-bottom: 0">
            <label class="label-1"></label>
            <p class="text-1" style="text-align:center"><em>We respect your privacy</em></p>
            </div>
            <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label></div>
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
            <div class="form_line clearfix" style="display: none">
                <div class="error-2">
                    Error</div>
                <label class="label-3">
                    Choose*</label>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="choosetable">
                    <tr>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                choice 1</label><input type="radio" />
                        </td>
                        <td>
                            <label>
                                choice 2</label><input type="radio" />
                        </td>
                        <td>
                            <label>
                                choice 3</label><input type="radio" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form_line clearfix" style="margin-left: 6px; padding-top: 10px;">
                <div class="error-2">
                    </div>
                <label class="label-3" style="text-align:center">
                    Is your shipping address different from your billing address?
</label>                
                   <%-- <asp:RadioButtonList ID="rblShippingDifferent" runat="server" OnSelectedIndexChanged="rblShippingDifferent_CheckedChanged"
        CssClass="text-5" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="124">
        <asp:ListItem Value="true">Yes</asp:ListItem>
        <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
    </asp:RadioButtonList>--%>
     <asp:CheckBox ID="cbShippingSame" runat="server" CssClass="checkbox-right" OnCheckedChanged="cbShippingSame_CheckedChanged"
            AutoPostBack="true" Checked="true" />
            </div>
               <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                   
                        <asp:Label ID="lblShippingFirstName" runat="server" Visible="false">
                        </asp:Label>
                   
                    <label class="label-1">
                        First Name*</label>
                    <input type="text" required="required" ID="txtShippingFirstName" runat="server" MaxLength="14" class="text-1" placeholder="" />
                </div>
                <div class="form_line clearfix">
                    
                    <label class="label-1">
                        Last Name*</label>
                    <input type="text" required="required" ID="txtShippingLastName" runat="server" MaxLength="14" class="text-1" placeholder="" />
                </div>                
                <div class="form_line clearfix">
                    <label class="label-1">
                        Shipping Address*</label>
                     <input type="text" required="required" ID="txtShippingAddress1" runat="server" MaxLength="30" class="text-1" placeholder=""    />
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    </div>
                    <label class="label-1">
                    </label>
                    <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                   
                    <label class="label-1">
                        City*</label>
                    <input type="text" required="required" ID="txtShippingCity" runat="server" MaxLength="30" class="text-1" placeholder="" />
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
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
 <div class="error-1">
                               
                                <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label>
                            </div>      
                    <label class="label-1">
                        Zip Code*</label>
                   <input type="text" required="required" ID="txtShippingZipCode" runat="server" MaxLength="7" class="text-1" placeholder="" />
                </div>
            </asp:Panel>

            <div class="form_line clearfix">
                <label class="label-3">
                    Additional Shipping Charge</label>
                <div class="error-2">                    
                <asp:DropDownList ID="ddlAdditionShippingCharge" runat="server" CssClass="text-2">
                </asp:DropDownList>
            </div>

            <div class="form_line clearfix">
                <label class="label-3">
                    Payment Method</label>
                <div class="error-2">
                    
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
               <select id="ddlCCType" name="ddlCCType" runat="server" class="text-2" required="required"></select>
            </div>
           
            <div class="form_line clearfix">
                <label class="label-3">
                    Credit Card Number</label>
                <div class="error-2">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label></div>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                <td>       <asp:TextBox  name="txtCCNumber1" ID="txtCCNumber1" runat="server" CssClass="text-4" MaxLength="4"  required="required"></asp:TextBox></td>
                
                <td><asp:TextBox name="txtCCNumber2" ID="txtCCNumber2" runat="server" CssClass="text-4" MaxLength="4"  required="required"/></td>
                
                <td><asp:TextBox name="txtCCNumber3" ID="txtCCNumber3" runat="server" CssClass="text-4" MaxLength="4"  required="required"/></td>
                
                <td><asp:TextBox name="txtCCNumber4" ID="txtCCNumber4" runat="server" CssClass="text-4" MaxLength="4"  required="required"/></td>
                         </tr>
                </table>
            </div>
             <div class="form_line clearfix">
                <label class="label-3">
                    Expiration Date</label>
                <div class="error-2">
                
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                               <select name="ddlExpMonth" ID="ddlExpMonth" runat="server" class="text-2" required="required">
                </select>
                <select name="ddlExpYear" ID="ddlExpYear" runat="server" CssClass="text-2" required="required">
                </select>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    CVV2: <a class="cvv" onclick="window.open('/b2/CreditCardCVV2.htm','cvv','width=620,height=400'); return false;">(What is this?)</a>
                </label>
                <div class="error-2">

                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
               <input ID="txtCvv" required="required"  size="4" runat="server" class="text-4" MaxLength="4" placeholder="" />
            </div>
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="https://d37t4f22sfrbdk.cloudfront.net/Images/submit-rush_e2.gif"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
            <div class="form_line_guarantee" style="display:none"><a href="#">View 30-Day Guarantee</a></div>
                             
</div>
        

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
