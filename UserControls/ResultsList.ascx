<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResultsList.ascx.cs" Inherits="UserControls_ResultsList" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="Pager2" runat="server" />
<div id="itemcontainer">
    <asp:DataList ID="lstResults" runat="server">
        <ItemTemplate>
            <div id="itemimage">
                <asp:Image ID="imgThummb" runat="server" />
            </div>
            <div id="iteminfo">
                <asp:Label ID="lblTitle" runat="server">Title</asp:Label>
                <asp:Label ID="lblDescription" runat="server">Description</asp:Label>
                <asp:Label ID="lblPrice" runat="server">Price</asp:Label>
                <asp:HyperLink ID="lnkItem" runat="server">More Info  &gt;&gt;</asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:DataList>
</div>
<uc1:Pager ID="Pager1" runat="server" />
