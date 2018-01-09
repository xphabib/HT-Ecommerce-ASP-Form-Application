using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Public : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        string s = "";
        public string generateMenu(int pid = 0)
        {
            DAL.Category c = new DAL.Category();
            c.CategoryId = pid;
            System.Data.DataTable dt = c.Select().Tables[0];
            if (dt.Rows.Count > 0)
            {
                if(pid != 0)
                    s += "<ul>";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    s += "<li><a href=\"Shop.aspx?category=" + dt.Rows[i].ItemArray[1].ToString() + "\">" + dt.Rows[i].ItemArray[1].ToString() + "</a>\n";
                    generateMenu(Convert.ToInt32(dt.Rows[i].ItemArray[0]));
                    s += "</li>";
                }
                if(pid != 0)
                    s += "</ul>";
            }
            return s;
        }

        public string userMenu()
        {
            string s = "";
            if(Session["type"].ToString() == "")
            {
                s += "<li><a href=\"Register.aspx\">Register</a></li><li><a href=\"Login.aspx\">Login</a></li> ";
            }
            else
            {
                s += "<li><a href=\"MyAccount.aspx\">My Account</a></li><li><a href=\"Logout.aspx\">Logout</a></li>";
                if (Session["type"].ToString() == "A")
                    s += "<li><a href=\"DefaultAdmin.aspx\">Admin Panel</li>";
            }
            return s;
        }

    }
}