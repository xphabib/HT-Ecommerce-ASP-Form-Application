using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class OrdersDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() != "A")
            {
                Session["msg"] = "You have to login with admin account to view this content";
                Session["reDirect"] = "OrderDetails.aspx";
                Server.Transfer("login.aspx");
            }
        }
    }
}