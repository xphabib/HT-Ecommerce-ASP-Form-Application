using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class UsersNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvusers_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = " New User Inserted......";

        }

        protected void dvusers_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
        {
           
        }

        protected void dvusers_ItemInserted2(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "New user added.";
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["joinIP"] = Request.UserHostAddress;
            e.Values["gender"] = Request["gender"];
        }
    }
}