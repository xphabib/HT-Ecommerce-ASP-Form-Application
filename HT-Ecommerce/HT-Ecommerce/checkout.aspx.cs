using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var items = (List<DAL.Item>)Session["cart"];
                GridView1.DataSource = items;
                GridView1.DataBind();

                //GridView1

                ((Label)GridView1.FooterRow.FindControl("lblDadaTotal")).Text = items.Sum(i=>i.SubTotal).ToString();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            List<DAL.Item> Items = (List<DAL.Item>)Session["cart"];

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int pid = Convert.ToInt32(((Label)GridView1.Rows[i].FindControl("lblId")).Text);

                DAL.Item item = Items.Where(it => it.ProductId == pid).First();
                item.Qty = Convert.ToInt32(((TextBox)GridView1.Rows[i].FindControl("txtQty")).Text);

            }

            Session["cart"] = Items;

            GridView1.DataSource = Items;
            GridView1.DataBind();
            ((Label)GridView1.FooterRow.FindControl("lblDadaTotal")).Text = Items.Sum(i => i.SubTotal).ToString();

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to make an order";
                Session["reDirect"] = "confirm.aspx";
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("confirm.aspx");
            }
        }
    }
}