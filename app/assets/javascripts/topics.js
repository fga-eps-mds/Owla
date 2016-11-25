//= require questions
//= require slides

$(document).ready(function(){
  // putting arrows on top of slide (not responsive)
  var offset = ($(".item.active").width() - $(".slide-slice").width()) / 2;
  $('#slide-left-arrow').css('margin-left', offset + 'px');
  $('#slide-right-arrow').css('margin-right', offset + 'px');

  // setting left and right arrows to move the first and the rest of slide pages
  $('body').keydown(function(e) {
    if(e.keyCode == 37) { // left
      $('#slide-left-arrow').click();
    }
    else if(e.keyCode == 39) { // right
      $('#slide-right-arrow').click();
    }
  });

});
