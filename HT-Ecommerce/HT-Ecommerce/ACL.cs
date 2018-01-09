using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HT_Ecommerce
{
    public static class ACL
    {

        public static bool isAdmin()
        {
            
           
            return false;
        }


        public static List<DAL.Item> CartItems()
        {
            return new List<DAL.Item>();
        }

    }
}