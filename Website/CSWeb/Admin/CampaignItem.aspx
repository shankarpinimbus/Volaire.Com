<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CampaignItem.aspx.cs" Inherits="CSWeb.Admin.CampaignItem" MasterPageFile="AdminSite.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add/Edit Coupon</title>
    <style type="text/css">
        .auto-style1 {
            width: 182px;
        }

        .auto-style3 {
            width: 177px;
        }

        .auto-style4 {
            width: 45px;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <span id="pageid" class="campaign"></span>
    <div id="page-content">
        <ul id="nav-info" class="clearfix">
            <li><a href="main.aspx"><i class="icon-home"></i></a></li>
            <li><i class="icon-star"></i>Catalog</li>
            <li>Campaigns</li>
            <li>Campaign</li>
        </ul>
        <h3 class="page-header page-header-top">Campaign</h3>

        <p>
            <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="text-error"
                ValidationGroup="valError" DisplayMode="List" />


            <div class="form-horizontal form-box">


                <h4 class="form-box-header">Campaign Details
                    <div style="margin-left: 10px; display: inline; font-style: normal;">
                        <asp:Label ID="lblSuccess" runat="server" Text="Changes Saved!" Visible="false" CssClass="label label-success"></asp:Label>
                        <asp:Label ID="lblCancel" runat="server" Text="Changes Cancelled!" Visible="false" CssClass="label label-important"></asp:Label>
                    </div>
                </h4>


                <div class="form-box-content">

                    <div class="control-group">
                        <label class="control-label">
                            Is Paused?<br>
                        </label>
                        <div class="controls">
                            <label class="checkbox">
                                <asp:CheckBox ID="cbPaused" runat="server" />
                            </label>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Campaign Name</label>
                        <div class="controls">
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" Display="Dynamic" ErrorMessage="Name is a required field." ControlToValidate="txtName">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" runat="server" MaxLength="150" CssClass="input-large" /><span class="help-inline"><code>required</code></span>
                        </div>
                    </div>


                    <div class="control-group">
                        <label class="control-label">Campaign Type</label>
                        <div class="controls">
                            <asp:DropDownList runat="server" ID="ddlType" CssClass="input-large">
                                <asp:ListItem Value="A/B Testing">A/B Testing</asp:ListItem>
                                <asp:ListItem>Multi Variate</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Winning Version:</label>
                        <div class="controls">
                            <asp:DropDownList runat="server" ID="ddlWinningVersion" CssClass="input-large" />
                        </div>
                    </div>

                    <div class="control-group">
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style3">Available Versions:</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td>Selected Versions</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style3">
                                    <asp:ListBox ID="lbAllVersions" runat="server" Height="200px" Width="160px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                                <td class="auto-style4">
                                    <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="=&gt;" />
                                    <br />
                                    <br />
                                    <asp:Button ID="btnRemove" runat="server" OnClick="btnRemove_Click" Text="&lt;=" />
                                </td>
                                <td>
                                    <asp:ListBox ID="lbSelectedVersions" runat="server" Height="200px" Width="160px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style3">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>

                    <div class="control-group">
                        <asp:Panel ID="pnlVersionWeights" runat="Server">
                            <asp:Repeater ID="rptVersions" runat="server" OnItemDataBound="rptVersions_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="control-group">
                                        <div class="controls">
                                            <table class="table table-bordered table-striped" style="width:400px">
                                                <thead>
                                                    <tr>
                                                        <th>Version
                                                        </th>
                                                        <th>Weight
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                <%# ((CSBusiness.Version)DataBinder.Eval(Container.DataItem,"VersionInfo")).Title %>            
                                        </td>
                                        <td>
                                            <asp:HiddenField ID="hfCampId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"VersionId")%>' />
                                            <asp:TextBox ID="txtWeight" runat="server" CssClass="input-mini" MaxLength="5" Text='<%# ((decimal)DataBinder.Eval(Container.DataItem,"Weight")).ToString("N") %>' />
                                            <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtWeight" ID="valReqCartDesc" CssClass="text-error" ValidationGroup="valError" ErrorMessage="Weight is a required field.">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtWeight" Type="Double" ErrorMessage="Weight must be between 0 and 100." Operator="LessThanEqual" ValidationGroup="valError" CssClass="text-error" ValueToCompare="100">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                            </table>
                            </div> </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Description</label>
                        <div class="controls">
                            <asp:TextBox ID="txtDesc" runat="Server" Width="340px" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">
                            Is Active?<br>
                        </label>
                        <div class="controls">
                            <label class="checkbox">
                                <asp:CheckBox ID="cbActive" runat="server" />
                            </label>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">
                            Created:<br>
                        </label>
                        <div class="controls">
                            <label class="checkbox">
                                <asp:Label ID="lblCreated" runat="server" />
                            </label>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">
                            Last Update:<br>
                        </label>
                        <div class="controls">
                            <label class="checkbox">
                                <asp:Label ID="lblUpdate" runat="server" />
                            </label>
                        </div>
                    </div>

                    <div class="form-actions">
                        <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-danger" CommandName="Cancel" CausesValidation="false" OnCommand="btnAction_Command"><i class="icon-ban-circle"></i> Cancel</asp:LinkButton>

                        <asp:LinkButton runat="server" ID="btnSave" CssClass="btn btn-success" CommandName="Save" OnCommand="btnAction_Command" CausesValidation="true" ValidationGroup="valError"><i class="icon-save"></i> Save</asp:LinkButton>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
