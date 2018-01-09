using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() != "A")
            {
                Session["msg"] = "You have to login with admin account to view this content";
                Session["reDirect"] = "Orders.aspx";
                Response.Redirect("login.aspx");
            }

            txtDateFrom.Text = DateTime.Now.ToShortDateString();
            txtDateTo.Text = DateTime.Now.ToShortDateString();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLoadData_Click(object sender, EventArgs e)
        {
            DAL.Orders o = new DAL.Orders();
            o.Search = txtSearch.Text;
            o.dateFrom = Convert.ToDateTime(txtDateFrom.Text);
            o.dateTo = Convert.ToDateTime(txtDateTo.Text);

            o.paymentMethod = Convert.ToInt32(ddlPaymentMethod.SelectedValue);
            o.locationId = Convert.ToInt32(ddlLocation.SelectedValue);





            GridView1.DataSource = o.Select().Tables[0];
            GridView1.DataBind();

        }

        protected void btnNewStatus_Click(object sender, EventArgs e)
        {
            DAL.Orders o = new DAL.Orders();
            if(o.StatusInsert(Convert.ToInt32(GridView1.SelectedValue), Convert.ToInt32(ddlNewStatus.SelectedValue), Convert.ToInt32(Session["id"])))
            {
                lblMessage.Text = "Status Updated";

            }
            else
            {
                lblMessage.Text = o.Error;
            }
        }
    }
}