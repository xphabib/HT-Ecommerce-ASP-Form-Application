using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.Expressions;

namespace HT_Ecommerce.DAL
{
    class UserProduct :MyBase,IDatabase
    {
        
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public DateTime AddedDate { get; set; }

        public bool Insert()
        {
            Command = MyCommand(
                @"insert into usersProduct(userId,productId,dateTime) values(@userId,@productId,@dateTime)");
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@dateTime", AddedDate);
            return Execute(Command);
        }

        public DataSet Select()
        {
            Command = MyCommand(
                @"select up.userId,up.productId,(up.dateTime), (u.name) users,(p.name)  product from usersProduct as up
                left join users as u on up.userId=u.id
                left join product as p on up.productId=p.id
                ");
            return ExecuteDataSet(Command);
        }

        public bool Table()
        {
            Command = MyCommand(@"create table usersProduct
                (
                userId int not null,
                productId int not null,
                dateTime date,
                primary key (userId,productId),
                Foreign key (productId) references product (id),
                Foreign key (userId) references users(id)
                )");
            return Execute(Command);
        }
    }

   
}