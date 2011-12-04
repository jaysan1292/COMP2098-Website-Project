<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>

<%@ Register src="UserControls/AccountSidebar.ascx" tagname="AccountSidebar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="content-left"><uc1:AccountSidebar ID="AccountSidebar1" runat="server" />
    </div>
<div id="content-right"><p>
        <asp:Label CssClass="CatalogTitle" ID="lblTitle" runat="server" Text="Title"></asp:Label>
    </p>
    <p>
        <asp:Image ID="imgItem" runat="server" />
    </p>
    <p>
        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
    </p>
    <p>
        <b>Price:</b>
        <asp:Label CssClass="ProductPrice" ID="lblPrice" runat="server" Text="$0.00"></asp:Label>
    </p>
    <p>
        <asp:LinkButton ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click">Add to Cart</asp:LinkButton>
    </p></div>
    
</asp:Content>
