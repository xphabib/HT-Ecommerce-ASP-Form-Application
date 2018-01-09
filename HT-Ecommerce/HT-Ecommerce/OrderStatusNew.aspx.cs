using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class OrderStatusNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TextBox1.text= DateTime.Now.ToString();
        }

        protected void dvOrderStatus_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Order Status updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}