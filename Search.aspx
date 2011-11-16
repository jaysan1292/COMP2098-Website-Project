<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register Src="UserControls/ItemList.ascx" TagName="ItemList" TagPrefix="uc1" %>
<%@ Register Src="UserControls/ResultsList.ascx" TagName="ResultsList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc2:ResultsList ID="ResultsList1" runat="server" />
    <%--<uc1:ItemList ID="ItemList1" runat="server" />--%>
</asp:Content>
