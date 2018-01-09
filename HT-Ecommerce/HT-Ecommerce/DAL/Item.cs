using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
    public class Item
    {
       public int ProductId { get; set; }
        public string Product { get; set; }
        public int Qty { get; set; }
        public double Rate { get; set; }
        public double SubTotal
        {
            get
            {
                return Qty * Rate;
            }
        }

    }
}