using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSData;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.DynamicVersion;
using CSCore.Common;

namespace CSWeb.Admin
{
    public partial class VersionList : BasePage
    {


        #region Variable Declaration
        protected bool filter = false;

        #endregion Variable Declaration

        #region Page Load and Pre-Render Events


        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Check Session Validation in BasePage
            this.BaseLoad();
            if (!Page.IsPostBack)
                BindVersion();

        }


        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

        }
        #endregion Page Load and Pre-Render Events

        #region Common code for the page



        private void BindVersion()
        {
            dlVersionList.DataSource = CSFactory.GetAllVersion();
            dlVersionList.DataKeyField = "VersionId";
            dlVersionList.DataBind();
        }

        private void BindVersionCategory()
        {
            ddlCategory.DataSource = CSFactory.GetAllVersionCateogry();
            ddlCategory.DataTextField = "Title";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("Select", ""));
        }

        private void BindModelVersions(string currentVersion, DataListItem dlic)
        {
            DropDownList ddlModelCotnrol;
            //Bind Models Versions
            if (dlic != null)
                ddlModel = (DropDownList)dlic.FindControl("ddlModelEdit");
            else
                ddlModelCotnrol = ddlModel;
            ddlModel.DataSource = CSFactory.GetAllVersion().FindAll(x => x.Title != currentVersion);//x.IsDynamic == false && 
            ddlModel.DataTextField = "Title";
            ddlModel.DataValueField = "VersionID";
            ddlModel.DataBind();
            ddlModel.Items.Insert(0, new ListItem("Select", "-1"));

        }
        #endregion Common code for the page

        #region General Methods

        protected void btnAction_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "AddNew":
                    pnlAddCategory.Visible = true;
                    BindVersionCategory();
                    BindVersion();
                    BindModelVersions("", null);
                    ActivateVersionDropDown(false);
                    rbDesktop1.Checked = false;
                    rbMobile1.Checked = false;
                    rbTablet1.Checked = false;
                    txtShortName.Text = string.Empty;
                    txtTitle.Text = string.Empty;
                    cbDynamic.Checked = false;
                    cbVisible.Checked = true;
                    break;
                case "Cancel":
                    pnlAddCategory.Visible = false;
                    txtTitle.Text = "";
                    ddlCategory.SelectedValue = "";
                    break;
                case "Add":
                    if (Page.IsValid)
                    {
                        CSFactory.SaveVersion(CommonHelper.fixquotesAccents(txtTitle.Text), CommonHelper.fixquotesAccents(txtShortName.Text),
                            cbVisible.Checked, Convert.ToInt32(ddlCategory.SelectedValue)
                            , cbDynamic.Checked, Convert.ToInt32(ddlModel.SelectedValue)
                            , rbDesktop1.Checked, rbTablet1.Checked, rbMobile1.Checked);
                    }
                    VersionManager.LoadVersions();

                    pnlAddCategory.Visible = false;
                    txtTitle.Text = "";
                    ddlCategory.SelectedValue = "";
                    BindVersion();
                    break;

                case "Back":
                    Response.Redirect("Main.aspx");
                    break;

            }

        }



        protected void dlVersionList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            CSBusiness.Version versionItem = e.Item.DataItem as CSBusiness.Version;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HyperLink hlTitle = e.Item.FindControl("hlTitle") as HyperLink;
                ITextControl lblStatus = e.Item.FindControl("lblStatus") as ITextControl;
                ITextControl lblShortName = e.Item.FindControl("lblShortName") as ITextControl;
                ITextControl lblCategoy = e.Item.FindControl("lblCategoy") as ITextControl;
                ITextControl lbModelVersion = e.Item.FindControl("lbModelVersion") as ITextControl;
                Label imgIsDynamic = e.Item.FindControl("imgIsDynamic") as Label;
                GroupRadioButton rbDesktop = (GroupRadioButton)e.Item.FindControl("rbDesktop");
                GroupRadioButton rbTablet = (GroupRadioButton)e.Item.FindControl("rbTablet");
                GroupRadioButton rbMobile = (GroupRadioButton)e.Item.FindControl("rbMobile");

                LinkButton lbRemove = e.Item.FindControl("lbRemove") as LinkButton;
                if (!versionItem.IsDynamic)
                    imgIsDynamic.Visible = false;
                hlTitle.Text = versionItem.Title;
                hlTitle.NavigateUrl = string.Format("~/{0}/", versionItem.Title);
                lblShortName.Text = versionItem.ShortName;
                lbModelVersion.Text = versionItem.ModelVersion;
                lblCategoy.Text = versionItem.CategoryTitle;
                lblStatus.Text = versionItem.Visible ? "Active" : "Inactive";
                rbDesktop.Checked = versionItem.IsDesktopDefault;
                rbTablet.Checked = versionItem.IsTabletDefault;
                rbMobile.Checked = versionItem.IsMobileDefault;

                //Make sure admin mistakenly remove category
                if (versionItem.ShortName.ToLower() == "control")
                    lbRemove.Visible = false;

                if (versionItem.HideRemove)
                    lbRemove.Visible = false;
            }

            if (e.Item.ItemType == ListItemType.EditItem)
            {
                //Bind Categories
                DropDownList ddlEditCategory = (DropDownList)e.Item.FindControl("ddlEditCategory");
                ddlEditCategory.DataSource = CSFactory.GetAllVersionCateogry();
                ddlEditCategory.DataTextField = "Title";
                ddlEditCategory.DataValueField = "CategoryId";
                ddlEditCategory.DataBind();
                ddlEditCategory.Items.Insert(0, new ListItem("Select", ""));
                GroupRadioButton rbDesktop = (GroupRadioButton)e.Item.FindControl("rbDesktop");
                GroupRadioButton rbTablet = (GroupRadioButton)e.Item.FindControl("rbTablet");
                GroupRadioButton rbMobile = (GroupRadioButton)e.Item.FindControl("rbMobile");

                rbDesktop.Checked = versionItem.IsDesktopDefault;
                rbTablet.Checked = versionItem.IsTabletDefault;
                rbMobile.Checked = versionItem.IsMobileDefault;
                if (versionItem.CategoryId > 0)
                {
                    ddlEditCategory.Items.FindByValue(versionItem.CategoryId.ToString()).Selected = true;
                }
                BindModelVersions(versionItem.Title, e.Item);
                if (versionItem.ModelVersionId > 0)
                {
                    ListItem selectedItem = ddlModel.Items.FindByValue(versionItem.ModelVersionId.ToString());
                    if (selectedItem !=null)
                        selectedItem.Selected = true;
                }

            }
        }


        protected void dlVersionList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            int versionId = (int)dlVersionList.DataKeys[e.Item.ItemIndex];
            switch (e.CommandName)
            {
                case "Delete":
                    CSFactory.RemoveVersion(versionId);
                    BindVersion();
                    break;
                case "Edit":
                    dlVersionList.EditItemIndex = e.Item.ItemIndex;
                    BindVersion();
                    break;
                case "Cancel":
                    dlVersionList.EditItemIndex = -1;
                    BindVersion();
                    break;
                case "Update":
                    TextBox txtEditTitle = (TextBox)e.Item.FindControl("txtEditTitle");
                    TextBox txtEditShortName = (TextBox)e.Item.FindControl("txtEditShortName");
                    CheckBox cbVisible = (CheckBox)e.Item.FindControl("cbVisible");
                    CheckBox cbDynamic = (CheckBox)e.Item.FindControl("cbDynamic");
                    DropDownList ddlCategory = (DropDownList)e.Item.FindControl("ddlEditCategory");
                    DropDownList ddlModel = (DropDownList)e.Item.FindControl("ddlModelEdit");
                    GroupRadioButton rbDesktop = (GroupRadioButton)e.Item.FindControl("rbDesktop");
                    GroupRadioButton rbTablet = (GroupRadioButton)e.Item.FindControl("rbTablet");
                    GroupRadioButton rbMobile = (GroupRadioButton)e.Item.FindControl("rbMobile");

                    CSFactory.UpdateVersion(versionId, CommonHelper.fixquotesAccents(txtEditTitle.Text.Trim()),
                        CommonHelper.fixquotesAccents(txtEditShortName.Text), cbVisible.Checked, Convert.ToInt32(ddlCategory.SelectedValue)
                        , cbDynamic.Checked, Convert.ToInt32(ddlModel.SelectedValue), rbDesktop.Checked,rbTablet.Checked,rbMobile.Checked);
                    VersionManager.LoadVersions();
                    dlVersionList.EditItemIndex = -1;
                    BindVersion();
                    break;
            }
        }

        #endregion General Methods

        protected void cbDynamic_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbDynamic = (CheckBox)sender;
            ActivateVersionDropDown(cbDynamic.Checked);
        }

        private void ActivateVersionDropDown(bool isDynamic)
        {
            try
            {
                ddlModel = (DropDownList)dlVersionList.Items[dlVersionList.EditItemIndex].FindControl("ddlModelEdit");
                rfvModel = (CompareValidator)dlVersionList.Items[dlVersionList.EditItemIndex].FindControl("rfvModelEdit");
            }
            catch (Exception)
            {
            }
            ddlModel.SelectedIndex = 0;
            ddlModel.Enabled = isDynamic;
            rfvModel.Enabled = isDynamic;
        }

        protected void dlVersionList_EditCommand(object source, DataListCommandEventArgs e)
        {
            CheckBox cbDynamic = (CheckBox)dlVersionList.Items[dlVersionList.EditItemIndex].FindControl("cbDynamic");
            if (!cbDynamic.Checked)
                ActivateVersionDropDown(cbDynamic.Checked);
        }
    }
}