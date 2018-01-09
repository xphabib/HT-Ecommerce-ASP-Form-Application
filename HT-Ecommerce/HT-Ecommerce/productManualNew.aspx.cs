using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class productManualNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["manual"] =((FileUpload)DetailsView1.FindControl("fleManual")).FileName;
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            FileUpload manual = ((FileUpload)DetailsView1.FindControl("fleManual"));
            manual.SaveAs(Server.MapPath("uploads/files/" + manual.FileName));

            lblMessage.Text = "Prouduct Manual Saved";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}