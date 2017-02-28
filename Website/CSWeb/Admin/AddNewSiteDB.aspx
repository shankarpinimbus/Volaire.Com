<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewSiteDB.aspx.cs" Inherits="CSWeb.Admin.AddNewSiteDB" MasterPageFile="AdminSite.master" EnableViewState="true" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Adding NewSite DB</title>
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <span id="pageid" class="AddNewSite"></span>
    <div id="page-content">
<ul id="nav-info" class="clearfix">
<li><a href="main.aspx"><i class="icon-home"></i></a></li>
    <li><i class="glyphicon-life_preserver"></i></li>
    <li><i class="icon-bar-chart"></i></li>
</ul>
<h3 class="page-header page-header-top">New Site DB</h3>  

<p>
 <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="text-error" 
                 ValidationGroup="valError" DisplayMode="List" />
</p>


    <div class="form-horizontal form-box">


 <h4 class="form-box-header">Create New Site's Database </h4>
        <div style="margin-left: 10px; display: inline; font-style: normal;">
 <asp:Label ID="lblSuccess" runat="server" Text="Changes Saved!" Visible="false" CssClass="label label-success"></asp:Label>

<div class="form-box-content">

 <div class="control-group">
<label class="control-label">New Site Name</label>
<div class="controls">
      <asp:TextBox ID="txtNewSiteName" runat="Server" MaxLength="200" CssClass="input-large" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtNewSiteName" ID="valReqNewSiteName" CssClass="text-error" ValidationGroup="valError" ErrorMessage="First Name is a required field." >*</asp:RequiredFieldValidator><span class="help-inline"><code>required</code></span>
                        </div></div>
            
    
                
                
             <div class="form-actions">    
                        <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btnCancel" CommandName="Cancel" OnCommand="btnAction_Command"><i class="icon-ban-circle"></i> Cancel</asp:LinkButton> 
                 <asp:LinkButton runat="server" ID="btnSave" CommandName="Save" CssClass="btn btn-success" OnCommand="btnAction_Command" CausesValidation="true" ValidationGroup="valError"><i class="icon-plus"></i> Create</asp:LinkButton>
</div>
    </div>
</div>
</div>
</div>
    </asp:Content>
