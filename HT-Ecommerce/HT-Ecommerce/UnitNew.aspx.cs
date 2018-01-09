using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class UnitNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvunit_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "New Unit added";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}