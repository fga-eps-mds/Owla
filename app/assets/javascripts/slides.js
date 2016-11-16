$(document).ready(function(){

  // Avoid the automatic slide mode
  $("#carousel-slide").carousel({interval: false});

  // Prev slide button must change the current topic ID in the send question
  // request
  $('a[data-slide="prev"]').click(function() {
    var slideSize = getSlideSize(); 
    var previousSlideId = getCurrentSlide();
    var currentSlideId = normalizeSlideId(decrement, previousSlideId, slideSize);
    $("#father-topic-" + getTopicId()).find("#hidden-slide-id").attr('value', currentSlideId);
    sendSlide(currentSlideId);
  });

  // Next slide button must change the current topic ID in the send question
  // request
  $('a[data-slide="next"]').click(function() {
    var slideSize = getSlideSize(); 
    var previousSlideId = getCurrentSlide();
    var currentSlideId = normalizeSlideId(increment, previousSlideId, slideSize);
    $("#father-topic-" + getTopicId()).find("#hidden-slide-id").attr('value', currentSlideId);
    sendSlide(currentSlideId);
  });

  // Get how many pages has the slide
  function getSlideSize(){
    return $('#carousel-slide').attr('size');
  }

  // Get the current slide ID
  function getCurrentSlide(){
    var re = /slide-(\d+)/;
    return $('.item.active').attr('id').match(re)[1];
  }

  // When the increment function overflows the maximum slide size
  // reset to the first page. When the decrement function underflows
  // the minimum slide ID, 0 by default, reset it to the last slide.
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

  // Increment ID by 1
  function increment(id){
    return parseInt(id) + 1;
  }

  // Decrement ID by 1
  function decrement(id){
    return parseInt(id) - 1;
  }

  // Get the current topic ID
  function getTopicId(){
    var re = /father-topic-(\d+)/;
    var id = $("[name='father']").attr('id').match(re)[1];
    return id;
  }

  // When the user is the topic's owner, the must send his current
  // topic ID to the topic's members who enabled the slide following
  // option
  function sendSlide(slideId){
    var currentMemberId = getCookie("member_id");
    var roomOwnerId     = getCookie("room_owner_id");

    if(currentMemberId === roomOwnerId){
      var currentTopicId = getTopicId();
      var url = "/topics/" +  currentTopicId + "/slide/" + slideId;
      $.ajax({
        type: "POST",
        url: url,
      });
    }
  }

  // Initialize bootstrap switch
  $("[name='follow-slide']").bootstrapSwitch();

  // Enable and Disable following slide mode on click
  $('input[name="follow-slide"]').on('switchChange.bootstrapSwitch', function(event, state) {
    if(state){
      $("#carousel-slide[topic='" + getTopicId() + "']").addClass("following");
    } else {
      $("#carousel-slide[topic='" + getTopicId() + "']").removeClass("following");
    }
  });
});
