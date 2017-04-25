using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using CSBusiness.OrderManagement;
using CSBusiness.Preference;
using CSCore.DataHelper;
using CSWeb.Root.UserControls;
using CSCore;
using CSBusiness;
using CSBusiness.PostSale;
using CSWeb.HitLinks;
using CSCore.Utils;
using CSData;
using CSWebBase;

namespace CSWeb.Admin
{
    public partial class customerreport : BasePage
    {
        public Hashtable HitLinkVisitor = new Hashtable();
        public decimal CategoryUniqueVistiors = 0, totalRevenue = 0;
        public int totalOrders = 0;
        public static string siteName = string.Empty;
        public static string siteUrl = string.Empty;
        public static string siteTitle = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindSettings();
            if (!IsPostBack)
            {
                //liHeader.Text = DateTime.Now.ToString("MMMM") + " " + DateTime.Now.Day.ToString() + ", " + DateTime.Now.Year.ToString();
                //liSubHeader.Text = DateTime.Now.DayOfWeek + " " + DateTime.Now.AddHours(3).ToShortTimeString() + " (EST)";

                if (Session["FilterFromDate"] != null && Session["FilterToDate"] != null)
                {
                    rangeDateControlCriteria.StartDateValueLocal = Convert.ToDateTime(Session["FilterFromDate"]);
                    rangeDateControlCriteria.EndDateValueLocal = Convert.ToDateTime(Session["FilterToDate"]);
                }
                else
                {
                    rangeDateControlCriteria.StartDateValueLocal = DateTime.Now.Date;
                    rangeDateControlCriteria.EndDateValueLocal = DateTime.Now.Date;
                }
                BindData(rangeDateControlCriteria.StartDateValueLocal, rangeDateControlCriteria.EndDateValueLocal, false);
            }
        }

        protected void BindData(DateTime? startDate, DateTime? endDate, bool DownLoadExcel)
        {
            DateTime? timezoneStartDate = DateTimeUtil.GetEastCoastStartDate(rangeDateControlCriteria.StartDateValueLocal);
            DateTime? timezoneEndDate = DateTimeUtil.GetEastCoastDate(rangeDateControlCriteria.EndDateValueLocal);

            //Time Zone Converted in Stored Procedure
            DataTable DT_Export_Report = ReportsDAL.GetCustomReport(timezoneStartDate, timezoneEndDate);
            dlVersionList.DataSource = DT_Export_Report;
            dlVersionList.DataBind();

            if (DownLoadExcel)
            {
                string FileName = "Customer_Detail_Report.xls";
                if (DT_Export_Report == null)
                {
                    litError.Text = ResourceHelper.GetResoureValue("ExcelExportErrorMsg");
                    litError.Visible = true;
                }
                else
                {
                    ExporttoExcel(DT_Export_Report, FileName, timezoneStartDate, timezoneEndDate);
                    litError.Visible = false;
                }
            }
        }
        private void ExporttoExcel(DataTable DT_Export_Report, string FileName, DateTime? dtStart, DateTime? dtEnd)
        {
            if (DT_Export_Report != null && DT_Export_Report.Rows.Count > 0)
            {
                string attachment = "attachment; filename=" + FileName;
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.ms-excel";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
                Response.Charset = "windows-1254";
                string tab = "";
                //foreach (DataColumn dc in DT_Export_Report.Columns)
                //{
                //    Response.Write(tab + dc.ColumnName);
                //    tab = "\t";
                //}
                Response.Write(tab + "Order ID ");
                tab = "\t";
                Response.Write(tab + "Order Date");
                Response.Write(tab + "First Name");
                Response.Write(tab + "Last Name");
                Response.Write(tab + "Total Revenue");
                Response.Write(tab + "Version");
                Response.Write("\n");
                int i;
                foreach (DataRow dr in DT_Export_Report.Rows)
                {
                    tab = "";
                    for (i = 0; i < DT_Export_Report.Columns.Count; i++)
                    {
                        Response.Write(tab + dr[i].ToString());
                        tab = "\t";
                    }
                    Response.Write("\n");
                }
                Response.Write("\n");
                Response.End();
            }
        }

        protected void btnexportexcel_Click(object sender, EventArgs e)
        {
            Session["FilterFromDate"] = rangeDateControlCriteria.StartDateValueLocal.Value.ToShortDateString();
            Session["FilterToDate"] = rangeDateControlCriteria.EndDateValueLocal.Value.ToShortDateString();

            BindData(rangeDateControlCriteria.StartDateValueLocal, rangeDateControlCriteria.EndDateValueLocal, true);

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["FilterFromDate"] = rangeDateControlCriteria.StartDateValueLocal.Value.ToShortDateString();
            Session["FilterToDate"] = rangeDateControlCriteria.EndDateValueLocal.Value.ToShortDateString();

            BindData(rangeDateControlCriteria.StartDateValueLocal, rangeDateControlCriteria.EndDateValueLocal, false);
        }

        protected void dlVersionList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
        }
        public void BindSettings()
        {
            if (!Page.IsPostBack)
            {
                SitePref PrefObject = CSFactory.GetSitePreference();
                siteTitle = PrefObject.SiteHeader;
                siteName = PrefObject.SiteName;
                siteUrl = PrefObject.SiteUrl;
                imgLogo.ImageUrl = PrefObject.LogoPath;
            }
        }
    }
}