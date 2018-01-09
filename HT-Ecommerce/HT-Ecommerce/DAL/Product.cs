using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
     class Product:MyBase,IDatabase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Tag { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int UnitId { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public int Discount { get; set; }
        public string LastUpdate { get; set; }
        public int finalPrice { get; set; }
        

        

        public bool Insert()
        {
           
                Command =MyCommand(
                    "insert into product(name,code,tag,categoryId,brandId,unitId,description,price,discount,lastUpdate) values(@name,@code,@tag,@categoryId,@brandId,@unitId,@description,@price,@discount,@lastUpdate)");
            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@code", Code);
            Command.Parameters.AddWithValue("@tag", Tag);
            Command.Parameters.AddWithValue("@categoryId", CategoryId);
            Command.Parameters.AddWithValue("@brandId", BrandId);
            Command.Parameters.AddWithValue("@unitId", UnitId);
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@price", Price);
            Command.Parameters.AddWithValue("@discount", Discount);
            Command.Parameters.AddWithValue("@lastUpdate", LastUpdate);
                
                return Execute(Command);
            

           
        }

        public DataSet Select()
        {
            Command = MyCommand(
                @"select p.id, p.name,p.code,p.tag,(c.name) category,(b.name) brand,(u.name) unit,p.description,p.price,p.discount,p.lastUpdate from product p
                inner join category c on p.categoryId=c.id
                inner join brand b on p.brandId=b.id
                inner join unit u on p.unitId=u.id
                ");
            return ExecuteDataSet(Command);
        }

        public bool SelectById()
        {
            Command = MyCommand(
                 @"select p.id, p.name,p.code,p.tag,(c.name) category,(b.name) brand,(u.name) unit,p.description,p.price,p.discount,p.price - p.price * p.discount / 100 AS finalPrice,p.lastUpdate from product p
                inner join category c on p.categoryId=c.id
                inner join brand b on p.brandId=b.id
                inner join unit u on p.unitId=u.id where p.id=@pid");
               Command.Parameters.AddWithValue("@pid",Id);

            MyReader = ExecuteReader(Command);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                Code = MyReader["code"].ToString();
                Tag = MyReader["tag"].ToString();
                Price = Convert.ToInt32(MyReader["price"]);
                Discount = Convert.ToInt32(MyReader["discount"]);
                finalPrice = Convert.ToInt32(MyReader["finalPrice"]);
                 return true;
            }

            Error = "Invalid Login";
            return false;
        }


        public bool Table()
        {
            Command = MyCommand(@"id int primary key identity,
            name varchar(200),
            code varchar(200),
            tag varchar(200),
            categoryId int not null,
            brandId int not null,
            unitId int not null,
            description varchar(200),
            price int,
            discount int,
            lastUpdate varchar(200),
            Foreign key(categoryId) references category(id),
            Foreign key(brandId) references brand(id),
            Foreign key(unitId) references unit(id)");
            return Execute(Command);
        }
    }
}