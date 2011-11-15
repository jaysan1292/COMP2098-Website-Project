<%@ Page Title="JDwebstore - Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="UserControls/Menu_Common.ascx" tagname="Menu_Common" tagprefix="uc1" %>

<%@ Register src="UserControls/CategoryList.ascx" tagname="CategoryList" tagprefix="uc2" %>

<%@ Register src="UserControls/ItemList.ascx" tagname="ItemList" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <div id="spotlight">
        <asp:Panel ID="Panel1" runat="server" Height="350px" Width="800px">
        </asp:Panel>
    </div>--%>
    <div id="content-left">
        <uc2:CategoryList ID="CategoryList1" runat="server" />
    </div>
    <div id="content-right">
        <uc3:ItemList ID="ItemList1" runat="server" />
</div>
</asp:Content>

