using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Tax;
using CSBusiness.Preference;
using CSBusiness;
using CSBusiness.Cache;
using System.Web;

namespace CSWebBase
{
    public class CustomTaxCalculator : ITaxCalculator
    {
        public decimal Calculate(CSBusiness.ShoppingManagement.Cart cart)
        {
            decimal taxToReturn = 0;
            //decimal taxToReturn2 = 0;
            SitePreference list = CSFactory.GetCartPrefrence();
            decimal taxableAmount = 0;
            if (list.IncludeShippingCostInTaxCalculation)
            {
                taxableAmount += cart.ShippingCost;
                if (cart.ShippingMethod == CSBusiness.Shipping.UserShippingMethodType.Rush)
                {
                    taxableAmount += cart.RushShippingCost;
                }
            }

            //If this returns a value, it means country has states and we need to 
            //find tax for states
            //CodeReview By Sri on 09/15: Need to change TaxRegionCache Object
            TaxRegion countryRegion = null, stateRegion = null, zipRegion = null;

            //Comments on 11/2: pulling data from Cache object
            TaxregionCache cache = new TaxregionCache(HttpContext.Current);
            List<TaxRegion> taxRegions = (List<TaxRegion>)cache.Value;

            countryRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == 0 && string.IsNullOrEmpty(t.ZipCode));
            stateRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == cart.ShippingAddress.StateProvinceId && string.IsNullOrEmpty(t.ZipCode));
            zipRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == cart.ShippingAddress.StateProvinceId
                && t.ZipCode == cart.ShippingAddress.ZipPostalCode);

            if (zipRegion != null)
            {
                taxToReturn = taxableAmount * zipRegion.Value / 100;
            }
            else if (stateRegion != null)
            {
                taxToReturn = taxableAmount * stateRegion.Value / 100;
            }
            else if (countryRegion != null)
            {
                taxToReturn = taxableAmount * countryRegion.Value / 100;
            }
            taxToReturn = Math.Round(taxToReturn, 2, MidpointRounding.AwayFromZero);
            foreach (Sku item in cart.CartItems)
            {
                if (cart.ShippingAddress.CountryId > 0)
                {
                    if (zipRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice*item.Quantity) * zipRegion.Value / 100,2,MidpointRounding.AwayFromZero);
                    }
                    else if (stateRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice * item.Quantity) * stateRegion.Value / 100, 2, MidpointRounding.AwayFromZero);
                    }
                    else if (countryRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice * item.Quantity) * countryRegion.Value / 100, 2, MidpointRounding.AwayFromZero);
                    }
                }
            }


            return Math.Round(taxToReturn, 2, MidpointRounding.AwayFromZero);
        }
        public decimal CalculateFullPrice(CSBusiness.ShoppingManagement.Cart cart)
        {
            decimal taxToReturn = 0;
            SitePreference list = CSFactory.GetCartPrefrence();
            decimal taxableAmount = 0; // Tax after Discount Amount is subtracted
            if (list.IncludeShippingCostInTaxCalculation)
            {
                taxableAmount += cart.ShippingCost;
                if (cart.ShippingMethod == CSBusiness.Shipping.UserShippingMethodType.Rush)
                {
                    taxableAmount += cart.RushShippingCost;
                }
            }

            //If this returns a value, it means country has states and we need to 
            //find tax for states
            //CodeReview By Sri on 09/15: Need to change TaxRegionCache Object
            TaxRegion countryRegion = null, stateRegion = null, zipRegion = null;

            //Comments on 11/2: pulling data from Cache object
            TaxregionCache cache = new TaxregionCache(HttpContext.Current);
            List<TaxRegion> taxRegions = (List<TaxRegion>)cache.Value;

            countryRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == 0 && string.IsNullOrEmpty(t.ZipCode));
            stateRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == cart.ShippingAddress.StateProvinceId && string.IsNullOrEmpty(t.ZipCode));
            zipRegion = taxRegions.FirstOrDefault(t => t.CountryId == cart.ShippingAddress.CountryId && t.StateId == cart.ShippingAddress.StateProvinceId
                && t.ZipCode == cart.ShippingAddress.ZipPostalCode);

            if (zipRegion != null)
            {
                taxToReturn = taxableAmount * zipRegion.Value / 100;
            }
            else if (stateRegion != null)
            {
                taxToReturn = taxableAmount * stateRegion.Value / 100;
            }
            else if (countryRegion != null)
            {
                taxToReturn = taxableAmount * countryRegion.Value / 100;
            }
            taxToReturn = Math.Round(taxToReturn, 2, MidpointRounding.AwayFromZero);
            foreach (Sku item in cart.CartItems)
            {
                if (cart.ShippingAddress.CountryId > 0)
                {
                    if (zipRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice * item.Quantity) * zipRegion.Value / 100, 2, MidpointRounding.AwayFromZero);
                    }
                    else if (stateRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice * item.Quantity) * stateRegion.Value / 100, 2, MidpointRounding.AwayFromZero);
                    }
                    else if (countryRegion != null)
                    {
                        taxToReturn += Math.Round((item.FullPrice * item.Quantity) * countryRegion.Value / 100, 2, MidpointRounding.AwayFromZero);
                    }
                }
            }
            return Math.Round(taxToReturn, 2, MidpointRounding.AwayFromZero);
        }
    }
}
