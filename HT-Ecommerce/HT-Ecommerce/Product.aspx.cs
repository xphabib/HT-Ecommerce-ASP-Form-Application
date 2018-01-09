using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() != "A")
            {
                Session["msg"] = "You have to login with admin account to view this content";
                Session["reDirect"] = "Product.aspx";
                Server.Transfer("login.aspx");
            }

            DAL.Product product=new DAL.Product();
                dgvProduct.DataSource = product.Select().Tables[0];
                dgvProduct.DataBind();
        }

    }
}