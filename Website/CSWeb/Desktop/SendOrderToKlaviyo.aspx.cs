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
        }
    }
}