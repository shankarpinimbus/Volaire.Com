<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerreport.aspx.cs" EnableEventValidation="false"
    Inherits="CSWeb.Admin.customerreport" EnableViewState="true" EnableSessionState="true" %>

<%@ Register TagPrefix="usercontrols" TagName="RangeDateControl" Src="usercontrols/RangeDateControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=siteName %> - Customer Detail Report</title>
    <script type="text/javascript">
        function removejscssfile(filename, filetype) {
            var targetelement = (filetype == "js") ? "script" : (filetype == "css") ? "link" : "none" //determine element type to create nodelist from
            var targetattr = (filetype == "js") ? "src" : (filetype == "css") ? "href" : "none" //determine corresponding attribute to test for
            var allsuspects = document.getElementsByTagName(targetelement)
            for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
                if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(filename) != -1)
                    allsuspects[i].parentNode.removeChild(allsuspects[i]) //remove element by calling parentNode.removeChild()
            }
        }
    </script>
    <link href="/Styles/midstyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="outerwrap2">
        <div id="header2">
            <div id="logo">
                <img src="//d39hwjxo88pg52.cloudfront.net/images/admin/conversion_logo.png" alt="Conversion Systems" />

            </div>
            <!-- end logo -->
           
            <!-- end log_link -->
            <div id="report_nav">
                <a href="VersionReport.aspx">Version Report</a> | 
                <a href="StandardReport.aspx">Standard Report</a> | 
                <a href="SIdReport.aspx">SID Report</a>  |
                <span class="current">Customer Detail Report</span>            
            </div>
            <div id="log_link">
                <a id="lnk_logout" href="Logout.aspx">Logout</a></div>
        </div>
        <!-- end header -->
        <div id="main2">
            <div id="date2">
                <p class="day">
                    <asp:Literal ID="liHeader" runat="server" /></p>
                <p class="time">
                    <asp:Literal ID="liSubHeader" runat="server" /></p>
            </div>
            <div id="left">
                <div id="client">
                    <h2>
                    </h2>
                    <div id="client_logo">
                        <asp:Image ID="imgLogo" style="max-width: 120px" runat="server"  /></div>
                </div>
                <div id="retrieve_activity">
                    <h2>
                    </h2>
                    <div id="activity_select">
                        <p>
                            Select range:</p>
                        <p>
                            <usercontrols:RangeDateControl ID="rangeDateControlCriteria" runat="server" DisplayDropDown="true" StartDateWidth="115" EndDateWidth="115"
                                LabelStartText="From:" LabelEndText="To:" PostbackFunction="btnSubmit" /> </p>
                        <div class="clear">
                        </div>
                        
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" /></p>
                        <p>
                            <asp:Button ID="btnexportexcel" runat="server" OnClick="btnexportexcel_Click" Text="Export to Excel"  />                            
                        </p>
                        <br/> <div align="center" style="color:red">
                                <asp:Literal ID="litError" runat="server" />
                        </div>
                        <p>
                            &nbsp;
                        </p>
                    </div>
                </div>
            </div>
            <!-- end left -->
            <div id="right2">
      <h2> </h2>                
<div class="clear table_pad2">

      <table class="table table-bordered table-report table-striped summary_table2 summary_table2b " style="width: 100%;">
    <tr class="subheader-row">
        <th width="12%" class="cola">Order ID
        </th>
        <th width="12%" class="colb">Order Date/Time
        </th>
        <th width="14%" class="colc">Billing First Name
        </th>
        <th width="12%" class="cold">Billing Last Name
        </th>
        <th width="10%" class="cole">Total Revenue
        </th>
        <th width="12%" class="colf">Version
        </th>
    </tr>
<asp:DataList runat="server" ID="dlVersionList" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlVersionList_ItemDataBound">
<HeaderTemplate>
  
</HeaderTemplate>
<ItemTemplate>
  <tr>
      <td class="cola"> <%# DataBinder.Eval(Container.DataItem, "OrderId")%> </td>
      <td class="colb"> <%# DataBinder.Eval(Container.DataItem, "CreatedDate")%> </td>
      <td class="colc"><%# DataBinder.Eval(Container.DataItem, "firstname")%> </td>
      <td class="cold"><%# DataBinder.Eval(Container.DataItem, "lastname")%> </td>
      <td class="cole"><%# String.Format("{0:C}", DataBinder.Eval(Container.DataItem, "totalrevenue")) %> </td>
      <td class="colf"><%# DataBinder.Eval(Container.DataItem, "title")%> </td>
  </tr>
  </ItemTemplate>
  <FooterTemplate>       
   
  </FooterTemplate>
</asp:DataList>
       </table>
            </div>
        </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <!-- end outerwrap -->
     </form>
</body>
</html>
