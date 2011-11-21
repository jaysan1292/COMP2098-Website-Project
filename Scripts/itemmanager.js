function showLightbox() {
    document.getElementById('addItem').style.display = 'block';
    document.getElementById('fade').style.display = 'block';
}

function hideLightbox() {
    if (confirm('Are you sure you wish to cancel adding this item?\nUnsaved changes will be lost! :c')) {
        document.getElementById('addItem').style.display = 'none';
        document.getElementById('fade').style.display = 'none';
        addForm.reset();
    }
}