﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HT_Ecommerce
{
    public partial class BrandNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvBrand_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = " Brand Inserted ";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}