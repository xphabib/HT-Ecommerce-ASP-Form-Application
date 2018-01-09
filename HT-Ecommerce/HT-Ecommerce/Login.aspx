<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HT_Ecommerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Email / Contact"></asp:Label>
<br />
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
<asp:Label ID="lblEEmail" runat="server" ForeColor="Red"></asp:Label>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
<br />
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:Label ID="lblEPassword" runat="server" ForeColor="Red"></asp:Label>
<br />
<br />
<asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" />
<br />
<br />
<asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
<br />
<br />
<asp:HyperLink ID="hpRegister" runat="server" NavigateUrl="register.aspx">Register</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="forgotPassword.aspx">Forgot Password</asp:HyperLink>
</asp:Content>
