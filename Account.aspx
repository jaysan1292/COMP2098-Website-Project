<%@ Page Title="Your Account" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<%@ Register Src="UserControls/LoginDialog.ascx" TagName="LoginDialog" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h3>
            Your Account</h3>
        <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="~/Cart.aspx">Shopping Cart</asp:HyperLink>
        <hr width="50%" />
        <h3>
            Account Information</h3>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                You are not logged in. To view your information, please <a href="javascript:;" onclick="showDialog('#login-window')">log in</a>.
                <uc1:LoginDialog ID="LoginDialog1" runat="server" />
                &nbsp;
            </AnonymousTemplate>
            <LoggedInTemplate>
                Name: <asp:Label ID="lblName" runat="server"></asp:Label>
                
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <hr />
    <div>
        <h3>
            Admin stuff</h3>
        <a href="ItemManager.aspx">View and manage all items in database</a>
    </div>
</asp:Content>
