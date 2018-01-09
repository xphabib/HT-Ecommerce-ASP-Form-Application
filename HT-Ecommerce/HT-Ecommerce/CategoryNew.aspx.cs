using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class CategoryNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
                loadCategory();
        }

        private void loadCategory()
        {
            SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select id, name from category";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();

            DropDownList ddlCategory = (DropDownList)dvCategory.FindControl("ddlCategory");


            ddlCategory.Items.Clear();

            ddlCategory.Items.Add(new ListItem("Select", ""));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlCategory.Items.Add(new ListItem(ds.Tables[0].Rows[i].ItemArray[1].ToString(), ds.Tables[0].Rows[i].ItemArray[0].ToString()));
            }
        }

        protected void dvCategory_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Catagory Added";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            loadCategory();
        }

        protected void dvCategory_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            if (e.Values["categoryId"] == null || e.Values["categoryId"].ToString() == "")
            {
                e.Values["categoryId"] = null;
            }
        }
    }
}