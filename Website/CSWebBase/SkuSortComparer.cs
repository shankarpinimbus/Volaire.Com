using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness;

namespace CSWebBase
{
    public class SkuSortComparer : IComparer<Sku>
    {
        int IComparer<Sku>.Compare(Sku x, Sku y)
        {
            return SkuSortComparer.CompareHelper(x, y);
        }

        public static int CompareHelper(Sku x, Sku y)
        {
            int xOrder = x.GetAttributeValue<int>("Order", 0);
            int yOrder = y.GetAttributeValue<int>("Order", 0);

            if (xOrder == yOrder)
                return string.Compare(x.Title, y.Title);
            else if (yOrder == 0)
                return -1;
            else if (xOrder == 0)
                return 1;

            if (xOrder > yOrder)
                return 1;
            else if (xOrder < yOrder)
                return -1;

            return string.Compare(x.Title, y.Title);
        }
    }
}
