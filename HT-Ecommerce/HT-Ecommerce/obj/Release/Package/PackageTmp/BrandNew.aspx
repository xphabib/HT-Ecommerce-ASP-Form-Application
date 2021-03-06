﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrandNew.aspx.cs" Inherits="HT_Ecommerce.BrandNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
<br />
<asp:DetailsView ID="dvBrand" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="125px" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DefaultMode="Insert" ForeColor="Black" GridLines="Horizontal" OnItemInserted="dvBrand_ItemInserted">
    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <Fields>
        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name" SortExpression="name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Description" SortExpression="description">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Mycon %>" DeleteCommand="DELETE FROM [brand] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))" InsertCommand="INSERT INTO [brand] ([name], [description]) VALUES (@name, @description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [brand]" UpdateCommand="UPDATE [brand] SET [name] = @name, [description] = @description WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_name" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_name" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
