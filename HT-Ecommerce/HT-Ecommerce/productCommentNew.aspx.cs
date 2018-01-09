using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class productCommentNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

        }

        protected void dvproductComment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMasseg.Text = "Product Comment Added";
            lblMasseg.ForeColor = System.Drawing.Color.Green;
        }

       

        
    }
}