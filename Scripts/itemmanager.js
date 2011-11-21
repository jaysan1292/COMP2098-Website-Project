function showLightbox() {
    document.getElementById('addItem').style.display = 'block';
    document.getElementById('fade').style.display = 'block';

    document.getElemenyById('ContentPlaceHolder1_txtName').focus; // FIX THIS LINE
}

function hideLightbox() {
    if (confirm('Are you sure you wish to cancel adding this item?\nUnsaved changes will be lost! :c')) {
        document.getElementById('addItem').style.display = 'none';
        document.getElementById('fade').style.display = 'none';
        addForm.reset();
    }
}

function resetItemValues(id) {
    var divId = id - 1;
    var divName = 'ContentPlaceHolder1_lstItems_';

    document.getElementById(divName + 'txtName' + divId).value = document.getElementById(divName + 'hidName' + 0).value;

}