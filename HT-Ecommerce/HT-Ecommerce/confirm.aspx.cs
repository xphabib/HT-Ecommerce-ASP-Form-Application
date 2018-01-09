using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var items = (List<DAL.Item>)Session["cart"];
                GridView1.DataSource = items;
                GridView1.DataBind();

                //GridView1

                try
                {
                    ((Label)GridView1.FooterRow.FindControl("lblDadaTotal")).Text = items.Sum(i => i.SubTotal).ToString();
                }
                catch { }
                //DAL.Users u = new DAL.Users();
                //u.Id = (Int32)Session["id"];
                //u.s

                txtAddress.Text = Session["address"].ToString();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var items = (List<DAL.Item>)Session["cart"];
            DAL.Orders ord = new DAL.Orders();
            ord.deliveryAddress = txtAddress.Text;
            ord.deliveryCharge = Convert.ToDouble(txtDeliveryCharge.Text);
            ord.locationId = Convert.ToInt32(ddlLocation.SelectedValue);
            ord.number = DateTime.Now.ToString();
            ord.othersCharge = Convert.ToDouble(txtOtherCharge.Text);
            ord.paymentMethod = Convert.ToInt32(ddlPaymentMethod.SelectedValue);
            ord.total = items.Sum(i => i.SubTotal);
            ord.userId = Convert.ToInt32(Session["id"]);

            if(ord.Insert())
            {
                foreach (var item in items)
                {
                    DAL.OrderDetails ordD = new DAL.OrderDetails();
                    ordD.OrderId = ord.LastId;
                    ordD.ProductId = item.ProductId;
                    ordD.Qty = item.Qty;
                    ordD.Rate = item.Rate;
                    ordD.Remarks = "Shoitan gula field ta miss korce";
                    ordD.Insert();
                }
                Response.Redirect("orderSuccesfull.aspx");
            }

        }
    }
}