<%@ Page Title="JDwebstore - Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/Menu_Common.ascx" TagName="Menu_Common" TagPrefix="uc1" %>
<%@ Register Src="UserControls/CategoryList.ascx" TagName="CategoryList" TagPrefix="uc2" %>
<%@ Register Src="UserControls/ItemList.ascx" TagName="ItemList" TagPrefix="uc1" %>
<%@ Register Src="UserControls/ResultsList.ascx" TagName="ResultsList" TagPrefix="uc2" %>
<%@ Register Src="UserControls/Spotlight.ascx" TagName="Spotlight" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="Scripts/Spotlight.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div id="spotlight">
        <uc3:Spotlight ID="Spotlight1" runat="server" />
    </div>--%>
    <div id="gallery">
        <div id="slides">
            <div class="slide"><img src="Images/Spotlight/macbook.jpg" width="780" height="400" /></div>
            <div class="slide"><img src="Images/Spotlight/iphone.jpg" width="780" height="400" /></div>
            <div class="slide"><img src="Images/Spotlight/imac.jpg" width="780" height="400" /></div>
        </div>
        <div id="menu">
            <ul>
                <li class="fbar">&nbsp;</li>
                <li class="menuItem"><a href=""><img src="Images/Spotlight/thumb_macbook.png" /></a></li>
                <li class="menuItem"><a href=""><img src="Images/Spotlight/thumb_iphone.png" /></a></li>
                <li class="menuItem"><a href=""><img src="Images/Spotlight/thumb_imac.png" /></a></li>
            </ul>
        </div>
    </div>
    <div id="content-left">
        <uc2:CategoryList ID="CategoryList1" runat="server" />
    </div>
    <div id="content-right">
        <uc1:ItemList ID="ItemList1" runat="server" />
    </div>
</asp:Content>
