using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using CSBusiness;
using CSCore.DataHelper;
using System.Data.SqlClient;


namespace CSWebBase
{
    public class ReportsDAL
    {
        public static DataTable GetAgeReport(DateTime StartDate, DateTime EndDate)
        {
            DataTable DT1 = new DataTable();
            SqlDataReader reader = DBGetAgeReport(StartDate, EndDate);
            if (reader.HasRows)
            {
                DT1 = new DataTable();
                DT1.Load(reader);
            }
            else
            {
                DT1 = null;
            }
            return DT1;
        }

        public static SqlDataReader DBGetAgeReport(DateTime StartDate, DateTime EndDate)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_report_order_Age";
            SqlParameter[] ParamVal = new SqlParameter[2];
            ParamVal[0] = new SqlParameter("@StartDate", StartDate);
            ParamVal[1] = new SqlParameter("@EndDate", EndDate);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);
        }

        public static DataTable GetCustomReport(DateTime? StartDate, DateTime? EndDate)
        {
            DataTable DT1 = new DataTable();
            SqlDataReader reader = DBGetCustomReport(StartDate, EndDate);
            if (reader.HasRows)
            {
                DT1 = new DataTable();
                DT1.Load(reader);
            }
            else
            {
                DT1 = null;
            }
            return DT1;
        }

        public static SqlDataReader DBGetCustomReport(DateTime? StartDate, DateTime? EndDate)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_report_order_Custom";
            SqlParameter[] ParamVal = new SqlParameter[2];
            ParamVal[0] = new SqlParameter("@StartDate", StartDate.Value);
            ParamVal[1] = new SqlParameter("@EndDate", EndDate.Value);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);
        }
    }
}
