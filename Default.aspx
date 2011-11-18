<%@ Page Title="JDwebstore - Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/Menu_Common.ascx" TagName="Menu_Common" TagPrefix="uc1" %>
<%@ Register Src="UserControls/CategoryList.ascx" TagName="CategoryList" TagPrefix="uc2" %>
<%@ Register Src="UserControls/ItemList.ascx" TagName="ItemList" TagPrefix="uc1" %>
<%@ Register Src="UserControls/ResultsList.ascx" TagName="ResultsList" TagPrefix="uc2" %>
<%@ Register Src="UserControls/Spotlight.ascx" TagName="Spotlight" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="spotlight">
        <uc3:Spotlight ID="Spotlight1" runat="server" />
    </div>
    <div id="content-left">
        <uc2:CategoryList ID="CategoryList1" runat="server" />
    </div>
    <div id="content-right">
        <uc1:ItemList ID="ItemList1" runat="server" />
    </div>
</asp:Content>
