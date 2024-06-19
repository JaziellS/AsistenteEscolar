function DisableBackButton() {
    window.history.forward()
}
DisableBackButton();
window.onload = DisableBackButton;
window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
window.onunload = function () { void (0) }

        
    
//function KeyPress(event, sControl) {
//    if (event.keyCode == 13) {
//        //event.returnValue = false;
//        //event.cancel = true;
//        //event.
//        //$get(event).click();
//        alert(sControl);
//    }
//}

//function iskeyPress(keyCode) {

//    //if (keyCode == 13) {

//    alert("Enter key pressed");
//    PageMethods.
//    //}

//}

