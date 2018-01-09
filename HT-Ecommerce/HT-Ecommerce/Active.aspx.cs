using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Active : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Users u = new DAL.Users();
            u.Email = Request.QueryString["email"];
            if(u.Active())
            {
                Label1.Text = "Congratulation, your account is now activated";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = u.Error;
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}