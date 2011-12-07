<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>

<%@ Register Src="UserControls/AccountSidebar.ascx" TagName="AccountSidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #iteminfo-left {
        }
        #iteminfo-right {
            width: 150px;
            float: right;
            border: 1px solid #CDCDCD;
            background-color: #EFEFEF;
            height: 69px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            box-shadow: 0px 0px 10px #AAA;
            position: absolute;
            right: 10px;
            top: 10px;
        }
        #itemName {
            font-size: 14pt;
            font-weight: bold;
            display: block;
            width: 384px;
        }
        .imgItem {
            width: 200px;
            height: 200px;
            float: right;
            margin-top:20px;
        }
        #itemDescription {
            width: 330px;
            font-size: 0.8em;
            position: relative;
            top: 32px;
            color: #444;
        }
        #itemPrice {
            font-weight: bold;
            text-align: center;
            padding-right: 10px;
            display: block;
            width: 80px;
            position: relative;
            left: 50%;
            margin-left: -40px;
            margin-bottom: 10px;
            margin-top: 10px;
        }
        .btnAddToCart {
            background-color: #039909;
            border: 1px solid #039909;
            position: relative;
            left: 50%;
            margin-left: -53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-left">
        <uc1:AccountSidebar ID="AccountSidebar1" runat="server" />
    </div>
    <div id="content-right">
        <div id="iteminfo-left">
            <p id="itemName">
                <asp:Label CssClass="CatalogTitle" ID="lblTitle" runat="server" Text="Title"></asp:Label>
            </p>
            <asp:Image ID="imgItem" runat="server" CssClass="imgItem" />
            <p id="itemDescription">
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div id="iteminfo-right">
            <p id="itemPrice">
                <asp:Label ID="lblPrice" runat="server" Text="$0.00"></asp:Label>
            </p>
            <asp:LinkButton ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" CssClass="btnAddToCart button">Add to Cart</asp:LinkButton>
        </div>
    </div>
</asp:Content>
