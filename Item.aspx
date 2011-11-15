<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
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
</asp:Content>