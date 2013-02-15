$(window).load(function() {
    $('#slider').nivoSlider({
      effect: 'fold',
      controlNav: false,
      prevText: '',
      nextText: '',
    });
});

$(document).ready(function(){

  // set the first field to have focus

  $("input:first").focus();

  EMSON.validate_form();

  if($("#myController").length > 0) {
    $("#myController").jFlow({
      slides: "#mySlides",
      width: "100%",
      height: "250px",
      duration: 400
    });
  }


  if($(".lightbox").length > 0) {
    $(".lightbox").lightbox({
      fitToScreen: true,
      imageClickClose: false
    });
  }


  if($(".jqzoom").length > 0) {
    $(function() {
      var options = {
        zoomWidth: 380,
        zoomHeight: 500,
      };
      $(".jqzoom").jqzoom(options);
    });
  }


});




// Created by B. F. B. Emson Esq.
// http://www.emson.co.uk
//
// Create a single global variable to act as a new namespace
// This will avoid collisions and interference with other applications
var EMSON = {}


EMSON.validate_form = function validateForm() {
  // reset the form
  $("form").submit(function() {
    $("input#interest_name").css({'background-color':"white", 'border':'1px solid white' });
    $("input#interest_email").css({'background-color':"white", 'border':'1px solid white' });
    var is_valid = true;
    is_valid = EMSON.validate_text($("input#interest_name"), "please enter your name");
    if(is_valid) { is_valid = EMSON.validate_text($("input#interest_email"), "please enter your email address"); }

    return is_valid;
  });
}



EMSON.validate_text = function validateText(node, message) {
  var is_valid = true;
  var reason = "";
  var text = node.val();
  if (text === "") {
    is_valid = false;
  }
  if(!is_valid) {
    node.css({'background-color':"pink", 'border':'1px solid red' });
    $("span.validate").text(message).show();
  }
  return is_valid;
}


EMSON.validate_phone = function validatePhone(node) {
  var num = node.val();
  var is_valid = true;
  var reason = "";
  if (num === "") {
    reason = "your phone number is missing";
    is_valid = false;

  } else {
    var num_stripped = num.replace(/[\(\)\.\-\ ]/g, ''); //strip out acceptable non-numeric characters
    if (isNaN(parseInt(num_stripped))) {
      reason = "phone number has invalid characters";
      is_valid = false;
    } else if (!(num_stripped.length >= 8 && stripped.length <= 14)) {
      reason = "phone number is the wrong length";
      is_valid = false;
    }
  }

  if(!is_valid) {
    node.css({'background-color':"pink", 'border':'1px solid red' });
    $("span.validate").text(reason).show();
  }
  return is_valid;
}
