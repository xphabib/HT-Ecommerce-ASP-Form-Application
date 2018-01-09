<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="RegistrationSuccess.aspx.cs" Inherits="HT_Ecommerce.RegistrationSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<p>
    Please check your mail to vairify. <br />
    <%= Session["msggg"].ToString() %>
</p>
</asp:Content>
