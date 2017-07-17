using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;

namespace CSWeb.Desktop
{
    public partial class tangleangelbrush : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.RedirectDesktop();
        }


        protected void btnAddtoCart_OnClick(object sender, EventArgs e)
        {
            int shineAngel = 0;
            if (CartContext.CartInfo.SkuExists(126))
            {
                shineAngel = 126;
                OrderHelper.RemoveCart("126");
            }
            else if (CartContext.CartInfo.SkuExists(125))
            {
                shineAngel = 125;
                OrderHelper.RemoveCart("125");
            }
            if (SiteBasePage.CartContext.CartInfo.SkuExists(122))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("123");
            }
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(120))
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
            else if (SiteBasePage.CartContext.CartInfo.SkuExists(155))
            {
                OrderHelper.EmptyCart();
                OrderHelper.ChangeCart("156");
            }

            if (shineAngel > 0)
            {
                OrderHelper.ChangeCart(shineAngel.ToString());
            }

            OrderHelper.ChangeCart("127");
            Response.Redirect("cart");
        }
    }
}