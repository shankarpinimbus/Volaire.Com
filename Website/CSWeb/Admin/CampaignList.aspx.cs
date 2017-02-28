using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSData;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.DynamicVersion.Campaigns;

namespace CSWeb.Admin
{
    public partial class CampaignList : BasePage
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
                BindCampaign();

        }


        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

        }
        #endregion Page Load and Pre-Render Events

        #region Common code for the page



        private void BindCampaign()
        {
            dlCampaignList.DataSource = CampaignFactory.GetAllCampaigns();
            dlCampaignList.DataKeyField = "CampaignId";
            dlCampaignList.DataBind();
        }

        #endregion Common code for the page

        #region General Methods

        protected void btnAction_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "AddNew":
                    if (Page.IsValid)
                    {
                        Response.Redirect("CampaignItem.aspx");
                    }
                    break;
                case "Back":
                    Response.Redirect("Main.aspx");
                    break;
            }
        }

        protected void dlVersionList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            int campaignId = (int)dlCampaignList.DataKeys[e.Item.ItemIndex];
            CampaignFactory.RemoveCampaign(campaignId);
            BindCampaign();
        }

        #endregion General Methods

        protected void dlCampaignList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label imgIsDynamic = e.Item.FindControl("imgIsDynamic") as Label;

            Campaign campaignItem = (Campaign)e.Item.DataItem;
            if (campaignItem.Paused)
                imgIsDynamic.Visible = false;

        }
    }
}