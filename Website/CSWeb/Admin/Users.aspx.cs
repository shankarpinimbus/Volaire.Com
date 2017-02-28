using System;
using System.Web.UI;
using CSBusiness;
using CSBusiness.Resolver;
using CSBusiness.Shipping;
using System.Web;
using System.Web.UI.WebControls;

namespace CSWeb.Admin
{
    public partial class Users : BasePage
    {
        public int totalCount = 0;
        public int ClientAdminUserType = (int)UserTypeEnum.ClientAdmin;
        public int AdminUserType = (int)UserTypeEnum.Admin;
        public int userTypeId = 0; 

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CSVal"];
            if(cookie!=null)
                userTypeId = Convert.ToInt32(cookie.Value);

            if (!Page.IsPostBack)
            {
                this.BaseLoad();
                BindCustomers(string.Empty, string.Empty, string.Empty);
            }
        }

        protected void lblCustomer_Search(object sender, EventArgs e)
        {

            BindCustomers(txtFirstName.Text, txtLastName.Text, txtEmail.Text);
        }
      
        protected void BindCustomers(string firstName, string lastName, string email)
        {
            int userTypeId = (int)UserTypeEnum.Admin + (int)UserTypeEnum.ClientAdmin;
            dlCustomerList.DataSource = CSResolve.Resolve<ICustomerService>().GetAllCustomers(firstName, lastName, email, userTypeId, 1, 1000, out totalCount);
            dlCustomerList.DataKeyField = "customerId";
            dlCustomerList.DataBind();
        }

        protected void dlUserList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            int userId = (int)dlCustomerList.DataKeys[e.Item.ItemIndex];
            switch (e.CommandName)
            {
                case "Delete":

                    CSResolve.Resolve<ICustomerService>().RemoveUser(userId);
                    break;
            }
            lblDelUserSuccess.Visible = true;
            BindCustomers(txtFirstName.Text, txtLastName.Text, txtEmail.Text);
        }
    }
}