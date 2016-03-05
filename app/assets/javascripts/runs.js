$(document).ready(function() {
  jQuery.fn.reverse = Array.prototype.reverse;
  var shown = true;
  var speed = 50;
  var selector = '.run';

  $('.show-btn').click(function(e) {
    if (shown) {
      $(selector).reverse().each(function(i) {
        $(this).delay(i * speed).hide(0);
      });
    } else {
      $(selector).each(function(i) {
        $(this).delay(i * speed).show(0);
      });
    };

    shown = !shown;
  });
});


function showOrHide(selector, speed) {
  
}