using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
     class Users : MyBase, IDatabase
    {

        public int Id{ get; set; }
        public string Name { get; set; }

        public string Contact { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime JoinDate { get; set; }
        public string JoinIp { get; set; }
        public string UserType { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }


        public bool Active()
        {
            Command = MyCommand(
                @"insert into usersActive(email, dateTime, ip) values (@email, @dateTime, @ip)" );
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@dateTime", DateTime.Now);
            Command.Parameters.AddWithValue("@ip", HttpWorkerRequest.HeaderHost);
            return Execute(Command);
        }


        public bool Insert()
        {
            Command = MyCommand(
                @"insert into users(id,name,contact,email,password,gender,dateofBirth,joinDate,userType,address,cityId) values(@id,@name,@contact,@email,@password,@gender,@dateofBirth,@joinDate,@userType,@address,@cityId)");
            Command.Parameters.AddWithValue("@id", Id);
            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@contact", Contact);
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@password", Password);
            Command.Parameters.AddWithValue("@gender", Gender);
            Command.Parameters.AddWithValue("@dateofBirth", DateOfBirth);
            Command.Parameters.AddWithValue("@joinDate", JoinDate);
            Command.Parameters.AddWithValue("@userType", UserType);
            Command.Parameters.AddWithValue("@address", Address);
            Command.Parameters.AddWithValue("@cityId", CityId);



            return Execute(Command);
        }

        public DataSet Select()
        {
            Command = MyCommand(
                @"select u.id,u.name,u.contact,u.email,u.password,u.gender,u.dateofBirth,u.joinDate,u.userType,cn.name as country,ct.name as city from users as u
                left join city as ct on u.cityId=ct.id
                left join country as cn on cn.id = ct.countryId
                ");
            return ExecuteDataSet(Command);
        }

        public bool IsActive(string _email)
        {


            Command = MyCommand(@"select * from usersActive where email = @email");
            Command.Parameters.AddWithValue("@email", _email);

            MyReader = ExecuteReader(Command);
            while (MyReader.Read())
            {
                return true;
            }
            return false;
        }


        public bool Login()
        {


            Command = MyCommand(@"select u.id,u.name,u.contact,u.email,u.password,u.gender,u.dateofBirth,u.joinDate,u.userType, u.address, cn.name as country,ct.name as city from users as u
                left join city as ct on u.cityId=ct.id
                left join country as cn on cn.id = ct.countryId where (u.contact = @email or u.email = @email) and u.password = @password
                ");
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@password", Password);

            MyReader = ExecuteReader(Command);
            while(MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                UserType = MyReader["userType"].ToString();
                Address = MyReader["address"].ToString();
                return true;
            }

            Error = "Invalid Login";
            return false;
        }

        //public string LastAddedProduct()
        //{
        //    string qry = "select max(id) from product";
        //    return ExecuteId(qry);
        //}


        public bool Table()
        {
            Command = MyCommand(@"create table users
(
id int identity primary key,
name varchar(200),
contact varchar(200),
email varchar(200),
password varchar(200),
gender varchar(200),
dateOfBirth date,
joinDate date,
joinIP varchar not null,
userType varchar(20),
address varchar(200),
cityId int not null,
Foreign key(cityId) references city(id)
)");
            return Execute(Command); 
        }
    }
}