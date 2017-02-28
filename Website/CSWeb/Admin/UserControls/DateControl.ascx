<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Admin.UserControls.DateControl"
	EnableViewState="True" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<div class="input-append">
<asp:TextBox ID="textboxDate" runat="server" CssClass="input-small" MaxLength="10"
    Columns="12" autocomplete="off" /><span class="add-on"><i class="icon-calendar"></i></span><asp:Image Visible="false" runat="server" ID="calendericon" ToolTip="Calendar" ImageUrl="" />
    </div>
    
    
<ajaxToolkit:CalendarExtender ID="calendarExtenderDate" runat="server" TargetControlID="textboxDate" PopupButtonID="textboxDate" />
<asp:RequiredFieldValidator runat="server" Enabled="false" ControlToValidate="textboxDate"
    ID="valRequired" ErrorMessage="* This field is required" EnableClientScript="true"
    Display="Dynamic" Text="*" />
<asp:CompareValidator runat="server" CssClass="error" ControlToValidate="textboxDate"
    Operator="DataTypeCheck" Display="Dynamic" Type="Date" ID="valValidDate" ErrorMessage="* Date is in an incorrect format"
	Text="*" EnableClientScript="true" />
<asp:CustomValidator CssClass="error" Text="*" runat="server" ID="rangeVal" Display="dynamic"
	OnServerValidate="rangeVal_Validate" />
<asp:RangeValidator CssClass="error" Text="*" ID="rangeValidatorMinMax" Type="Date"
	Display="dynamic" ControlToValidate="textboxDate" runat="server" EnableClientScript="true"/>
