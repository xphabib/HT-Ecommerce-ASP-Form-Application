using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblMessage.Text = Session["msg"].ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblEEmail.Text = "";
            lblMessage.Text = "";
            lblEPassword.Text = "";

            int er = 0;

            if(txtEmail.Text == "")
            {
                er++;
                lblEEmail.Text = "Required";
            }

            if(txtPassword.Text == "")
            {
                er++;
                lblEPassword.Text = "Required";
            }

            if (er > 0)
                return;


            DAL.Users u = new DAL.Users();
            u.Email = txtEmail.Text;
            u.Password = txtPassword.Text;

            if(u.Login())
            {
                if(!u.IsActive(u.Email))
                {
                    Server.Transfer("resend.aspx");
                }
                Session["id"] = u.Id;
                Session["name"] = u.Name;
                Session["type"] = u.UserType;
                Session["address"] = u.Address;
                

                if(chkRemember.Checked)
                {
                    // cokie variable set here
                }

               if(Session["reDirect"].ToString() == "")
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect(Session["reDirect"].ToString());
                }
               
            }
            else
            {
                lblMessage.Text = u.Error;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}