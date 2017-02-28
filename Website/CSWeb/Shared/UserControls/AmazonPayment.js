$(document).ready(function () {
    showHideForms();
});

function showHideForms() {
    var $cartForms = $("#cartForms");
    var $amazonPayButton = $("#amazonPayButton");
    if ($("#hOrderRefId").val() != "") {
        $cartForms.show();
        $amazonPayButton.hide();
    }
    else {
        $cartForms.hide();
        $amazonPayButton.show();
    }
}