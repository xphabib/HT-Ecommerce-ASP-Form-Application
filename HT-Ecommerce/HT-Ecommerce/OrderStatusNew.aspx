<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderStatusNew.aspx.cs" Inherits="HT_Ecommerce.OrderStatusNew" Theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <asp:DetailsView ID="dvOrderStatus" runat="server" AutoGenerateRows="False" DataKeyNames="orderId,statusId" DataSourceID="SqlDataSource18" DefaultMode="Insert" Height="50px" OnItemInserted="dvOrderStatus_ItemInserted" Width="125px">
        <Fields>
            <asp:TemplateField HeaderText="Order Id" SortExpression="orderId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img alt="" src="images/special.gif" style="width: 280px; height: 13px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlOrder" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource19" DataTextField="number" DataValueField="id" SelectedValue='<%# Bind("orderId") %>'>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [number] FROM [orders]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="statusId">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("statusId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                        <ProgressTemplate>
                            <img alt="" src="images/special.gif" style="width: 280px; height: 13px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource20" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" SelectedValue='<%# Bind("statusId") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [status]"></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("statusId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dateTime") %>' ></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtDateTime" runat="server">
</asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdateProgress ID="UpdateProgress3" runat="server">
                        <ProgressTemplate>
                            <img alt="" src="images/special.gif" style="width: 280px; height: 13px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource22" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("userId") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [users]"></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orderStatus] WHERE [orderId] = @original_orderId AND [statusId] = @original_statusId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [userId] = @original_userId" InsertCommand="INSERT INTO [orderStatus] ([orderId], [statusId], [dateTime], [userId]) VALUES (@orderId, @statusId, @dateTime, @userId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [orderId], [statusId], [dateTime], [userId] FROM [orderStatus]" UpdateCommand="UPDATE [orderStatus] SET [dateTime] = @dateTime, [userId] = @userId WHERE [orderId] = @original_orderId AND [statusId] = @original_statusId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [userId] = @original_userId">
        <DeleteParameters>
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_userId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orderId" Type="Int32" />
            <asp:Parameter Name="statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="userId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_userId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orderStatus] WHERE [orderId] = @original_orderId AND [statusId] = @original_statusId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [userId] = @original_userId" InsertCommand="INSERT INTO [orderStatus] ([orderId], [statusId], [dateTime], [userId]) VALUES (@orderId, @statusId, @dateTime, @userId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [orderId], [statusId], [dateTime], [userId] FROM [orderStatus]" UpdateCommand="UPDATE [orderStatus] SET [dateTime] = @dateTime, [userId] = @userId WHERE [orderId] = @original_orderId AND [statusId] = @original_statusId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [userId] = @original_userId">
        <DeleteParameters>
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_userId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orderId" Type="Int32" />
            <asp:Parameter Name="statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="userId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="dateTime" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_statusId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_dateTime" />
            <asp:Parameter Name="original_userId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
