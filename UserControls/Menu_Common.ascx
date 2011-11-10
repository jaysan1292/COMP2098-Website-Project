<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu_Common.ascx.cs" Inherits="UserControls_WebUserControl" %>
<ul class="menu">
    <li><asp:HyperLink ID="lnkHome" runat="server">Home</asp:HyperLink></li>
    <li><asp:HyperLink ID="lnkCategory" runat="server">Categories</asp:HyperLink></li>
    <li><asp:HyperLink ID="lnkAccount" runat="server">Account</asp:HyperLink></li>
    <li><asp:TextBox ID="txtSearch" runat="server">Search</asp:TextBox></li>
</ul>