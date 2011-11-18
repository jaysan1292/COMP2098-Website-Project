<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pager.ascx.cs" Inherits="UserControls_Pager" %>
<p>
    Page
    <asp:Label ID="lblCurrentPage" runat="server" />
    of
    <asp:Label ID="lblTotalPages" runat="server" />
    |
    <asp:HyperLink ID="lnkPrevious" runat="server">Previous</asp:HyperLink>
    <asp:Repeater ID="repPages" runat="server">
        <ItemTemplate>
            <asp:HyperLink ID="hyperlink" runat="server" Text='<%# Eval("page") %>' NavigateUrl='<%# Eval("url") %>' />
        </ItemTemplate>
    </asp:Repeater>
    <asp:HyperLink ID="lnkNext" runat="server">Next</asp:HyperLink>
</p>
