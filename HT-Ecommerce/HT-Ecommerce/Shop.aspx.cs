using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class Shop : System.Web.UI.Page
    {

        string allCategory = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string category = Request.QueryString["category"];
            allCategory += "'" + category + "'";
            SqlDataSource1.SelectCommand = "SELECT [id], [name], [code], [tag], [category], [brand], [unit], [description], [price], [discount], [finalPrice], [lastUpdate], [comments], [likes], [image] FROM [vwProduct] ";

            if (!string.IsNullOrEmpty(category))
            {
                SqlDataSource1.SelectCommand += " where category in("+ findSubCategory(category) +")";
            }


            cartManager();

        }

        private void cartManager()
        {
            var v = Repeater1.FindControl("btnAdd");

        }

        private string findSubCategory(string category)
        {

            DAL.Category c = new DAL.Category();
            System.Data.DataTable dt = c.SelectByParentName(category).Tables[0];

            for(int i = 0; i < dt.Rows.Count; i++)
            {
                allCategory += ", '" + dt.Rows[i].ItemArray[1].ToString() + "'";
                findSubCategory(dt.Rows[i].ItemArray[1].ToString());
            }

            return allCategory;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            List<DAL.Item> Items = (List<DAL.Item>) Session["cart"];
            Button btn = (Button)sender;
            DAL.Product p = new DAL.Product();
            p.Id = Convert.ToInt32(btn.CommandArgument);

            if (btn.Text == "Remove")
            {
                var v = Items.Where(i => i.ProductId == p.Id).First();
                Items.Remove(v);
                btn.Text = "Add To Cart";
            }
            else
            {
                btn.Text = "Remove";

                var v = Items.Where(i => i.ProductId == p.Id);
                if (v.Count() > 0)
                    return;

                p.SelectById();

                Items.Add(new DAL.Item() { ProductId = p.Id, Product = p.Name, Qty = 1, Rate = p.finalPrice });

                Session["cart"] = Items;
            }
            


        }
    }
}