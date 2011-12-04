<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<%@ Register src="UserControls/ItemList.ascx" tagname="ItemList" tagprefix="uc1" %>

<%@ Register src="UserControls/AccountSidebar.ascx" tagname="AccountSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content-left"><uc2:AccountSidebar ID="AccountSidebar1" runat="server" />
    </div>
    <div id="content-right"><uc1:ItemList ID="ItemList1" runat="server" /></div>
</asp:Content>

