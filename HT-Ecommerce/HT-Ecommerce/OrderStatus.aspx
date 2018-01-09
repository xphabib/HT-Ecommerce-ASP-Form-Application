<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="HT_Ecommerce.orderStatus" Theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/OrderStatusNew.aspx">New order status</asp:HyperLink>




    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="orderId" HeaderText="Order Id" SortExpression="orderId" />
            <asp:BoundField DataField="dateTime" HeaderText="Date Time" SortExpression="dateTime" />
            <asp:BoundField DataField="name" HeaderText="Status" SortExpression="name" />
            <asp:BoundField DataField="Expr1" HeaderText="Users" SortExpression="Expr1" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT orderStatus.orderId, orderStatus.dateTime, status.name, users.name AS Expr1 FROM orderStatus INNER JOIN orders ON orderStatus.orderId = orders.id INNER JOIN status ON orderStatus.statusId = status.id INNER JOIN users ON orderStatus.userId = users.id AND orders.userId = users.id"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource15" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [orderId], [statusId], [dateTime], [userId] FROM [orderStatus]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [orderId], [statusId], [dateTime], [userId] FROM [orderStatus]"></asp:SqlDataSource>
</asp:Content>
