<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountSidebar.ascx.cs" Inherits="UserControls_AccountSidebar" %>
<script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var top = $('#account-sidebar').offset().top - parseFloat($('#account-sidebar').css('margin-top').replace(/auto/, 0));

        $(window).scroll(function () {
            var y = $(this).scrollTop();

            if (y >= top) {
                $('#account-sidebar').addClass('fixed');
            } else {
                $('#account-sidebar').removeClass('fixed');
            }
        });
    });

    function showDialog(dialog) {
        $('#fade').fadeIn(300, function () {
            $(dialog).slideDown(350, 'easeOutBack')
        });
    }

    function hideDialog() {
        $('.dialog').slideUp(400, 'easeInOutExpo', function () { $('#fade').fadeOut(500) });
    }
</script>
<div id="account-sidebar-wrapper">
    <div id="account-sidebar">
        <div id="account-header">
            Welcome, [name]!
        </div>
        <span style="color: #CFCFCF; font-style: italic;">TODO: Pull customer's shopping cart information from database and put it here.
        i.e, show running total, number of items in cart, link to shopping cart</span>
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
<div class="dialog-inner-panel">This is an inner panel. (The form would go here.)</div>
</div>
<div id="login-window" class="dialog">
This is the login window.
<div class="dialog-inner-panel">This is an inner panel. (The form would go here.)</div>
</div>
<div id="fade" onclick="hideDialog()">
</div>
