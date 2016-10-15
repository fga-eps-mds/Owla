App.messages = App.cable.subscriptions.create('AnswersChannel', {  
  received: function(data) {
    $(".box-comments").removeClass('hidden')
    return $('.box-comments').append(this.renderMessage(data));
  }, 
  renderMessage: function(data) {
    return "<div class=\"box-comment\">\
              <img src=\"" + data.member_avatar_url + "\" class=\"img-circle img-sm\" alt=\"User Image\">\
              <div class=\"comment-text\">\
                <span class=\"username\">" + data.member + "<span class=\"text-muted pull-right\">" + data.date + "</span>\
                </span>" + data.content + "</div></div>"
  }
});
