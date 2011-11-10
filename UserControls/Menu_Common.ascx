<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu_Common.ascx.cs" Inherits="UserControls_WebUserControl" %>
<ul id="menu">
    <li id="nav-home"><asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></li>
    <li id="nav-category"><asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl="~/Category.aspx">Categories</asp:HyperLink></li>
    <li id="nav-account"><asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="~/Account.aspx">Account</asp:HyperLink></li>
    <li><asp:TextBox ID="txtSearch" runat="server" CssClass="nav-search">Search</asp:TextBox></li>
</ul>