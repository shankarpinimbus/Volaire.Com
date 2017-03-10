using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Collections;
using System.Globalization;
using CSCore;
using CSCore.DataHelper;
using CSData.Order;
using CSBusiness.OrderManagement;
using CSBusiness;
using CSCore.Utils;
using HavasEdgeReport.com.hitslink.www;

namespace HavasEdgeReport
{
    class Report 
    {
        private string targetPath = System.Configuration.ConfigurationSettings.AppSettings["targetPath"];

        protected Dictionary<int, List<ReportFields>> dtCollectionList;
        public Hashtable HitLinkVisitor = new Hashtable();
        public int CategoryUniqueVistiors = 0;
        private DataTable _dtOrderInfo = null;
        private DataTable _dtOrderInfo1 = null;
        //DateTime enddate;
        //DateTime startdate;

        static DataSet getsql(string sql)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connstr);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(sql, conn);
            adp.Fill(ds);
            conn.Close();
            return ds;
        }

        static DataTable getDataTable(string StoredProcedureName)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];

            string strMessage;
            SqlCommand oCmd = null;
            SqlDataAdapter da;

            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName;
                oCmd.CommandType = CommandType.StoredProcedure;

                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();

                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMessage = "Problem running procedure:  " + oCmd.CommandText + ". Error---" + ex.Message;
            }
            finally
            {
                if (oCmd != null)
                {
                    oCmd.Parameters.Clear();
                    oCmd.Connection = null;
                    oCmd.Dispose();
                }
            }
            oCmd = null;
            return dt;
        }

        static DataTable getDataTable(string StoredProcedureName, DateTime startDate, DateTime endDate)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];

            bool bReturn = false;
            string strMessage;

            SqlCommand oCmd = null;
            SqlDataAdapter da;
            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName;
                oCmd.CommandType = CommandType.StoredProcedure;
                oCmd.Parameters.Add(new SqlParameter("@startDate", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, startDate));
                oCmd.Parameters.Add(new SqlParameter("@endDate", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, endDate));
                //oCmd.Parameters.Add(new SqlParameter("@VersionID", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, versionID));
                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();
                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMessage = "Problem running procedure:  " + oCmd.CommandText + ". Error---" + ex.Message;
            }
            finally
            {
                if (oCmd != null)
                {
                    oCmd.Parameters.Clear();
                    oCmd.Connection = null;
                    oCmd.Dispose();
                }
            }
            oCmd = null;
            return dt;
        }

        static DataTable getDataTable(string StoredProcedureName, DateTime startDate, DateTime endDate, string Archivedata)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];

            bool bReturn = false;
            string strMessage;

            SqlCommand oCmd = null;
            SqlDataAdapter da;
            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName;
                oCmd.CommandType = CommandType.StoredProcedure;
                oCmd.Parameters.Add(new SqlParameter("@StartDate", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, startDate));
                oCmd.Parameters.Add(new SqlParameter("@EndDate", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, endDate));
                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();
                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMessage = "Problem running procedure:  " + oCmd.CommandText + ". Error---" + ex.Message;
            }
            finally
            {
                if (oCmd != null)
                {
                    oCmd.Parameters.Clear();
                    oCmd.Connection = null;
                    oCmd.Dispose();
                }
            }
            oCmd = null;
            return dt;
        }

        static void runsql(string sql)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connstr);
            conn.Open();
            SqlCommand cm = new SqlCommand(sql, conn);
            cm.ExecuteNonQuery();
            conn.Close();
        }

        public static DateTime EndOfDay(DateTime date)
        {
            return date.AddHours(21).AddMinutes(00).AddSeconds(00);
        }

        public static DateTime StartOfDay(DateTime date)
        {
            return date.AddDays(-1).AddHours(21).AddMinutes(00).AddSeconds(00);
        }

        void CheckDataBase_Connection()
        {
            DataSet DS = getsql("Select * from SKU");
            DataTable DT = DS.Tables[0];
            if (DT.Rows.Count > 0)
            {
                Console.WriteLine(DT.Rows.Count.ToString());
            }
        }

        private void LogToFile(string AdditionalInfo)
        {
            bool bResult = false;
            StreamWriter log;

            StringBuilder sb = new StringBuilder();
            sb.Append(DateTime.Now);
            //if (Error != null)
            //{
            //    sb.Append("Exception error:" + Error.ToString() + "-");
            //}
            sb.Append("-" + AdditionalInfo + "-");
            try
            {
                if (!File.Exists(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]))
                {
                    log = new StreamWriter(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]);
                }
                else
                {
                    log = File.AppendText(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]);
                }
                log.WriteLine(sb.ToString());
                log.Close();
            }
            catch (Exception ex)
            {
                bResult = false;
            }
            //  return bResult;
        }

        public static bool SendMail(MailMessage oMsg)
        {
            SmtpClient client;
            bool bResult = false;
            try
            {
                client = new SmtpClient();                
                //client = new SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["SmtpServer"]);
                //client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
                client.Send(oMsg);
                bResult = true;
            }
            catch (Exception ex)
            {
            }
            return bResult;
        }

        public void SendEmailToAdmin(string ErrorMessage)
        {
            try
            {
                StringBuilder _sbEmailMessageBody = new StringBuilder();
                _sbEmailMessageBody.Append("<html><body><table>");
                _sbEmailMessageBody.Append("<tr><td><b>volaire.com - Havas Report Batch :</b></td></tr>");
                _sbEmailMessageBody.Append("<tr><td>This report was generated at " + DateTime.Now.ToString("MM/dd/yyyy-HH:mm") + "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td>" + ErrorMessage + "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td> Please do not reply to this email.</b></td></tr>");
                _sbEmailMessageBody.Append("</table></body></html>");
                string AdminEmail = System.Configuration.ConfigurationSettings.AppSettings["AdminEmail"];
                string fromEmail = System.Configuration.ConfigurationSettings.AppSettings["fromEmail"];
                MailMessage _oMailMessage = new MailMessage(fromEmail, AdminEmail, "legendzxl.com - Havas Report Generation Status", _sbEmailMessageBody.ToString());
                _oMailMessage.IsBodyHtml = true;
                _oMailMessage.Body = _sbEmailMessageBody.ToString();
                SendMail(_oMailMessage);
            }
            catch (Exception e)
            {
                // log.LogToFile("Error sending email---" + e.Message);
            }
        }

        public void SendEmailToAdmin(string ErrorMessage, Dictionary<string, decimal> orderData, Dictionary<string, int> orderCount, int count)
        {
            try
            {
                StringBuilder _sbEmailMessageBody = new StringBuilder();
                _sbEmailMessageBody.Append("<html><body><table>");
                _sbEmailMessageBody.Append("<tr><td><b>volaire.com - Havas Report Batch :</b></td></tr>");
                _sbEmailMessageBody.Append("<tr><td>This report was generated at " + DateTime.Now.ToString("MM/dd/yyyy-HH:mm") + "</td></tr>");
                foreach (KeyValuePair<string, decimal> keyValuePair in orderData)
                {
                    _sbEmailMessageBody.Append("<tr><td>volaire had " + orderCount[keyValuePair.Key] + " orders with $" + keyValuePair.Value + " in revenue for " + keyValuePair.Key + "</td></tr>");
                }
                _sbEmailMessageBody.Append("<tr><td> Total Order Count: " + count+ "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td> Please do not reply to this email.</b></td></tr>");
                _sbEmailMessageBody.Append("</table></body></html>");
                string AdminEmail = System.Configuration.ConfigurationSettings.AppSettings["AdminEmail"];
                string fromEmail = System.Configuration.ConfigurationSettings.AppSettings["fromEmail"];
                MailMessage _oMailMessage = new MailMessage(fromEmail, AdminEmail, "legendzxl.com - Havas Report Generation Status", _sbEmailMessageBody.ToString());
                _oMailMessage.IsBodyHtml = true;
                _oMailMessage.Body = _sbEmailMessageBody.ToString();
                SendMail(_oMailMessage);
            }
            catch (Exception e)
            {
                // log.LogToFile("Error sending email---" + e.Message);
            }
        }

        private static bool SendFileasAttachment(string txtFileName, string fileNameOnly)
        {
            bool sendemail = false;
            try
            {
                string ToEmail = System.Configuration.ConfigurationSettings.AppSettings["clientemail"];
                string ToEmailcc = System.Configuration.ConfigurationSettings.AppSettings["sendemailtocc"];
                StringBuilder sb = new StringBuilder();
                MailMessage message = new MailMessage();

                message.To.Add(ToEmail);
                message.CC.Add(ToEmailcc);                                                 
                message.From = new MailAddress("info@conversionsystems.com");                                
                if (File.Exists(txtFileName))
                {
                    Attachment attachment1 = new Attachment(txtFileName); //create the attachment
                    attachment1.Name = fileNameOnly;
                    message.Attachments.Add(attachment1);
                }
                message.Subject = "volaire.com Chief  Media Reporting";
                // message.Body = "Please see attached Euro Report.";
                message.Body = "Please see attached daily report for SmoothXBike.com";
                message.IsBodyHtml = true;

                SmtpClient client;
                client = new SmtpClient();
                //client = new SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["SmtpServer"]);
                //client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
                client.Send(message);
                sendemail = true;
            }
            catch (System.Exception ex)
            {
                Console.WriteLine("Exception Details  : " + ex.ToString());
                sendemail = false;
                Report Report1 = new Report();
                Report1.LogToFile("Error " + ex.Message);
                Report1.LogToFile("Error " + ex.StackTrace);
            }
            return sendemail;
        }

        private static bool CreateTXTFile(DataTable dt, string strFilePath)
        {
            bool TXTCreated = false;
            try
            {
                // Create the TXT file.
                StreamWriter sw = new StreamWriter(strFilePath, false);                
                int iColCount = dt.Columns.Count;

                // First we will write the headers.
                //DataTable dt = m_dsProducts.Tables[0];
                //for (int i = 0; i < iColCount; i++)
                //{
                //    sw.Write(dt.Columns[i]);
                //    if (i < iColCount - 1)
                //    {
                //        sw.Write("|");
                //    }
                //}
                //sw.Write(sw.NewLine);
                string value = "";
                string fomattedValue = "";
                int length = 0;

                foreach (DataRow dr in dt.Rows)
                {
                    for (int i = 0; i < iColCount; i++)
                    {
                        if (!Convert.IsDBNull(dr[i]))
                        {


                            sw.Write(dr[i].ToString());
                            
                        }
                        if (i < iColCount - 1)
                        {
                            sw.Write("|");
                        }
                    }
                    sw.Write(sw.NewLine);
                }
                sw.Close();
                TXTCreated = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                TXTCreated = false;
            }
            return TXTCreated;
        }
        private void uploadFile(string FTPAddress, string filePath, string username, string password)
        {
            try
            {
                //Create FTP request
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(FTPAddress + "/" + Path.GetFileName(filePath));

                request.Method = WebRequestMethods.Ftp.UploadFile;
                request.Credentials = new NetworkCredential(username, password);
                request.UsePassive = true;
                request.UseBinary = true;
                request.KeepAlive = false;

                //Load the file
                FileStream stream = File.OpenRead(filePath);
                byte[] buffer = new byte[stream.Length];

                stream.Read(buffer, 0, buffer.Length);
                stream.Close();

                //Upload file
                Stream reqStream = request.GetRequestStream();
                reqStream.Write(buffer, 0, buffer.Length);
                reqStream.Close();
            }
            catch
            {
                //sendemail(filePath);
            }
        }
        
        private void LoadReport(DateTime ReportDate, int versionID, string VersionName , string FileName_PostFix)
        {
            try
            {
                // stored procedure convert time to EST Time Zone.
                //DateTime StartDate = StartOfDay(DateTime.Parse("12/01/2014"));
                //DateTime Enddate = EndOfDay(DateTime.Parse("06/14/2015"));
                //DateTime StartDate1 = DateTime.Parse("12/01/2014");
                //DateTime Enddate1 = DateTime.Parse("06/14/2015");
                DateTime StartDate = StartOfDay(ReportDate.AddDays(-61));
                DateTime Enddate = EndOfDay(ReportDate);
                DateTime StartDate1 = ReportDate.AddDays(-6);
                DateTime Enddate1 = ReportDate;

                string txtFileName = "VOLAIRE" + StartDate1.ToString("MMddyy") + "-" + Enddate1.ToString("MMddyy") + ".txt";
                targetPath = targetPath.Replace("\\\\", "\\");
                string FUllPAthwithFileName = targetPath + txtFileName;
                DataTable DT = getDataTable("pr_report_HavasEdge", StartDate, Enddate); 
                bool flag = CreateTXTFile(DT, FUllPAthwithFileName);
                Dictionary<string,decimal> orderData = new Dictionary<string, decimal>();
                Dictionary<string, int> orderCount = new Dictionary<string, int>();
                int count = 0;
                foreach (DataRow dr in DT.Rows)
                {
                    if (orderData.ContainsKey(Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()))
                    {
                        orderData[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()] = orderData[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()]
                        + Convert.ToDecimal(dr["Revenue"].ToString());
                        orderCount[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()] = orderCount[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()] + 1;
                    }
                    else
                    {
                        orderData[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()] = Convert.ToDecimal(dr["Revenue"].ToString());
                        orderCount[Convert.ToDateTime(dr["date"].ToString()).ToShortDateString()] = 1;
                    }
                    count++;

                }
                uploadFile(System.Configuration.ConfigurationSettings.AppSettings["FTPURL"], FUllPAthwithFileName, System.Configuration.ConfigurationSettings.AppSettings["FTPLogin"], System.Configuration.ConfigurationSettings.AppSettings["FTPPassword"]);

                SendEmailToAdmin("File sent successfully", orderData, orderCount, count);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Chief  Media Report " + ex.Message);
                Console.WriteLine("Error : " + ex.Message + " StackTrace : " + ex.StackTrace);
                SendEmailToAdmin(ex.Message);
                LogToFile(ex.Message);
                LogToFile(ex.StackTrace);
            }
        }

        private static string GetQuotedValue(string str)
        {
            return string.Format("\"{0}\"",str);
        }

        protected int BindData(DateTime startDate, DateTime endDate, string VersionName)
        {
            //DateTime? timezoneStartDate = DateTimeUtil.GetEastCoastStartDate(startDate);
            //DateTime? timezoneEndDate = DateTimeUtil.GetEastCoastDate(endDate);
            HitLinkVisitor.Clear();

            Data rptData = new ReportWSSoapClient().GetDataFromTimeframe("smoothxbike", "china2006", ReportsEnum.MultiVariate, TimeFrameEnum.Daily, startDate, endDate, 100000000, 0, 0);
            for (int i = 0; i <= rptData.Rows.GetUpperBound(0); i++)
            {
                HitLinkVisitor.Add(rptData.Rows[i].Columns[0].Value.ToLower(), rptData.Rows[i].Columns[9].Value);
            }

            _dtOrderInfo1 = null;
            CategoryUniqueVistiors = 0;
            string Archivedata="0";
            DataTable OrderInfo1 = getDataTable("pr_report_order_version_batch", startDate, EndOfDay(startDate), Archivedata);
            //Update Version List information
            foreach (DataRow row in OrderInfo1.Rows)
            {
                int visitor = 0;
                //if (row["Title"].ToString().ToLower().Equals(VersionName.ToLower())) // 04/01 Orders and Visitiors from B2 version only Pranav
                //{
                    if (row["Title"].ToString().ToLower().Equals(row["ShortName"].ToString().ToLower()))
                    {
                        if (HitLinkVisitor.ContainsKey(row["Title"].ToString().ToLower()))
                        {
                            visitor += Convert.ToInt32(HitLinkVisitor[row["Title"].ToString().ToLower()].ToString());
                            visitor = Math.Abs(visitor);
                        }
                    }
                    else
                    {
                        //Added this to fix bug of orderhelper.getversionname()
                        if (HitLinkVisitor.ContainsKey(row["Title"].ToString().ToLower()))
                        {
                            visitor += Convert.ToInt32(HitLinkVisitor[row["Title"].ToString().ToLower()].ToString());
                        }
                        if (HitLinkVisitor.ContainsKey(row["ShortName"].ToString().ToLower()))
                        {
                            visitor += Convert.ToInt32(HitLinkVisitor[row["ShortName"].ToString().ToLower()].ToString());
                        }
                        visitor = Math.Abs(visitor);
                    }
                    //item.UniqueVisitors = visitor;
                    CategoryUniqueVistiors += visitor;
                //}                 
            }

            return CategoryUniqueVistiors;




            //FCLiteral.Text = CreateCharts(dtCollectionList[1dtCollectionList

        }

        static void Main(string[] args)
        {
            DateTime ReportDate = DateTime.Today.AddDays(-1);
            Console.WriteLine("Start Havas file Legendzxl.com " + ReportDate.ToString());
            Report DailyReports = new Report();
            DailyReports.LogToFile("Start Chief  Media Reports " + DateTime.Now.ToString());                                    
            // DailyReports.CheckDataBase_Connection();           
            //ReportDate = DateTime.Parse("1/17/2016");
            string versionname = "";
            string FileName_PostFix = "";
            int VersionID = 0;
            //DataTable DT = getDataTable("pr_report_ChiefMediaVersionDetails");
            //if(DT.Rows.Count>0)
            //{
            //    foreach (DataRow row in DT.Rows)
            //    {
                    //versionname = row["VersionName"].ToString();
                    //FileName_PostFix = row["FileName_PostFix"].ToString();
                    //VersionID = Convert.ToInt32(row["VersionID"].ToString());
                    //if(VersionID>0)
                    //{
                        DailyReports.LoadReport(ReportDate, VersionID, versionname, FileName_PostFix); // Version ID are as per PRODUCTION VersionID                        
                    //}
            //    }
            //}

            Console.WriteLine("End  Havas file Legendzxl.com ");
            DailyReports.LogToFile("End Mercury Media Reports " + DateTime.Now.ToString());   
        }
    }
}
