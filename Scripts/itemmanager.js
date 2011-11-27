var addItem;
var fadeDiv;

function init() {
    addItem = document.getElementById('addItem');
    fadeDiv = document.getElementById('fade');
}

function showLightbox() {
    $(fadeDiv).fadeIn(300, function () {
        $(addItem).slideDown(350, 'easeOutBack', function () {
            $('#ContentPlaceHolder1_txtName').focus();
        });
    });
    //document.getElemenyById('ContentPlaceHolder1_txtName').focus; // FIX THIS LINE
}

function hideLightbox() {
    if (!isFormEmpty()) {
        if (confirm('Are you sure you wish to cancel adding this item?\nUnsaved changes will be lost! :c')) {
            hideDialog();
            addForm.reset();
        }
    } else {
        hideDialog();
        addForm.reset();
    }
}

function closeDialog() {
    $(addItem).slideUp(400, 'easeInOutExpo', function () {
        $(fadeDiv).fadeOut(500);
    });
    addForm.reset();
}

function isFormEmpty() {
    var fields = new Array();

    fields[0] = document.getElementById('ContentPlaceHolder1_txtName');
    fields[1] = document.getElementById('ContentPlaceHolder1_txtDescription');
    fields[2] = document.getElementById('ContentPlaceHolder1_txtPrice');
    fields[3] = document.getElementById('ContentPlaceHolder1_txtKeywords');
    fields[4] = document.getElementById('ContentPlaceHolder1_txtImage');
    fields[5] = document.getElementById('lstCategories');
    fields[6] = document.getElementById('ContentPlaceHolder1_chkOnFront');
    fields[7] = document.getElementById('ContentPlaceHolder1_chkOnSlides');

    for (var i = 0; i < 8; i++) {
        if (i >= 0 && i <= 4) { // check text boxes
            if (fields[i].value.length != 0) return false; // field is empty
        } else if (i == 5) { // check dropdown list
            if (fields[i].value != 0) return false;
        } else if (i > 5 && i <= 7) { // check checkboxes
            if (fields[i].checked == true) return false;
        }
    }
    return true;
}

function resetItemValues(id) {
    var divId = id - 1;
    var divName = 'ContentPlaceHolder1_lstItems_';

    document.getElementById(divName + 'txtName' + divId).value = document.getElementById(divName + 'hidName' + 0).value;

}