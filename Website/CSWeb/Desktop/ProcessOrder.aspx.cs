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
    public  class ProcessOrder : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int orderId = 0;
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
                if (orderId > 0)
                    OrderProcessor.ProcessOrder(orderId);
            }
            else
                OrderProcessor.ProcessAllOrders();
        }
    }
}