﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class shineangelbrush : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string version = OrderHelper.GetVersionName().ToLower();
            if (!version.Equals("aa1") && !version.Equals("b2")/* && !version.Equals("f2")*/)
            {
                if (Request.QueryString.Count > 0)
                    Response.Redirect("/b2/shine-angel-brush?" + Request.QueryString);
                else
                {
                    Response.Redirect("/b2/shine-angel-brush");
                }
            }
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {

            if (SiteBasePage.CartContext.CartInfo.SkuExists(122))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("123");
            }
            else if(SiteBasePage.CartContext.CartInfo.SkuExists(120))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("121");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(128))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("129");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(130))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("131");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(132))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("137");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(133))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("134");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(135))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("136");
            }

            if (rbMedium.Checked)
            {
                OrderHelper.ChangeCart("126");
            }
            else
            {
                OrderHelper.ChangeCart("125");
            }

            
            
            Response.Redirect("tangle-angel-brush");
        }
    }
}