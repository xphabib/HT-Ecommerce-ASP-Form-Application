using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
     class Orders: MyBase,IDatabase
    {

        public int id { get; set; }
        public string number { get; set; }
        public int userId { get; set; }
        public double total { get; set; }
        public double deliveryCharge { get; set; }
        public double othersCharge { get; set; }
        public int paymentMethod { get; set; }
        public string deliveryAddress { get; set; }
        public int locationId { get; set; }


        public bool Insert()
        {
            Command = MyCommand(@"Insert into Orders (number,userId,total,deliveryCharge,othersCharge,paymentMethodId,deliveryAddress,locationId)
                                  Values (@number,@userId,@total,@deliveryCharge,@othersCharge,@paymentMethod,@deliveryAddress,@locationId) select @@identity");

            Command.Parameters.AddWithValue("@number", number);
            Command.Parameters.AddWithValue("@userId", userId);
            Command.Parameters.AddWithValue("@total", total);
            Command.Parameters.AddWithValue("@deliveryCharge", deliveryCharge);
            Command.Parameters.AddWithValue("@othersCharge", othersCharge);
            Command.Parameters.AddWithValue("@paymentMethod", paymentMethod);
            Command.Parameters.AddWithValue("@deliveryAddress", deliveryAddress);
            Command.Parameters.AddWithValue("@locationId", locationId);

            return ExecuteScaler(Command);

        }

        public bool StatusInsert(int orderId, int statusId, int userId)
        {
            Command = MyCommand(@"Insert into OrderStatus(orderId, statusId, userId)
                                  Values (@orderId, @statusId, @userId");

            Command.Parameters.AddWithValue("@orderId", orderId);
            Command.Parameters.AddWithValue("@userId", userId);
            Command.Parameters.AddWithValue("@statusId", statusId);
            return ExecuteScaler(Command);

        }





        public bool Update()
        {
            Command = MyCommand(@"Update Orders set 
                                 number=@number,
                                 userId=@userId,total=@total,deliveryCharge=@deliveryCharge,
                                 othersCharge=@othersCharge,paymentMethod=@paymentMethod,deliveryAddress=@deliverAddress,
                                 locationId=@locationId where id=@id");

            Command.Parameters.AddWithValue("@number", number);
            Command.Parameters.AddWithValue("@userId", userId);
            Command.Parameters.AddWithValue("@total", total);
            Command.Parameters.AddWithValue("@deliveryCharge", deliveryCharge);
            Command.Parameters.AddWithValue("@othersCharge", othersCharge);
            Command.Parameters.AddWithValue("@paymentMethod", paymentMethod);
            Command.Parameters.AddWithValue("@deliveryAddress", deliveryAddress);
            Command.Parameters.AddWithValue("@locationId", locationId);
            return Execute(Command);

        } 
        
        public DataSet Select(int statusId = 0)
        {
            Command = MyCommand(@"SELECT [id], [dateTime], [number], [user], 
                    [email], [total], [deliveryCharge], [othersCharge], 
                    [paymentMethod], [deliveryAddress], [location], [city], 
                    [country] FROM [vwOrders] where id > 0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and (number like @search or email like @search or deliveryAddress like @search) ";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
            if (paymentMethod > 0)
            {
                Command.CommandText += " and paymentMethodId = @paymentMethodId";
                Command.Parameters.AddWithValue("@paymentMethodId", paymentMethod);
            }

            if (locationId > 0)
            {
                Command.CommandText += " and locationId = @locationId";
                Command.Parameters.AddWithValue("@locationId", locationId);
            }

            if(statusId == -1)
            {
                Command.CommandText += " and id not in (select orderId from orderStatus)";
            }
            else if(statusId > 0)
            {
                //Command.CommandText += " and id in (select orderId from orderStatus left join status as s on orderStatus.stuatusId = s.id where s.level = )"
            }


            return ExecuteDataSet(Command);
        }

        public bool SelectById(int oid)
        {
            Command = MyCommand(
                @"select o.id,o.number,(u.name) users,o.total,
       o.deliveryCharge,o.othersCharge,(p.name) payment,
	   o.deliveryAddress,(l.name) location
	   from orders o
	   left join users u on o.userid = u.id
	   left join paymentMethod p on o.paymentMethodId=p.id
	   left join location l on o.locationId=l.id where o.id=@orderId");

            Command.Parameters.AddWithValue("@orderId", oid);

            MyReader = ExecuteReader(Command);
            while (MyReader.Read())
            {
                id = Convert.ToInt32(MyReader["id"]);
                number = MyReader["number"].ToString();
                userId = Convert.ToInt32(MyReader["userId"]);

                return true;
            }

            Error = "Invalid Login";
            return false;
        }

        public bool Table()
        {
            Command = MyCommand(
                @"(id int identity primary key,
    dateTime date,
   number int,
   userId int not null,
   total int,
   deliveryCharge varchar(200),
  othersCharge varchar(200),
  paymentMethodId int not null,
  deliveryAddress varchar(200),
  locationId int not null,
  Foreign key (userId) references users(id),
  Foreign key (paymentMethodId) references paymentMethod(id),
  Foreign key (locationId) references location(id)
)");
            return Execute(Command);
        }
    }
}