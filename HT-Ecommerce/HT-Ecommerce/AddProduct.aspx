<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="HT_Ecommerce.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 40px"></div>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>

    <div class="form-group">
        <label>Name:</label>
        <asp:TextBox ID="tbName" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvName" ControlToValidate="tbName" runat="server" ErrorMessage="Required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="form-group">
        <label>Code:</label>
        <asp:TextBox ID="tbCode" CssClass="form-control" runat="server"></asp:TextBox>
        <span>
        <asp:RequiredFieldValidator ID="rfvCode" ControlToValidate="tbCode" runat="server" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </span>
    </div>
    <div class="form-group">
        <label>Tag:</label>
        <asp:TextBox ID="tbTag" CssClass="form-control" runat="server"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator ID="rfvTag" ControlToValidate="tbTag" runat="server" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </span>
    </div>
    
    <div class="form-group">
        <label>Cetagory:</label>
        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" DataTextField="name" DataValueField="id"></asp:DropDownList>
        
         
    </div>
    <div class="form-group">
        <label>Brand:</label>
        <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
        
    </div>
    
    <div class="form-group">
        <label>Unit:</label>
        <asp:DropDownList ID="ddlUnit" CssClass="form-control" runat="server"></asp:DropDownList>
        
    </div>
    
    <div class="form-group">
        <label>Description:</label>
        <asp:TextBox ID="tbDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
        
    </div>
    
    <div class="form-group">
        <label>Price:</label>
        <asp:TextBox ID="tbPrice" CssClass="form-control" runat="server"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbPrice" runat="server" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </span>
    </div>
    
    <div class="form-group">
        <label>Discount:</label>
        <asp:TextBox ID="tbDiscount" CssClass="form-control" runat="server"></asp:TextBox>
        
    </div>
        
    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add Product" OnClick="btnAdd_Click" />
    
</asp:Content>
