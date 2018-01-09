using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateDropdown("category", ddlCategory);
                PopulateDropdown("brand", ddlBrand);
                PopulateDropdown("unit", ddlUnit);
            }
        }

        protected void PopulateDropdown(string tableName,DropDownList ddl)
        {
            string conString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("", con);
            con.Open();
            string cmdText = "select id,name from " + tableName;
            cmd.CommandText = cmdText;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            ddl.DataTextField = ds.Tables[0].Columns["name"].ToString();
            ddl.DataValueField = ds.Tables[0].Columns["id"].ToString();
            ddl.DataSource = ds.Tables[0];
            ddl.DataBind();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DAL.Product product=new DAL.Product();
            product.Name = tbName.Text;
            product.Code = tbCode.Text;
            product.Tag = tbTag.Text;
            product.CategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            product.BrandId = Convert.ToInt32(ddlBrand.SelectedItem.Value);
            product.UnitId = Convert.ToInt32(ddlUnit.SelectedItem.Value);
            product.Description = tbDescription.Text;
            product.Price = Convert.ToInt32(tbPrice.Text);
            product.Discount = Convert.ToInt32(tbDiscount.Text);
            product.LastUpdate = DateTime.UtcNow.ToLongDateString();

            if (product.Insert())
            {
                lblMessage.Text = "Data Saved";
                lblMessage.ForeColor = Color.Green;
                
                //Response.Redirect("Product.aspx");
            }
            else
            {
                lblMessage.Text = product.Error;
                lblMessage.ForeColor = Color.Red;
            }

        }
    }
}