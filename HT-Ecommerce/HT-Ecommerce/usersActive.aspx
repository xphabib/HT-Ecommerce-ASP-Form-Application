<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersActive.aspx.cs" Inherits="HT_Ecommerce.usersActive" Theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<br />
<asp:GridView ID="gvUsersActive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userId" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="userId" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="userId" Visible="False" />
        <asp:TemplateField HeaderText="Users" SortExpression="users">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("users") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("users") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Datetime" SortExpression="datetime">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("datetime") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("datetime") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [usersActive] WHERE [userId] = @original_userId AND (([datetime] = @original_datetime) OR ([datetime] IS NULL AND @original_datetime IS NULL))" InsertCommand="INSERT INTO [usersActive] ([datetime]) VALUES (@datetime)" OldValuesParameterFormatString="original_{0}" SelectCommand="select uc.userId,(u.name)users,uc.datetime from usersActive As uc
left join users u on uc.userId = u.id" UpdateCommand="UPDATE [usersActive] SET [datetime] = @datetime WHERE [userId] = @original_userId AND (([datetime] = @original_datetime) OR ([datetime] IS NULL AND @original_datetime IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_userId" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_datetime" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter DbType="Date" Name="datetime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter DbType="Date" Name="datetime" />
        <asp:Parameter Name="original_userId" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_datetime" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
