<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="HT_Ecommerce.Orders" Theme="Red" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/OrdersNew.aspx">New Orders</asp:HyperLink>
    <br />
    <div class="search">
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="DateFrom"></asp:Label>
        <asp:TextBox ID="txtDateFrom" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" BehaviorID="txtDateFrom_CalendarExtender" TargetControlID="txtDateFrom" />
        <asp:Label ID="Label2" runat="server" Text="DateTo"></asp:Label>
        <asp:TextBox ID="txtDateTo" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" BehaviorID="txtDateTo_CalendarExtender" TargetControlID="txtDateTo" />
&nbsp;<asp:Label ID="Label3" runat="server" Text="User"></asp:Label>
        <asp:DropDownList ID="ddlUser" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="AmountFrom"></asp:Label>
        <asp:TextBox ID="txtAmmountFrom" runat="server"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Text="AmmountTo"></asp:Label>
        <asp:TextBox ID="txtAmountTo" runat="server"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" Text="PaymentMethod"></asp:Label>
        <asp:DropDownList ID="ddlPaymentMethod" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [paymentMethod]"></asp:SqlDataSource>
        <asp:Label ID="Label7" runat="server" Text="Country"></asp:Label>
        <asp:DropDownList ID="ddlCountry" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label8" runat="server" Text="Location"></asp:Label>
        <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id" AppendDataBoundItems="True">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [location]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label14" runat="server" Text="Order Status"></asp:Label>
        <asp:DropDownList ID="ddlOrderStatus" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="id">
            <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem Value="-1">New Order</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [status]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="btnLoadData" runat="server" Text="Load Data" OnClick="btnLoadData_Click" />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="id" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="dateTime" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("dateTime") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="number" SortExpression="number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="user" SortExpression="user">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("user") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("user") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="total" SortExpression="total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="deliveryCharge" SortExpression="deliveryCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("deliveryCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("deliveryCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="othersCharge" SortExpression="othersCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("othersCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="paymentMethod" SortExpression="paymentMethod">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("paymentMethod") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("paymentMethod") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="deliveryAddress" SortExpression="deliveryAddress">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="location" SortExpression="location">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="city" SortExpression="city">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="country" SortExpression="country">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    Process the order as
    <asp:Label ID="Label15" runat="server" Text="Status"></asp:Label>
    <asp:DropDownList ID="ddlNewStatus" runat="server" DataSourceID="SqlDataSource11" DataTextField="name" DataValueField="id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [status]"></asp:SqlDataSource>
    <asp:Button ID="btnNewStatus" runat="server" OnClick="btnNewStatus_Click" Text="Confirm" />
    <br />
    <br />
    <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId,productId" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="orderId" HeaderText="orderId" ReadOnly="True" SortExpression="orderId" />
            <asp:BoundField DataField="productId" HeaderText="productId" ReadOnly="True" SortExpression="productId" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
            <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [ordersDetails] WHERE ([orderId] = @orderId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="orderId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvOrderStatus" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId,statusId" DataSourceID="SqlDataSource5">
        <Columns>
            <asp:BoundField DataField="orderId" HeaderText="orderId" ReadOnly="True" SortExpression="orderId" />
            <asp:BoundField DataField="statusId" HeaderText="statusId" ReadOnly="True" SortExpression="statusId" />
            <asp:BoundField DataField="dateTime" HeaderText="dateTime" SortExpression="dateTime" />
            <asp:BoundField DataField="userId" HeaderText="userId" SortExpression="userId" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [orderStatus] WHERE ([orderId] = @orderId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="orderId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>
