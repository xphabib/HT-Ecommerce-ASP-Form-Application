using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HT_Ecommerce.DAL
{
    abstract class MyBase
    {
        public virtual bool Common()
        {
            return false;
        }
        public string Error { get; set; }

        public int LastId { get; set; }

        protected SqlConnection cn = new SqlConnection();
        protected bool Connection()
        {
            if (MyReader != null && !MyReader.IsClosed)
                MyReader.Close();

            if (cn.State == System.Data.ConnectionState.Open)
                return true;
            
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString; 
            try
            {
                cn.Open();
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            return false;
        }

        public string Search { get; set; }

        public DateTime dateFrom { get; set; }
        public DateTime dateTo { get; set; }
        protected SqlCommand Command { get; set; }
        protected SqlDataReader MyReader { get; set; }

        protected SqlDataReader ExecuteReader(SqlCommand cmd)
        {
            if (!Connection())
                return null;
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }

        protected SqlCommand MyCommand(string SQL)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = SQL;
            return cmd;
        }

        protected DataSet ExecuteDataSet(string SQL)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SQL;
            cmd.Connection = cn;
            if (!Connection())
                return new DataSet();

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }

        protected DataSet ExecuteDataSet(SqlCommand cmd)
        {
            if (!Connection())
                return new DataSet();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }

        protected bool Execute(SqlCommand cmd)
        {
            if (!Connection())
                return false;
            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;

                // File writter here


                return false;
            }
        }

        protected bool ExecuteScaler(SqlCommand cmd)
        {
            if (!Connection())
                return false;
            try
            {
                LastId = Convert.ToInt32(cmd.ExecuteScalar());
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;

                // File writter here


                return false;
            }
        }

        public bool Database(string name)
        {
            Command = MyCommand("create database " + name);
            return Execute(Command);
        }

    }
}