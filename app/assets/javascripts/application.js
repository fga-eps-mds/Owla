// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= stub cable
//= require admin_lte/admin_lte
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require turbolinks


// Customize text editor
$(function () {
  $(".textarea").wysihtml5();
});

// Close modal on submit
$('.modal-form').on('submit', function() {
  $('.modal').modal('hide');
});

//Static slide
$("#carousel-slide").carousel({interval: false});

//Slide id

$('a[data-slide="prev"]').click(function() {
  slideSize = $('#carousel-slide').attr('size');
  re = /slide-(\d+)/;
  previousSlideId = $('.item.active').attr('id').match(re)[1];
  $('#hidden-slide-id').attr('value', normalizeSlideId(decrement, previousSlideId, slideSize));
  console.log($('#hidden-slide-id').attr('value'));
});

$('a[data-slide="next"]').click(function() {
  slideSize = $('#carousel-slide').attr('size');
  re = /slide-(\d+)/;
  previousSlideId = $('.item.active').attr('id').match(re)[1];
  $('#hidden-slide-id').attr('value', normalizeSlideId(increment, previousSlideId, slideSize));
  console.log($('#hidden-slide-id').attr('value'));
});

function normalizeSlideId(func, previous, limit){
  limit = parseInt(limit);
  previous = parseInt(previous);

  var normalizedId = func(previous);
  if(normalizedId < 0)
    normalizedId = limit - 1;
  else if(normalizedId >= limit)
    normalizedId = 0;

  return normalizedId;
}

function increment(id){
  return parseInt(id) + 1;
}

function decrement(id){
  return parseInt(id) - 1;
}
