using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using CSBusiness;
using CSBusiness.Cache;
using CSBusiness.OrderManagement;
using CSBusiness.Preference;
using CSBusiness.Web;
using CSCore.DataHelper;

namespace CSWebBase
{
    public class DuplicateOrderDAL 
    {
        public static bool IsDuplicateOrder(string email)
        {
            using (SqlDataReader reader = GetDuplicateOrder(email))
            {
                if (reader.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
        public static SqlDataReader GetDuplicateOrder(string email)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_get_order_email";
            SqlParameter[] ParamVal = new SqlParameter[1];
            ParamVal[0] = new SqlParameter("@email", email);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);
        }

        public decimal CalculateTax(Order order)
        {
            decimal taxToReturn = 0;
            //decimal taxToReturn2 = 0;
            SitePreference list = CSFactory.GetCartPrefrence();
            decimal taxableAmount = 0;
            if (list.IncludeShippingCostInTaxCalculation)
            {
                taxableAmount += order.ShippingCost;
            }

            //If this returns a value, it means country has states and we need to 
            //find tax for states
            //CodeReview By Sri on 09/15: Need to change TaxRegionCache Object
            TaxRegion countryRegion = null, stateRegion = null, zipRegion = null;

            //Comments on 11/2: pulling data from Cache object
            TaxregionCache cache = new TaxregionCache(HttpContext.Current);
            List<TaxRegion> taxRegions = (List<TaxRegion>)cache.Value;

            countryRegion = taxRegions.FirstOrDefault(t => t.CountryId == order.CustomerInfo.ShippingAddress.CountryId && t.StateId == 0 && string.IsNullOrEmpty(t.ZipCode));
            stateRegion = taxRegions.FirstOrDefault(t => t.CountryId == order.CustomerInfo.ShippingAddress.CountryId && t.StateId == order.CustomerInfo.ShippingAddress.StateProvinceId && string.IsNullOrEmpty(t.ZipCode));
            zipRegion = taxRegions.FirstOrDefault(t => t.CountryId == order.CustomerInfo.ShippingAddress.CountryId && t.StateId == order.CustomerInfo.ShippingAddress.StateProvinceId
                && t.ZipCode == order.CustomerInfo.ShippingAddress.ZipPostalCode);

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
            foreach (Sku item in order.SkuItems)
            {
                if (order.CustomerInfo.ShippingAddress.CountryId > 0)
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
