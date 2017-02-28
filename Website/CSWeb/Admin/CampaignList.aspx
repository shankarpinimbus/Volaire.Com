<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CampaignList.aspx.cs" Inherits="CSWeb.Admin.CampaignList" MasterPageFile="AdminSite.master" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Campaigns</title>
   
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <span id="pageid" class="Campaigns"></span>
    <div id="page-content">
<ul id="nav-info" class="clearfix">
<li><a href="main.aspx"><i class="icon-home"></i></a></li>
<li><i class="icon-star"></i> Catalog</li>
<li><i class="icon-list"></i> Campaigns</li>
</ul>
<h3 class="page-header page-header-top">Campaigns</h3>

<div class="row-fluid" style="margin-bottom: 12px">
<asp:ValidationSummary CssClass="text-error" ID="valError" runat="server" ShowSummary="True" DisplayMode="List" />
</div>
               <!-- Toolbar -->
                    <div class="push">
             <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="btn btn-success" OnCommand="btnAction_Command" CommandName="AddNew"><i class="icon-plus"></i> Add New Campaign</asp:LinkButton> 
                   
      </div>
                    <!-- END Toolbar -->
       
                
    <table class="table table-striped table-bordered">
<thead>
  <tr>
 <th class="span1">Running?</th>
 <th class="span4">Campaign Name</th>
 <th class="span3">Campaign Type</th>
 <th class="span3">Winning Version</th>
 <th class="span1">Created</th>
 <th class="span1">Last Update</th>
 <th class="span1 text-center">Status</th>
 <th class="span1 text-center">Options</th>
 </tr><tbody>
        <asp:DataList runat="server" ID="dlCampaignList" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlCampaignList_ItemDataBound" OnItemCommand="dlVersionList_ItemCommand" >
            <ItemTemplate>
                <tr>
                    <td class="span1 text-center">
                      <asp:Label runat="server" ID="imgIsDynamic"><span class="btn btn-mini btn-info"><i class="icon icon-check"></i></span></asp:Label>  
                    </td>
                    <td class="span4">
                        <%# DataBinder.Eval(Container.DataItem,"Name") %>
                    </td>
                    <td class="span3">
                        <%# DataBinder.Eval(Container.DataItem,"CampaignType") %>
                    </td>
                    <td class="span3">
                        <%#  DataBinder.Eval(((CSBusiness.DynamicVersion.Campaigns.Campaign)Container.DataItem).WinningVersion,"Title") %>
                    </td>
                     <td class="span2">
                        <%# DataBinder.Eval(Container.DataItem,"DateCreated") %>
                    </td>
                     <td class="span2">
                        <%# DataBinder.Eval(Container.DataItem,"DateUpdated") %>
                    </td>
                     <td class="span1">
                        <%# ((bool)DataBinder.Eval(Container.DataItem,"Active"))?"Active":"Inactive" %>
                    </td>
                    <td class="span1 text-center"><div class="btn-group">
                       <a class="btn btn-mini btn-success" href="<%# DataBinder.Eval(Container.DataItem,"CampaignId","CampaignItem.aspx?cid={0}") %>"><i class="icon-pencil"></i></a>
                        <asp:LinkButton CssClass="btn btn-mini btn-danger" ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Campaign?')" ToolTip="Delete this Campaign"><i class="icon-remove"></i></asp:LinkButton>
                    </div>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
     </tbody>
    </table>

 </div>
                <!-- END Page Content -->

</asp:Content>
