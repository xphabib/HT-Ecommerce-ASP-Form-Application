<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="HT_Ecommerce.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link href="Content/Shop.css" rel="stylesheet" />
    <div class="cart-summery"> <%= ((List<HT_Ecommerce.DAL.Item>)Session["cart"]).Sum(i=>i.Qty) %> Item in Cart, Total : <%= ((List<HT_Ecommerce.DAL.Item>)Session["cart"]).Sum(i=>i.SubTotal) %> BDT/=, <a href="checkout.aspx">Checkout</a></div>
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
           <div class="product">
            <h1><%# Eval("name") + ", " + Eval("code") %></h1>
            <img src="uploads/images/<%# Eval("image") %>" />
                <div>
                    <span><i class="cross">
                        <%# Eval("price") %></i> - <%# Eval("discount") %> = <%# Eval("finalPrice") %> BDT/=
                    </span>
                    <p><%# Eval("description") %></p>
                    <p>
                        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("id") %>' OnClick="btnAdd_Click" /></p>
                </div>
         </div>
        </ItemTemplate>
    </asp:Repeater>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name], [code], [tag], [category], [brand], [unit], [description], [price], [discount], [finalPrice], [lastUpdate], [comments], [likes], [image] FROM [vwProduct] WHERE ([category] = @category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="category" QueryStringField="category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
