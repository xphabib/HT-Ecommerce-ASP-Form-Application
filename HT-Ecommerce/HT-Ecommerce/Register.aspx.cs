using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                DropDownList ddlCountry = (DropDownList)DetailsView1.FindControl("ddlCountry");
                ddlCountry.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCountry = (DropDownList)DetailsView1.FindControl("ddlCountry");
            DropDownList ddlCity = (DropDownList)DetailsView1.FindControl("ddlCity");
            ddlCity.Items.Clear();

            DAL.City c = new DAL.City();
            c.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);

            ddlCity.DataSource = c.Select().Tables[0];
            ddlCity.DataTextField = "name";
            ddlCity.DataValueField = "id";
            ddlCity.DataBind();

            ddlCity.Items.Insert(0, new ListItem("Select", "0"));



        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["joinDate"] = DateTime.Now;
            e.Values["joinIP"] = Request.UserHostAddress;
            e.Values["userType"] = "U";
            e.Values["cityId"] = ((DropDownList)DetailsView1.FindControl("ddlCity")).SelectedValue;
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            string to = e.Values["email"].ToString();

            string subject = "Varification Mail from HTEcommerce.com";

            string message = "Dear " + e.Values["name"].ToString();
            message += "<br>";
            message += "You have recently register in our website from IP : " + e.Values["joinIP"].ToString() + ".<br>";
            message += "<p>Click the following link to activate your account <a href=\"http://localhost:49932/active.aspx?email="+ e.Values["email"].ToString() +"\">Active</a></p>";
            message += "<p>If it were not you please Click the following link to DeActivate your account <a href=\"http://localhost:49932/deActive.aspx?email=" + e.Values["email"].ToString() + "\">De Active</a></p>";

            Session["msggg"] = message;
            Server.Transfer("RegistrationSuccess.aspx");


            //StringBuilder sb = new StringBuilder();
            //sb.ap

            //System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            //msg.Body = message;
            ////msg.From = "admin@gmail.com";
            //msg.IsBodyHtml = true;

            //msg.Subject = subject;
            ////msg.To = to;

           

            //System.Net.Mail.SmtpClient sc = new System.Net.Mail.SmtpClient();
            ////sc.Send()

            //sc.UseDefaultCredentials = true;

            //sc.Send(msg);


        }
    }
}