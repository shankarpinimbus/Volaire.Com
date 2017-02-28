using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.CustomerManagement;
using CSBusiness.Resolver;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.Shipping;
using System.Collections;

namespace CSWeb.Admin
{
    public partial class AddNewSiteDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                if (Page.IsValid)
                {        
                    string newDB = txtNewSiteName.Text;
                    string BaseDB = "CsBaseEcommerce";
                    string BaseDBLog = BaseDB + "_log";
                    string newDBmdfFilePath = "D:\\Data\\" + newDB + ".mdf";
                    string newDBldfFilePath = "D:\\Data\\" + newDB + ".ldf";
                    string BaseDBFilePath = "D:\\" + BaseDB + ".bak";
                    string NewDBLog = newDB + "_log";
                    CSResolve.Resolve<INewSiteDB>().AddNewSiteDB(newDB,BaseDB,BaseDBLog,newDBmdfFilePath,newDBldfFilePath,BaseDBFilePath,NewDBLog);                   
                }             
                lblSuccess.Visible = true;
                
            }
            else if (e.CommandName == "Cancel")
            {
                txtNewSiteName.Text = "";
                lblSuccess.Visible = false;
                Response.Redirect("Main.aspx");
            }                            
        }
    }
}