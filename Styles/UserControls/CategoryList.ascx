<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryList.ascx.cs" Inherits="UserControls_CategoryList" %>
<asp:DataList ID="CategoryList" runat="server" Width="200px">
    <HeaderTemplate>
        Choose a Category
    </HeaderTemplate>
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# Link.ToCategory(Eval("CategoryID").ToString()) %>' 
            Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>