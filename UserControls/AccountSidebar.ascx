<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountSidebar.ascx.cs" Inherits="UserControls_AccountSidebar" %>
<%@ Register Src="LoginDialog.ascx" TagName="LoginDialog" TagPrefix="uc1" %>

<div id="account-sidebar-wrapper">
    <div id="account-sidebar">
        <div id="account-header">
            <asp:Label ID="lblUsername" runat="server"></asp:Label>
        </div>
        <asp:Label ID="lblCartTotal" runat="server" Text="Label"></asp:Label></span><br />
        <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="~/Cart.aspx" CssClass="lnkCart button">View Cart</asp:HyperLink>
        <hr />
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                You are not logged in.<br />
                <a href="javascript:;" onclick="showDialog('#login-window')">Log in</a> or <a href="<%=Request.ApplicationPath%>/Register.aspx">Sign up</a>.</div>
                <div id="signup-window" class="dialog">
                    Sign up for a new account:
                    <div class="dialog-inner-panel">
                        <%--This is an inner panel. (The form would go here.)--%>
                    </div>
                </div>
                <uc1:LoginDialog ID="LoginDialog1" runat="server" />
            </AnonymousTemplate>
            <LoggedInTemplate>
                <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">Logout</asp:LinkButton>
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
