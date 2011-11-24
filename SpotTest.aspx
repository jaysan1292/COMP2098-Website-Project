<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SpotTest.aspx.cs" Inherits="SpotTest" %>

<%@ Register Src="UserControls/Spotlight.ascx" TagName="Spotlight" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="Scripts/slides.jquery.js" type="text/javascript"></script>
    <link href="Styles/Spotlight.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:Spotlight ID="Spotlight1" runat="server" />
</asp:Content>
