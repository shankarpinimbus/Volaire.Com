using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Com.ConversionSystems
{
    public class Batch
    {
        /*
            Please Updated SiteUrl and SiteName value in the App Config file.            
         */
        public void DoBatch()
        {
            string URL = ConfigurationManager.AppSettings["SiteUrl"];
            Console.WriteLine(URL);
            HttpPost(URL, "");
        }
        private void HttpPost(string uri, string parameters)
        {
            try
            {
               // var request = (HttpWebRequest)WebRequest.Create(uri);
               // request.GetResponse();
               //// WebResponse response = request.GetResponse();
               // HttpWebResponse response = (HttpWebResponse)request.GetResponse();
               // StreamReader responseReader = new StreamReader(response.GetResponseStream());
               // var res_basicAuth = responseReader.ReadToEnd();
                //var client = new WebClient();
                Process.Start("https://volaire.com/Desktop/sendordertoklaviyo");
                Thread.Sleep(180000);

                Process[] processes = Process.GetProcessesByName("iexplore");
                try
                {
                    foreach (Process process in processes)
                    {
                        process.Kill();
                        process.WaitForExit();
                    }
                }
                catch (Exception ex)
                {
                    
                    //;
                }
               
                //var content = client.DownloadString("https://volaire.com/Desktop/SendOrderToKlaviyo");
                
            }
            catch (Exception ex)
            {
                Console.WriteLine("HttpPost: request error" + ex.Message);
            }
        }

        public static void Main(string[] args)
        {
            Batch StartBatch = new Batch();
            string siteName = ConfigurationManager.AppSettings["SiteName"].ToString();
            Console.WriteLine(siteName + " Batch - Started");
            Console.WriteLine("Please Wait - ");
            StartBatch.DoBatch();
            Console.WriteLine(siteName + " Batch  - End");
            Console.WriteLine("Task Completed");
        }
    }
}
