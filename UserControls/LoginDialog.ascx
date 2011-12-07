<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginDialog.ascx.cs" Inherits="UserControls_LoginDialog" %>

<div id="login-window" class="dialog">
    Log in to your account:
    <div class="dialog-inner-panel">
        <asp:Login ID="Login1" runat="server" TitleText="" UserNameLabelText="Username:" CssClass="login" LoginButtonType="Link" onauthenticate="Login1_Authenticate" onloggedin="Login1_LoggedIn" onloggingin="Login1_LoggingIn" onloginerror="Login1_LoginError">
            <LoginButtonStyle CssClass="button" />
        </asp:Login>
    </div>
</div>
