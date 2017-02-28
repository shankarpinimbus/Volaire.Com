using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSData;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.Coupon;
using CSBusiness.Resolver;
using CSBusiness.DynamicVersion.Campaigns;


namespace CSWeb.Admin
{
    public partial class CampaignItem : BasePage
    {
        public Campaign CurrentCamp
        {
            get
            {
                if (ViewState["campaign"] != null)
                    return (Campaign)ViewState["campaign"];
                else
                {
                    Campaign camp;
                    if (cId > 0)
                        camp = CampaignFactory.GetCampaign(cId);
                    else
                    {
                        camp = new Campaign();
                        camp.Versions = new List<CampaignVersion>();
                    }
                    ViewState["campaign"] = camp;
                    return camp;
                }
            }
        }
        public int cId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BaseLoad();
            if (Request["cId"] != null)
            {
                cId = Convert.ToInt32(Request["cId"].ToString());
            }
            if (!Page.IsPostBack)
            {
                BindVersions();
                if (cId > 0)
                    GetCampaignInfo();
                BindAvailableVersions();
            }
        }

        protected void GetCampaignInfo()
        {
            txtName.Text = CurrentCamp.Name;
            txtDesc.Text = CurrentCamp.Description;
            lblCreated.Text = CurrentCamp.DateCreated.ToString();
            lblUpdate.Text = CurrentCamp.DateUpdated.ToString();
            ddlType.SelectedValue = CurrentCamp.CampaignType;
            ddlWinningVersion.SelectedValue = CurrentCamp.WinningVersion != null ? CurrentCamp.WinningVersion.VersionId.ToString() : "None";
            cbActive.Checked = CurrentCamp.Active;
            cbPaused.Checked = CurrentCamp.Paused;

            lbSelectedVersions.Items.Clear();
            //lbSelectedVersions.DataSource = campaign.Versions;
            //lbSelectedVersions.DataTextField = "VersionInfo.Title";
            //lbSelectedVersions.DataValueField = "VersionId";
            //lbSelectedVersions.DataBind();

            foreach (CampaignVersion campVersion in CurrentCamp.Versions)
            {
                lbSelectedVersions.Items.Add(new ListItem(campVersion.VersionInfo.Title, campVersion.VersionId.ToString()));
            }
            BindVersionWeight();
        }

        private void BindVersionWeight()
        {
            rptVersions.DataSource = CurrentCamp.Versions;
            rptVersions.DataBind();
        }

        private void BindVersions()
        {
            ddlWinningVersion.Items.Clear();
            ddlWinningVersion.DataSource = CSFactory.GetAllVersion();
            ddlWinningVersion.DataTextField = "Title";
            ddlWinningVersion.DataValueField = "VersionId";
            ddlWinningVersion.DataBind();
            ddlWinningVersion.Items.Insert(0, "None"); 
        }

        private void BindAvailableVersions()
        {
            lbAllVersions.Items.Clear();
            lbAllVersions.DataSource = CSFactory.GetAllVersion().Where(x => lbSelectedVersions.Items.FindByValue(x.VersionId.ToString()) == null);
            lbAllVersions.DataTextField = "Title";
            lbAllVersions.DataValueField = "VersionId";
            lbAllVersions.DataBind();
        }

        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                if (Page.IsValid)
                {
                    Campaign campaign = new Campaign();
                    campaign.Name = txtName.Text;
                    campaign.Description = txtDesc.Text;
                    campaign.Active = cbActive.Checked;
                    campaign.Paused = cbPaused.Checked;
                    campaign.CampaignType = ddlType.SelectedValue;
                    campaign.WinningVersion = new CSBusiness.Version();
                    if (ddlWinningVersion.SelectedIndex > 0)
                        campaign.WinningVersion.VersionId = Convert.ToInt32(ddlWinningVersion.SelectedValue);
                    if (cId > 0)
                        campaign.CampaignId = cId;

                    AddVersions(ref campaign);
                    CampaignFactory.SaveCampaign(campaign);
                    lblSuccess.Visible = true;
                    CampaignManager.InitializeCampaigns();
                }
            }
            if (cId == 0)
                Response.Redirect("CampaignList.aspx");
        }


        private void AddVersions(ref Campaign campaign)
        {
            campaign.Versions = new List<CampaignVersion>();
            foreach (RepeaterItem item in rptVersions.Items)
            {
                CampaignVersion campVersion = new CampaignVersion();
                campVersion.VersionId = Convert.ToInt16(((HiddenField)item.FindControl("hfCampId")).Value);
                campVersion.Weight = Convert.ToDecimal(((TextBox)item.FindControl("txtWeight")).Text); 
                campaign.Versions.Add(campVersion);
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            for (int item = lbAllVersions.Items.Count - 1; item >= 0; item--)
            {
                if (lbAllVersions.Items[item].Selected)
                {
                    lbSelectedVersions.Items.Add(lbAllVersions.Items[item]);

                    //Save new version for version weight list
                    CSBusiness.Version ver = new CSBusiness.Version();
                    ver.VersionId = Convert.ToInt32(lbAllVersions.Items[item].Value);
                    ver.Title = lbAllVersions.Items[item].Text;
                    CampaignVersion campVer = new CampaignVersion();
                    campVer.VersionId = ver.VersionId;
                    campVer.VersionInfo = ver;
                    CurrentCamp.Versions.Add(campVer);
                    BindVersionWeight();

                     lbAllVersions.Items.RemoveAt(item);
               }
            }
            SortItems(lbSelectedVersions);
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            for (int item = lbSelectedVersions.Items.Count - 1; item >= 0; item--)
            {
                if (lbSelectedVersions.Items[item].Selected)
                {
                    lbAllVersions.Items.Add(lbSelectedVersions.Items[item]);
                    CurrentCamp.Versions.RemoveAll(x => x.VersionId == Convert.ToInt32(lbSelectedVersions.Items[item].Value));
                    BindVersionWeight();

                    lbSelectedVersions.Items.RemoveAt(item);
                }
            }
            SortItems(lbAllVersions);
        }

        private void SortItems(ListBox ListBoxToSort)
        {
            List<ListItem> list = new List<ListItem>(ListBoxToSort.Items.Cast<ListItem>());
            list = list.OrderBy(li => li.Text).ToList<ListItem>();
            ListBoxToSort.Items.Clear();
            ListBoxToSort.Items.AddRange(list.ToArray<ListItem>());
        }


        protected void rptVersions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            CSBusiness.Version version = e.Item.DataItem as CSBusiness.Version;

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblTitle = e.Item.FindControl("lblSkuTitle") as Label;
                Label lblSkuId = e.Item.FindControl("lblSkuId") as Label;
                TextBox txtPercentage = (TextBox)e.Item.FindControl("txtPercentage");

                //lblTitle.Text = version.Title;

                //txtPercentage.Text =  ;
            }

        }

    }
}