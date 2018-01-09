<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productCommentNew.aspx.cs" Inherits="HT_Ecommerce.productCommentNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMasseg" runat="server" Font-Bold="True"></asp:Label>
    <asp:DetailsView ID="dvproductComment" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" OnItemInserted="dvproductComment_ItemInserted" Width="125px">
        <Fields>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img alt="" src="images/special.gif" style="width: 280px; height: 13px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlproductComment" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource9" DataTextField="name" DataValueField="id" Selectedvalue='<%# Bind("productId") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon1 %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
               </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="UserId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                <ProgressTemplate>
                                    <img alt="" src="images/special.gif" style="width: 280px; height: 13px" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <asp:DropDownList ID="ddluser" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource10" DataTextField="name" DataValueField="id" Selectedvalue='<%# Bind("UserId") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon1 %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment" SortExpression="comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("comment") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("comment") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon1 %>" DeleteCommand="DELETE FROM [productComments] WHERE [id] = @original_id AND [productId] = @original_productId AND [UserId] = @original_UserId AND (([comment] = @original_comment) OR ([comment] IS NULL AND @original_comment IS NULL))" InsertCommand="INSERT INTO [productComments] ([productId], [UserId], [comment]) VALUES (@productId, @UserId, @comment)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [productId], [UserId], [comment] FROM [productComments]" UpdateCommand="UPDATE [productComments] SET [productId] = @productId, [UserId] = @UserId, [comment] = @comment WHERE [id] = @original_id AND [productId] = @original_productId AND [UserId] = @original_UserId AND (([comment] = @original_comment) OR ([comment] IS NULL AND @original_comment IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_UserId" Type="Int32" />
            <asp:Parameter Name="original_comment" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="comment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_UserId" Type="Int32" />
            <asp:Parameter Name="original_comment" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
