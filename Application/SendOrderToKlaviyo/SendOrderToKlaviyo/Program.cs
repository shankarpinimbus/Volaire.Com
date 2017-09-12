using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

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
                var request = (HttpWebRequest)WebRequest.Create(uri);
                request.GetResponse();
            }
            catch (WebException ex)
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
