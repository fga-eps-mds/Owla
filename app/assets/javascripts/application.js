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
//= require notifications
//= require admin_lte/admin_lte
//= require bootstrap-switch
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require turbolinks
//= require jquery.minicolors

$(document).ready(function(){
  $(".main-sidebar").height($(".content-wrapper").height());

  $(".content-wrapper").sizeChanged(function(){
    $(".main-sidebar").height($(".content-wrapper").height());
  });

  $('#tag-colorpicker').minicolors();
});

// this is a Jquery plugin function that fires an event when the size of an element is changed
// usage: $().sizeChanged(function(){})
(function ($) {
  $.fn.sizeChanged = function (handleFunction) {
      var element = this;
      var lastWidth = element.width();
      var lastHeight = element.height();

      setInterval(function () {
          if (lastWidth === element.width() && lastHeight === element.height())
              return;
          if (typeof (handleFunction) == 'function') {
              handleFunction({ width: lastWidth, height: lastHeight },
                             { width: element.width(), height: element.height() });
              lastWidth = element.width();
              lastHeight = element.height();
          }
      }, 200);

      return element;
  };
}(jQuery));
