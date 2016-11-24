// Customize text editor
$(function () {
  $(".textarea").wysihtml5();
});

// Close modal on submit
$('.modal-form').on('submit', function() {
  $('.modal').modal('hide');
});
