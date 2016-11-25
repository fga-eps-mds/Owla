$(document).ready(function(){
  if($('#notification-counter').html() == 0){
    $('#notification-counter').hide();
  }

  $('#notification-dropdown').click(function(){
    $('#notification-counter').hide();
  });

  $('#edit-attachment-button').click(function(){
    $('#question-attachment-link').toggleClass('hidden');
    $('#answer-attachment-link').toggleClass('hidden');
    $('#delete-attachment-label').toggleClass('hidden');
  });
});
