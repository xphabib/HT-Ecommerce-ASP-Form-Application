using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Windows.Input;

namespace HT_Ecommerce.DAL
{
    class OrderDetails:MyBase
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Qty { get; set; }
        public double Rate { get; set; }
        public string Remarks { get; set; }



        public bool Insert()
        {
            Command = MyCommand(@"Insert into OrdersDetails(orderId,productId,qty,rate,remarks)
                                  Values (@orderId,@productId,@qty,@rate,@remarks)");

            Command.Parameters.AddWithValue("@orderId", OrderId);
            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@qty", Qty);
            Command.Parameters.AddWithValue("@rate", Rate);
            Command.Parameters.AddWithValue("@remarks", Remarks);
          

            return Execute(Command);

        }
    }
}