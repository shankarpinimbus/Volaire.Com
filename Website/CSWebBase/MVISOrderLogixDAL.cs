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
    public class MVISOrderLogixDAL
    {

        public static void InsertMVISOrderLogixLog(int OrderID, int PostStatusID, string ErroMessage, int OrderID_MVIS)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_insert_MVISOrderLogixlog";
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@OrderID", OrderID));
            parameters.Add(new SqlParameter("@PostStatusID", PostStatusID));
            parameters.Add(new SqlParameter("@ErroMessage", ErroMessage));
            parameters.Add(new SqlParameter("@OrderID_MVIS", OrderID_MVIS));            
            BaseSqlHelper.ExecuteScalar(connectionString, ProcName, parameters.ToArray());
        }
    }
}
