<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="HT_Ecommerce.Category" StyleSheetTheme="Default" Theme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT c1.id, c1.name, c1.description, c2.name as category from category as c1 left join category as c2 on c1.categoryId = c2.id"></asp:SqlDataSource>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CategoryNew.aspx">New Category</asp:HyperLink>
</asp:Content>
