function showLightbox() {
    document.getElementById('addItem').style.display = 'block';
    document.getElementById('fade').style.display = 'block';

    //document.getElemenyById('ContentPlaceHolder1_txtName').focus; // FIX THIS LINE
}

function hideLightbox() {
    if (!isFormEmpty()) {
        if (confirm('Are you sure you wish to cancel adding this item?\nUnsaved changes will be lost! :c')) {
            closeDialog();
            return;
        }
    }
    closeDialog(); // TODO: after finishing ln36 TODO, make sure this works
}

function closeDialog() {
    document.getElementById('addItem').style.display = 'none';
    document.getElementById('fade').style.display = 'none';
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

    for (var i; i < 8; i++) { // TODO: figure out why this code doesn't execute
        if (i >= 0 && i <= 4) { // check text boxes
            if (fields[i].value.length == 0) return false; // field is empty
        }
        if (i >= 5 && i <= 7) {
            if (fields[i].value == 0 || fields[i].checked == false) return false;
        }
    }
    return true;
}

function resetItemValues(id) {
    var divId = id - 1;
    var divName = 'ContentPlaceHolder1_lstItems_';

    document.getElementById(divName + 'txtName' + divId).value = document.getElementById(divName + 'hidName' + 0).value;

}