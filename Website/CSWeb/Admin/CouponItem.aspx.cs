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


namespace CSWeb.Admin
{
    public partial class CouponItem : BasePage
    {
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
                BindDiscountType();
                if (cId > 0)
                    GetCouponInfo();
            }
        }

        protected void GetCouponInfo()
        {
            CouponInfo cItem = CSFactory.GetCoupon(cId);
            txtDiscountTitle.Text = cItem.Title;
            txtPercentage.Text = Math.Round(cItem.Discount, 2).ToString();
            txttotalAmount.Text = Math.Round(cItem.TotalAmount, 2).ToString();
            txtMinAmount.Text = Math.Round(cItem.MinAmount, 2).ToString();
            ddlDiscountType.ClearSelection();
            ddlDiscountType.Items.FindByValue(((int)cItem.DiscountType).ToString()).Selected = true;
            cbIncludeShipping.Checked = cItem.IncludeShipping;
            BindCouponFields();
            //if(cItem.)
            List<CouponItems> items = cItem.ItemsDiscount;
            foreach (CouponItems itemInfo in items)
            {
                ddlSkuList.SelectedValue = itemInfo.SkuId.ToString();
                txtItemDiscount.Text = itemInfo.DiscountAmount.ToString("n2");
                ddlItemDiscountType.Items.FindByValue(((int)itemInfo.DiscountType).ToString()).Selected = true;
            }
        }

        protected void ddlDiscountType_OnSelectedIndexChanged(object sender, System.EventArgs e)
        {
            int itemType = Convert.ToInt32(ddlDiscountType.SelectedItem.Value);
            dAmount.Visible = true;
            dPercentage.Visible = true;
            dIncludeShipping.Visible = true;
            txttotalAmount.Visible = true;
            pnlItem.Visible = false;
            BindCouponFields();


        }

        protected void BindCouponFields()
        {
            pnlItem.Visible = false;
            dFreeShipping.Visible = false;
            dAmount.Visible = false;
            dPercentage.Visible = false;
            dIncludeShipping.Visible = false;
            int itemType = Convert.ToInt32(ddlDiscountType.SelectedItem.Value);
            if (itemType == (int)CouponTypeEnum.ItemType)
            {
                pnlItem.Visible = true;
                rfvPercentage.Enabled = false;
                cmpPercentage.Enabled = false;
                txtPercentage.Text = "";
                txttotalAmount.Text = "";
                dFreeShipping.Visible = false;
                dAmount.Visible = false;
                dPercentage.Visible = false;
                dIncludeShipping.Visible = false;
                BindItemDiscountType();
                BindSkus();
                //ddlSkuList.SelectedValue = itemType.

            }
            else if (itemType == (int)CouponTypeEnum.Percentage /*|| itemType == (int)CouponTypeEnum.NoSalesTaxAndPercentage || itemType == (int)CouponTypeEnum.FreeShippingAndPercentage*/)
            {
                txttotalAmount.Text = "";
                dAmount.Visible = false;
            }
            else if (itemType == (int)CouponTypeEnum.Amount/* || itemType == (int)CouponTypeEnum.NoSalesTaxAndAmount || itemType == (int)CouponTypeEnum.FreeShippingAndAmout*/)
            {
                txtPercentage.Text = "";
                dAmount.Visible = true;
                //txtPercentage.Visible = false;
                //cbIncludeShipping.Visible = false;
                dPercentage.Visible = false;
                dIncludeShipping.Visible = false;
            }
            else if (itemType == (int)CouponTypeEnum.FreeShipping || itemType == (int)CouponTypeEnum.NoSalesTax)
            {
                txtPercentage.Text = "";
                txttotalAmount.Text = "";
                dAmount.Visible = false;
                dPercentage.Visible = false;
                dIncludeShipping.Visible = false;
                dFreeShipping.Visible = true;
            }
            else
            {
                rfvPercentage.Enabled = true;
                cmpPercentage.Enabled = true;
                pnlItem.Visible = false;
            }
        }

        private void BindDiscountType()
        {

            ddlDiscountType.Items.Clear();
            ddlDiscountType.DataSource = CommonHelper.BindToEnum(typeof(CouponTypeEnum));
            ddlDiscountType.DataTextField = "Key";
            ddlDiscountType.DataValueField = "Value";
            ddlDiscountType.DataBind();
            ddlDiscountType.Items.FindByValue("1").Selected = true;

        }

        protected void BindSkus()
        {
            List<Sku> skuItems = CSResolve.Resolve<ISkuService>().GetAllSkus();
            ddlSkuList.DataSource = skuItems;
            ddlSkuList.DataTextField = "SkuTitleCode";
            ddlSkuList.DataValueField = "SkuId";
            ddlSkuList.DataBind();

            //ddlRelatedSkuList.DataSource = skuItems;
            //ddlRelatedSkuList.DataTextField = "SkuTitleCode";
            //ddlRelatedSkuList.DataValueField = "SkuId";
            //ddlRelatedSkuList.DataBind();

        }

        private void BindItemDiscountType()
        {

            ddlItemDiscountType.Items.Clear();
            ddlItemDiscountType.DataSource = CommonHelper.BindToEnum(typeof(CouponItemEnum));
            ddlItemDiscountType.DataTextField = "Key";
            ddlItemDiscountType.DataValueField = "Value";
            ddlItemDiscountType.DataBind();
            //ddlItemDiscountType.Items.Remove("ItemType");
            //ddlItemDiscountType.Items.Remove("FreeShipping");
            //ddlItemDiscountType.Items.Remove("NoSalesTax");

        }

        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                if (Page.IsValid)
                {
                    decimal totalAmount = 0, percentage = 0, itemDiscount = 0, minAmount = 0;
                    int skuId = 0, relatedskuId = 0, itemDiscountType = 0;
                    if (txttotalAmount.Text.Length > 0)
                    {
                        itemDiscount = Convert.ToDecimal(txttotalAmount.Text);
                        totalAmount = itemDiscount;
                    }

                    if (txtPercentage.Text.Length > 0)
                        percentage = Math.Round(Convert.ToDecimal(txtPercentage.Text), 2);

                    if (txtItemDiscount.Text.Length > 0)
                        itemDiscount = Math.Round(Convert.ToDecimal(txtItemDiscount.Text), 2);

                    if (txtMinAmount.Text.Length > 0)
                        minAmount = Math.Round(Convert.ToDecimal(txtMinAmount.Text), 2);

                    if (Convert.ToInt32(ddlDiscountType.SelectedValue) == (int)CouponTypeEnum.ItemType)
                    {
                        skuId = Convert.ToInt32(ddlSkuList.SelectedItem.Value);
                        relatedskuId = 0;
                        itemDiscountType = Convert.ToInt32(ddlItemDiscountType.SelectedValue);
                        itemDiscount = Math.Round(Convert.ToDecimal(txtItemDiscount.Text), 2);
                    }


                    CSFactory.UpdateCoupon(cId, CommonHelper.fixquotesAccents(txtDiscountTitle.Text.Trim()),
                        percentage, totalAmount, Convert.ToInt32(ddlDiscountType.SelectedValue),
                        skuId, relatedskuId, itemDiscountType, itemDiscount, true, cbIncludeShipping.Checked, minAmount);

                    //CSFactory.ResetCouponCache();

                }
            }

            Response.Redirect("CouponList.aspx");
        }

        protected void dlSkuCouponList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            CouponInfo couponItem = e.Item.DataItem as CouponInfo;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                ITextControl lblTitle = e.Item.FindControl("lblTitle") as ITextControl;
                ITextControl lblStatus = e.Item.FindControl("lblStatus") as ITextControl;
                ITextControl lblDiscount = e.Item.FindControl("lblDiscount") as ITextControl;
                ITextControl lblDiscountType = e.Item.FindControl("lblDiscountType") as ITextControl;
                ITextControl lblTotalAmount = e.Item.FindControl("lblTotalAmount") as ITextControl;
                LinkButton lbRemove = e.Item.FindControl("lbRemove") as LinkButton;
                HyperLink hlEditLink = e.Item.FindControl("hlEditLink") as HyperLink;
                lblTitle.Text = couponItem.Title;

                lblTotalAmount.Text = String.Format("{0:C}", couponItem.TotalAmount);
                lblStatus.Text = couponItem.Active ? "Active" : "Inactive";
                if ((int)couponItem.DiscountType == 1)
                {
                    lblDiscountType.Text = "%";
                    lblDiscount.Text = String.Format("{0:0.##}%", Math.Round(couponItem.Discount, 2));
                }
                else
                {
                    lblDiscountType.Text = "$";
                    lblDiscount.Text = String.Format("{0:C}", couponItem.Discount);
                }
                hlEditLink.NavigateUrl = "CouponItem.aspx?cId=" + couponItem.CouponId;

            }


        }


        protected void dlSkuCouponList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            int couponId = (int)dlSkuCouponList.DataKeys[e.Item.ItemIndex];
            switch (e.CommandName)
            {
                case "Delete":
                    CSFactory.RemoveCoupon(couponId);
                    BindItemDiscountType();
                    break;

            }
        }
    }
}