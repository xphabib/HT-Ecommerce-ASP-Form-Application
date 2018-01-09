<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentMethodNew.aspx.cs" Inherits="HT_Ecommerce.PaymentMethodNew" Theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<asp:Label ID="lblMessage" runat="server"></asp:Label>
<asp:DetailsView ID="dvPaymentMethod" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="73px" OnItemInserted="dvPaymentMethod_ItemInserted" OnItemInserting="dvPaymentMethod_ItemInserting" Width="92px">
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
                <asp:TextBox ID="txtName" runat="server" Height="22px" Text='<%# Bind("name") %>' Width="539px"></asp:TextBox>
                <asp:Label ID="lblName" runat="server"></asp:Label>
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
                <asp:TextBox ID="txtDescription" runat="server" Height="52px" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="539px"></asp:TextBox>
                <asp:Label ID="lblDescription" runat="server"></asp:Label>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Processor" SortExpression="processor">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("processor") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtProcessor" runat="server" Text='<%# Bind("processor") %>' Width="539px"></asp:TextBox>
                <asp:Label ID="lblProcessor" runat="server"></asp:Label>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("processor") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [paymentMethod] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([processor] = @original_processor) OR ([processor] IS NULL AND @original_processor IS NULL))" InsertCommand="INSERT INTO [paymentMethod] ([name], [description], [processor]) VALUES (@name, @description, @processor)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [paymentMethod]" UpdateCommand="UPDATE [paymentMethod] SET [name] = @name, [description] = @description, [processor] = @processor WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([processor] = @original_processor) OR ([processor] IS NULL AND @original_processor IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_name" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_processor" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="processor" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="processor" Type="String" />
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_name" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_processor" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
