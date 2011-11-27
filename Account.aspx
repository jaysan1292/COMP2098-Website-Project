<%@ Page Title="Your Account" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h3>
            Your Account</h3>
        <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="~/Cart.aspx">Shopping Cart</asp:HyperLink>
    </div>
    <hr />
    <div>
        <h3>
            Admin stuff</h3>
        <a href="ItemManager.aspx">View and manage all items in database</a>
    </div>
</asp:Content>
