<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactUs_PlaceHolder.ascx.cs" Inherits="CSWeb.Root.UserControls.ContactUs_PlaceHolder" %>


    <p style="padding: 0px 0 0 20px; margin: 0;">
                        <asp:Label ID="haserrors" runat="server" Visible="False" CssClass="error">
						Please correct the following errors:
                        </asp:Label>
                        <asp:Label ID="Success" runat="server" Visible="False" CssClass="orange bold f18">
                    	Thank you for submitting your inquiry.<br />
                        </asp:Label>
                    </p> 


     <div id="contact_form">  

  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="address_table">
  
  <tr>
    <td><span class="error"> <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ID="rfvFistName"
                                ErrorMessage="* First Name is required" EnableClientScript="true" Display="Dynamic"
                                Text="* First Name is required" ValidationGroup="Group1"  /></span>

     <asp:TextBox ID="txtFirstName" runat="server" CssClass="address_input" MaxLength="100" placeholder="First Name*" /></td>
    <td>
     <span class="error"><asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ID="rfvLastName"
                                ErrorMessage="* Last Name is required" EnableClientScript="true" Display="Dynamic"
                                Text="* Last Name is required" ValidationGroup="Group1" /></span>
  
      <asp:TextBox ID="txtLastName" runat="server" CssClass="address_input" MaxLength="100"  placeholder="Last Name*" />
     
      </td>
  </tr>
  <tr>
    <td>
    <span class="error">
     <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ID="rfvEmail"
                                ErrorMessage="* Email is required" EnableClientScript="true" Display="Dynamic"
                                Text="* Email is required" ValidationGroup="Group1" />
                            <asp:RegularExpressionValidator ID="rfvEmailReg" runat="server" ControlToValidate="txtEmail"
                                Display="Dynamic" Text="* Valid email is require" ErrorMessage="* Valid email is required" ext="*" 
                                ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />                        
    </span>
 
     
       <asp:TextBox ID="txtEmail" runat="server" CssClass="address_input" MaxLength="100" placeholder="Email Address*" />
      </td>
    <td>
     <span class="error">

      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailReType" ID="RequiredFieldValidator1"
                                ErrorMessage="* You must retype your Email address" EnableClientScript="true" Display="Dynamic"
                                Text="* You must retype your Email address" ValidationGroup="Group1" />
                                <asp:CompareValidator runat="server" ControlToValidate="txtEmailReType" ControlToCompare="txtEmail" ID="CompareValidator" 
                                ErrorMessage="*Email Address does not match" EnableClientScript="true" Display="Dynamic" Text="Email does not match"></asp:CompareValidator>
     </span>
    
    <asp:TextBox ID="txtEmailReType"  CssClass="address_input" runat="server" placeholder="Retype Email Address*"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td>
      <asp:TextBox ID="txtPhone" CssClass="address_input" runat="server" placeholder="Phone Number"></asp:TextBox></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
    <span class="error">
     <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" ID="RequiredFieldValidator5"
                                ErrorMessage="* Please type your message" EnableClientScript="true" Display="Dynamic"
                                Text="* Please type your message" ValidationGroup="Group1"  /></span>
  

     <asp:TextBox ID="txtMessage" CssClass="address_input2" runat="server" TextMode="MultiLine" Columns="20" Rows="2" placeholder="Comments*"></asp:TextBox>
      </td>
    </tr>
  <tr>
    <td colspan="2"><asp:ImageButton ID="ImageButtonSubmit" src="/content/images/submit_btn.jpg"
                                    ValidationGroup="Group1"   runat="server" OnClick="btnContactSubmit" /></td>
  </tr>
 
  </table>

  </div>