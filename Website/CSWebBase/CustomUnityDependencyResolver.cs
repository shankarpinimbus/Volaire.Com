using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Discount;
using CSBusiness.Resolver;
using CSBusiness.Shipping;
using Microsoft.Practices.Unity;
using CSBusiness.Total;
using CSBusiness.Tax;

namespace CSWebBase
{
    public class CustomUnityDependencyResolver : UnityDependencyResolver
    {
        protected override void ConfigureContainer(Microsoft.Practices.Unity.IUnityContainer container)
        {
            base.ConfigureContainer(container);

            //IShippingCalculator baseShippingCalculator = container.Resolve<IShippingCalculator>();

            //container.RegisterType<IShippingCalculator, CustomShippingCalculator>(new InjectionFactory(x =>
            //{
            //    return new CustomShippingCalculator(false); // baseShippingCalculator);
            //}));

            container.RegisterType<ITaxCalculator, CustomTaxCalculator>(new InjectionFactory(x =>
            {
                return new CustomTaxCalculator();
            }));
        }
    }
}
