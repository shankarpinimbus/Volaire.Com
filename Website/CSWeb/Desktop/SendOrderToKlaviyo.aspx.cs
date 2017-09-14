using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using CSBusiness.Attributes;
using CSBusiness.PostSale;
using CSBusiness;
using System.Text.RegularExpressions;
using CSCore.Utils;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;
using System.Configuration;
using System.Net.Mail;

namespace CSWeb.Desktop
{
    public partial class SendOrderToKlaviyo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int count = 0;
            int count1=0;
            var orders = CSResolve.Resolve<IOrderService>().GetAllOrders(DateTime.Now.AddDays(-2), DateTime.Now.AddDays(-1), false, 0, 99999, out count).Where(x => x.OrderStatusId == 2).ToList();
            List<Order> totalOrders = CSResolve.Resolve<IOrderService>().GetAllOrders(DateTime.Now.AddDays(-9999), DateTime.Now, false, 0, 99999, out count1).Where(x => x.OrderStatusId == 2).ToList();
            for (int i = 0; i < orders.Count; i++)
            {
                var totalOrdersByCustomerCount = 0;
                var totalOrdersByCustomer = totalOrders.Where(x => x.Email == orders[i].Email).ToList();
                totalOrdersByCustomerCount = totalOrdersByCustomer.Count;
                var totalAmountOfOrdersByCustomer="";
                var totalItemCodes = "";
                foreach (var item in totalOrdersByCustomer)
                {
                    totalAmountOfOrdersByCustomer = item.SubTotal.ToString();
                    var order = CSResolve.Resolve<IOrderService>().GetOrderDetails(item.OrderId, true);
                    if (order.SkuItems != null)
                    {
                        foreach (var item1 in order.SkuItems)
                        {
                            totalItemCodes = totalItemCodes + (item1.SkuCode) + ",";
                        }
                    }
                  
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), String.Format("OrderId_{0}", orders[i].OrderId), String.Format("SendOrder('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}');", orders[i].Email, orders[i].CustomerInfo.FirstName, orders[i].CustomerInfo.LastName, "Website", orders[i].CreatedDate, orders[i].OrderId, totalOrdersByCustomerCount, totalAmountOfOrdersByCustomer, totalItemCodes, orders[i].DiscountCode == null ? "" : orders[i].DiscountCode), true);
            }
            try
            {
                if (Orders.Value == "")
                {
                    //CSCore.EmailHelper.SendEmail("info@conversionsystems.com", ConfigurationManager.AppSettings["AdminEmail"], "Volaire - Daily Klaviyo Reconciliation", string.Format("{0} Orders sent sucessfully to Klaviyo", orders.Count), false);
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage("info@vendocommerce.com", ConfigurationManager.AppSettings["AdminEmail"], "Volaire - Daily Klaviyo Reconciliation", string.Format("{0} Orders sent sucessfully to Klaviyo", orders.Count));
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                }
                else
                {
                    //CSCore.EmailHelper.SendEmail("info@conversionsystems.com", ConfigurationManager.AppSettings["AdminEmail"], "Volaire - Daily Klaviyo Reconciliation", "Transmission Process to Klaviyo Failed" + Orders.Value, false);
                     MailMessage _oMailMessage = new MailMessage("info@vendocommerce.com", ConfigurationManager.AppSettings["AdminEmail"], "Volaire - Daily Klaviyo Reconciliation", "Transmission Process to Klaviyo Failed" + Orders.Value);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                }
                
            }
            catch (Exception ex)
            {
                //;
            }
            
        }

        public static bool SendMail(MailMessage oMsg)
        {

            bool bResult = false;

            try
            {
                SmtpClient client;
                oMsg.BodyEncoding = System.Text.Encoding.UTF8;
                oMsg.CC.Clear();
                oMsg.Bcc.Clear();
                client = new SmtpClient();
                client.Send(oMsg);
                bResult = true;

            }
            catch (Exception)
            {

                bResult = false;
            }
            return bResult;
        }
    }
}