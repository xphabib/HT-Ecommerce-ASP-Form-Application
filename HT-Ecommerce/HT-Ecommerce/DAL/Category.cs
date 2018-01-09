using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
     class Category:MyBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public string Description { get; set; }
        


        public bool Insert()
        {

            return true;
            

           
        }

        public DataSet Select()
        {
            Command = MyCommand(@" select id, name from category where id > 0");
            if(!string.IsNullOrEmpty(Name))
            {
                Command.CommandText += " and name = @name";
                Command.Parameters.AddWithValue("@name", Name);
            }

            if (CategoryId > 0)
            {
                Command.CommandText += " and categoryId = @categoryId";
                Command.Parameters.AddWithValue("@categoryId", CategoryId);
            }
            else
            {
                Command.CommandText += " and categoryId is null";
            }
            return ExecuteDataSet(Command);
        }

        public DataSet SelectByParentName(string parentName)
        {
            Command = MyCommand(@" select c1.id, c1.name, c2.name as category  from category as c1 left join category as c2 on c1.categoryId = c2.id where c1.id > 0");
           
         
            if(parentName != "")
            {
                Command.CommandText += " and c2.name = @parentName";
                Command.Parameters.AddWithValue("@parentName", parentName);
            }    

           
            return ExecuteDataSet(Command);
        }
    }
}