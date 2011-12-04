// Dialog box functions (these require a div with id="fade" and a div with class="dialog"
function showDialog(dialog) {
    $('#fade').fadeIn(300, function () {
        $(dialog).slideDown(350, 'easeOutBack')
    });
}

function hideDialog() {
    $('.dialog').slideUp(400, 'easeInOutExpo', function () { $('#fade').fadeOut(500) });
}
// End dialog box functions

// Category dropdown menu handler
$(document).ready(function () {
    $("#nav-category").hover(
            function () {
                $('#submenu-category', this).slideDown(250, 'easeInOutCubic');
                $('a', this).addClass('active');
            },
            function () {
                $('#submenu-category', this).slideUp(150, 'easeInOutCubic');
                $('a', this).removeClass('active');
            }
        );
});
// End category dropdown menu handler

// Account dropdown menu handler
$(document).ready(function () {
    $("#nav-account").hover(
            function () {
                $('#submenu-account', this).slideDown(250, 'easeInOutCubic');
                $('a', this).addClass('active');
            },
            function () {
                $('#submenu-account', this).slideUp(150, 'easeInOutCubic');
                $('a', this).removeClass('active');
            }
        );
});
// End account dropdown menu handler

// Account Sidebar floating div
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
// End account sidebar floating div