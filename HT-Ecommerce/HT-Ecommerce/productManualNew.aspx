<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productManualNew.aspx.cs" Inherits="HT_Ecommerce.productManualNew" Theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="productId" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted" OnItemInserting="DetailsView1_ItemInserting">
        <Fields>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                  
                        <asp:DropDownList ID="ddlProduct" runat="server" selectedValue='<%# Bind("productId") %>' DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [product]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manual" SortExpression="manual">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("manual") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:FileUpload ID="fleManual" runat="server" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("manual") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [productManual] WHERE [productId] = @original_productId AND (([manual] = @original_manual) OR ([manual] IS NULL AND @original_manual IS NULL))" InsertCommand="INSERT INTO [productManual] ([productId], [manual]) VALUES (@productId, @manual)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [productManual]" UpdateCommand="UPDATE [productManual] SET [manual] = @manual WHERE [productId] = @original_productId AND (([manual] = @original_manual) OR ([manual] IS NULL AND @original_manual IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_manual" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="manual" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="manual" Type="String" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_manual" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
