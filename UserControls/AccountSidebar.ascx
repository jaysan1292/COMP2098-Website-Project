<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountSidebar.ascx.cs" Inherits="UserControls_AccountSidebar" %>
<div id="account-sidebar-wrapper">
    <div id="account-sidebar">
        <div id="account-header">
            Welcome, [name]!
        </div>
        <span style="color: #CFCFCF; font-style: italic;">TODO: Pull customer's shopping cart information from database and put it here. i.e, show running total, number of items in cart, link to shopping cart</span>
        <hr />
        <span style="color: #CFCFCF; font-style: italic;">If user is not logged in, display this:<br />
        </span>You are not logged in.<br />
        <a href="javascript:;" onclick="showDialog('#login-window')">Log in</a>
        <br />
        or<br />
        <a href="javascript:;" onclick="showDialog('#signup-window')">Sign up</a>
    </div>
</div>
<div id="signup-window" class="dialog">
    This is the signup window.
    <div class="dialog-inner-panel">
        This is an inner panel. (The form would go here.)</div>
</div>
<div id="login-window" class="dialog">
    This is the login window.
    <div class="dialog-inner-panel">
        This is an inner panel. (The form would go here.)</div>
</div>
<div id="fade" onclick="hideDialog()">
</div>
