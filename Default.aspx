﻿<%@ Page Title="JDwebstore - Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/ItemList.ascx" TagName="ItemList" TagPrefix="uc1" %>
<%@ Register Src="UserControls/CategoryList.ascx" TagName="CategoryList" TagPrefix="uc2" %>
<%@ Register Src="UserControls/Spotlight.ascx" TagName="Spotlight" TagPrefix="uc3" %>
<%@ Register Src="UserControls/AccountSidebar.ascx" TagName="AccountSidebar" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Spotlight.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/slides.jquery.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-left">
        <uc4:AccountSidebar ID="AccountSidebar1" runat="server" />
    </div>
    <div id="content-right">
        <uc3:Spotlight ID="Spotlight1" runat="server" />
        <uc1:ItemList ID="ItemList1" runat="server" />
    </div>
</asp:Content>
