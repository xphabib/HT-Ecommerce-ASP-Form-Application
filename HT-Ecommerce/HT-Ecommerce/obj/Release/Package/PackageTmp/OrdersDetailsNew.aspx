<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersDetailsNew.aspx.cs" Inherits="HT_Ecommerce.OrdersDetailsNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="dvOrdersDetails" runat="server" AutoGenerateRows="False" DataKeyNames="orderId,productId" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="dvOrdersDetails_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Order" SortExpression="orderId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlOrdersD" runat="server" DataSourceID="SqlDataSource4" DataTextField="number" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [number] FROM [orders]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlO2" runat="server" DataSourceID="SqlDataSource8" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [product]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="qty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate" SortExpression="rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [ordersDetails] WHERE [orderId] = @original_orderId AND [productId] = @original_productId AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))" InsertCommand="INSERT INTO [ordersDetails] ([orderId], [productId], [qty], [rate], [remarks]) VALUES (@orderId, @productId, @qty, @rate, @remarks)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [orderId], [productId], [qty], [rate], [remarks] FROM [ordersDetails]" UpdateCommand="UPDATE [ordersDetails] SET [qty] = @qty, [rate] = @rate, [remarks] = @remarks WHERE [orderId] = @original_orderId AND [productId] = @original_productId AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_qty" Type="Int32" />
            <asp:Parameter Name="original_rate" Type="String" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orderId" Type="Int32" />
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="qty" Type="Int32" />
            <asp:Parameter Name="rate" Type="String" />
            <asp:Parameter Name="remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="qty" Type="Int32" />
            <asp:Parameter Name="rate" Type="String" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_qty" Type="Int32" />
            <asp:Parameter Name="original_rate" Type="String" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
