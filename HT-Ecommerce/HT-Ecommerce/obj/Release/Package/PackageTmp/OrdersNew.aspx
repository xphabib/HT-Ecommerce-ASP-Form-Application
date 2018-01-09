<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersNew.aspx.cs" Inherits="HT_Ecommerce.OrdersNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <asp:DetailsView ID="dvOrders" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number" SortExpression="number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlOrdersOne" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [users]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total" SortExpression="total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivery Charge" SortExpression="deliveryCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("deliveryCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("deliveryCharge") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("deliveryCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Others Charge" SortExpression="othersCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("othersCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Method" SortExpression="paymentMethodId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("paymentMethodId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlOrdersTwo" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [paymentMethod]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("paymentMethodId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivery Address" SortExpression="deliveryAddress">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" SortExpression="locationId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("locationId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlOrdersThree" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [location]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("locationId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orders] WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([number] = @original_number) OR ([number] IS NULL AND @original_number IS NULL)) AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([deliveryCharge] = @original_deliveryCharge) OR ([deliveryCharge] IS NULL AND @original_deliveryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL)) AND (([deliveryAddress] = @original_deliveryAddress) OR ([deliveryAddress] IS NULL AND @original_deliveryAddress IS NULL)) AND [locationId] = @original_locationId" InsertCommand="INSERT INTO [orders] ([dateTime], [number], [userId], [total], [deliveryCharge], [othersCharge], [paymentMethodId], [deliveryAddress], [locationId]) VALUES (@dateTime, @number, @userId, @total, @deliveryCharge, @othersCharge, @paymentMethodId, @deliveryAddress, @locationId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [dateTime], [number], [userId], [total], [deliveryCharge], [othersCharge], [paymentMethodId], [deliveryAddress], [locationId] FROM [orders]" UpdateCommand="UPDATE [orders] SET [dateTime] = @dateTime, [number] = @number, [userId] = @userId, [total] = @total, [deliveryCharge] = @deliveryCharge, [othersCharge] = @othersCharge, [paymentMethodId] = @paymentMethodId, [deliveryAddress] = @deliveryAddress, [locationId] = @locationId WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([number] = @original_number) OR ([number] IS NULL AND @original_number IS NULL)) AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([deliveryCharge] = @original_deliveryCharge) OR ([deliveryCharge] IS NULL AND @original_deliveryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL)) AND (([deliveryAddress] = @original_deliveryAddress) OR ([deliveryAddress] IS NULL AND @original_deliveryAddress IS NULL)) AND [locationId] = @original_locationId">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_number" Type="Int32" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Int32" />
            <asp:Parameter Name="original_deliveryCharge" Type="String" />
            <asp:Parameter Name="original_othersCharge" Type="String" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
            <asp:Parameter Name="original_deliveryAddress" Type="String" />
            <asp:Parameter Name="original_locationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="number" Type="Int32" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Int32" />
            <asp:Parameter Name="deliveryCharge" Type="String" />
            <asp:Parameter Name="othersCharge" Type="String" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
            <asp:Parameter Name="deliveryAddress" Type="String" />
            <asp:Parameter Name="locationId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="number" Type="Int32" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Int32" />
            <asp:Parameter Name="deliveryCharge" Type="String" />
            <asp:Parameter Name="othersCharge" Type="String" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
            <asp:Parameter Name="deliveryAddress" Type="String" />
            <asp:Parameter Name="locationId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_number" Type="Int32" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Int32" />
            <asp:Parameter Name="original_deliveryCharge" Type="String" />
            <asp:Parameter Name="original_othersCharge" Type="String" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
            <asp:Parameter Name="original_deliveryAddress" Type="String" />
            <asp:Parameter Name="original_locationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
