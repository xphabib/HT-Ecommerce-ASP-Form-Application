using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class productImageNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvProductImage_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            FileUpload image =((FileUpload)dvProductImage.FindControl("fleImage"));
            image.SaveAs(Server.MapPath("uploads/images/" + image.FileName));
            lblMessage.Text = "Product Image Added";
            lblMessage.ForeColor = System.Drawing.Color.Green;

        }

        protected void dvProductImage_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            //e.Values["dateTime"] = DateTime.Now;
            e.Values["image"] = ((FileUpload)dvProductImage.FindControl("fleImage")).FileName;
        }
    }
}