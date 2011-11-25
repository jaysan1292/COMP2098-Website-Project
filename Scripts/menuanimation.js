var timerLen = 5;
var slideAniLen = 250;

var timerID = new Array();
var startTime = new Array();
var obj = new Array();
var endHeight = new Array();
var moving = new Array();
var dir = new Array();

var totalDivs = new Array();

function slideDown(objname) {
    if (moving[objname])
        return;

    if (document.getElementById(objname).style.display != "none")
        return; // cannot slide down something that is already visible

    moving[objname] = true;
    dir[objname] = "down";
    startSlide(objname);
    
}

function slideUp(objname) {
    if (moving[objname])
        return;

    if (document.getElementById(objname).style.display == "none")
        return; // cannot slide up something that is already hidden

    moving[objname] = true;
    dir[objname] = "up";
    startSlide(objname);
}

function startSlide(objname) {
    obj[objname] = document.getElementById(objname);

    endHeight[objname] = parseInt(obj[objname].style.height);
    startTime[objname] = (new Date()).getTime();

    if (dir[objname] == "down") {
        obj[objname].style.height = "1px";
    }

    obj[objname].style.display = "block";

    timerID[objname] = setInterval('slideTick(\'' + objname + '\');', timerLen);
}

function slideTick(objname) {
    var elapsed = (new Date()).getTime() - startTime[objname];

    if (elapsed > slideAniLen)
        endSlide(objname)
    else {
        //var d = Math.round((elapsed / slideAniLen) * endHeight[objname]);
        var d = 0;
        if(Math.round(Math.pow(elapsed / slideAniLen,2) * endHeight[objname]) >= endHeight[objname] / 2)
            d = Math.round(Math.pow(elapsed / slideAniLen, 0.5) * endHeight[objname]);
        else
            d = Math.round(Math.pow(elapsed / slideAniLen, 2) * endHeight[objname]);
        if (dir[objname] == "up")
            d = endHeight[objname] - d;

        obj[objname].style.height = d + "px";
    }

    return;
}

function endSlide(objname) {
    clearInterval(timerID[objname]);

    if (dir[objname] == "up")
        obj[objname].style.display = "none";

    obj[objname].style.height = endHeight[objname] + "px";

    delete (moving[objname]);
    delete (timerID[objname]);
    delete (startTime[objname]);
    delete (endHeight[objname]);
    delete (obj[objname]);
    delete (dir[objname]);

    return;
}

function toggleSlide(objname) {
    // hide all open divs
    hideAll();

    // show clicked div
    slideDown(objname);
}

function hideAll() {
    // specific for item management section only
    for (i = 1; document.getElementById(i) != null; i++) {
        slideUp(String(i));
    }
}