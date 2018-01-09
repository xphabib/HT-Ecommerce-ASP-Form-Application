using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class PaymentMethodNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvPaymentMethod_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            
            if(e.Exception == null)
            {
                lblMessage.Text = "Payment Medthod Saved";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = e.Exception.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;

                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }

        }

        protected void dvPaymentMethod_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            int er = 0;
            TextBox Name = (TextBox)dvPaymentMethod.FindControl("txtName");
            TextBox Description = (TextBox)dvPaymentMethod.FindControl("txtDescription");
            TextBox Processor = (TextBox)dvPaymentMethod.FindControl("txtProcessor");
            if (Name == null || Name.ToString() == "")
            {
                er++;
                Label lblName = (Label)dvPaymentMethod.FindControl("lblName");
                lblName.Text = "Name Required";
            }
            if (Description == null || Description.ToString() == "")
            {
                er++;
                Label lblDescription = (Label)dvPaymentMethod.FindControl("lblDescription");
                lblDescription.Text = "Description Required";
            }
            if (Processor == null || Processor.ToString() == "")
            {
                er++;
                Label lblProcessor = (Label)dvPaymentMethod.FindControl("lblProcessor");
                lblProcessor.Text = "Processor Required";
            }
            if (er > 0)
                e.Cancel = true;
        }
    }
}