<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="resend.aspx.cs" Inherits="HT_Ecommerce.resend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Your account is not activated. Please check your email and follow the instruction,
    </p>
    <p>
        &nbsp;</p>
    <p>
        if you dont get the email, enter your email and request a resend</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:Button ID="btnResend" runat="server" OnClick="btnResend_Click" Text="Resend" />
    </p>
</asp:Content>
