using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.IO;
using System.Linq;
using System.Text;
using CSBusiness.Attributes;
using CSBusiness.OrderManagement;
using CSBusiness.Shipping;
using CSBusiness.ShoppingManagement;
using CSBusiness.Resolver;
using CSBusiness;
using CSCore.Utils;
using CSData;
using CSBusiness.Preference;
using System.Web;
using System.Xml.Serialization;
using CSBusiness.Coupon;


namespace CSWebBase
{
    public class CustomDiscountCalculator : CSBusiness.Discount.IDiscountCalculator
    {
        public ClientCartContext ClientOrderData
        {
            get
            {
                return (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];
            }
            set
            {
                HttpContext.Current.Session["ClientOrderData"] = value;
            }
        }
        public bool CalculateDiscount(Cart cart)
        {
            cart.DiscountAmount = Decimal.Zero;
            if (cart.DiscountCode != null)
            {
                CouponInfo couponInfo = CSFactory.GetCacheSitePref().CouponItems.FirstOrDefault<CouponInfo>((Func<CouponInfo, bool>)(x => x.Title.ToLower() == cart.DiscountCode.ToLower()));
                if (couponInfo != null)
                {
                    if (couponInfo.DiscountType == CouponTypeEnum.Percentage)
                    {
                        //if (ClientOrderData.CustomerInfo != null && !string.IsNullOrEmpty(ClientOrderData.CustomerInfo.Email))
                        //{
                        //    if (!DuplicateOrderDAL.IsDuplicatePromo(ClientOrderData.CustomerInfo.Email, couponInfo.Title))
                        //    {
                                if (couponInfo.Title.ToUpper() == "FIRST15")
                                {
                                    decimal subTotal = 0;
                                    foreach (var item in cart.CartItems)
                                    {
                                        item.LoadAttributeValues();
                                        if (!item.GetAttributeValue<bool>("isMainKit", false))
                                        {
                                            subTotal += item.InitialPrice * item.Quantity;
                                        }
                                    }
                                    cart.DiscountAmount = !couponInfo.IncludeShipping ? Math.Round(subTotal * (couponInfo.Discount / new Decimal(100)), 2) : Math.Round(cart.Total * (couponInfo.Discount / new Decimal(100)), 2);
                                }
                                else
                                {
                                    cart.DiscountAmount = !couponInfo.IncludeShipping ? Math.Round(cart.SubTotal * (couponInfo.Discount / new Decimal(100)), 2) : Math.Round(cart.Total * (couponInfo.Discount / new Decimal(100)), 2);
                                }
                        //    }
                        //}
                    }
                    else if (couponInfo.DiscountType == CouponTypeEnum.Amount)
                    {
                        cart.DiscountAmount = !couponInfo.IncludeShipping ? (!(cart.SubTotal >= couponInfo.TotalAmount) ? Decimal.Zero : couponInfo.TotalAmount) : (!(cart.Total >= couponInfo.TotalAmount) ? Decimal.Zero : couponInfo.TotalAmount);
                    }
                    else
                    {
                        if (couponInfo.DiscountType == CouponTypeEnum.FreeShipping)
                        {
                            if (couponInfo.MinAmount > Decimal.Zero && cart.SubTotal > couponInfo.MinAmount)
                                cart.ShippingCost = Decimal.Zero;
                            else if (couponInfo.MinAmount == Decimal.Zero)
                            {
                                cart.ShippingCost = Decimal.Zero;
                            }
                            else
                            {
                                cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountFailMinAmt").Replace("{Price}", couponInfo.MinAmount.ToString("n2"));
                                return false;
                            }
                            cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountSuccessMsg");
                            return true;
                        }
                        if (couponInfo.DiscountType == CouponTypeEnum.NoSalesTax)
                        {
                            if (couponInfo.MinAmount > Decimal.Zero && cart.SubTotal > couponInfo.MinAmount)
                            {
                                cart.TaxCost = Decimal.Zero;
                                cart.TaxFullPrice = Decimal.Zero;
                            }
                            else if (couponInfo.MinAmount == Decimal.Zero)
                            {
                                cart.TaxCost = Decimal.Zero;
                                cart.TaxFullPrice = Decimal.Zero;
                            }
                            else
                            {
                                cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountFailMinAmt").Replace("{Price}", couponInfo.MinAmount.ToString("n2"));
                                return false;
                            }
                            cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountSuccessMsg");
                            return true;
                        }
                        foreach (CouponItems couponItems in couponInfo.ItemsDiscount)
                        {
                            CouponItems itemInfo = couponItems;
                            if (itemInfo != null && cart.CartItems.FirstOrDefault<Sku>((Func<Sku, bool>)(x => x.SkuId == itemInfo.SkuId)) != null)
                            {
                                Sku sku = cart.CartItems.FirstOrDefault<Sku>((Func<Sku, bool>)(x => x.SkuId == itemInfo.SkuId));
                                cart.DiscountAmount = itemInfo.DiscountType != CouponTypeEnum.Percentage ? (!(sku.InitialPrice >= itemInfo.DiscountAmount) ? Decimal.Zero : itemInfo.DiscountAmount) : Math.Round(sku.InitialPrice * itemInfo.DiscountAmount / new Decimal(100), 2);
                            }
                        }
                    }
                }
                if (cart.DiscountCode.ToUpper() == "FIRST15" || cart.DiscountCode.ToUpper() == "VOL15")
                {
                    cart.ShippingCost = Decimal.Zero;
                }

                if (cart.DiscountAmount > Decimal.Zero)
                {
                    cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountSuccessMsg");
                    return true;
                }
            }
            cart.DiscountMessage = CSBusiness.ResourceHelper.GetResoureValue("discountFailMsg");
            return false;
        }

    }

}
