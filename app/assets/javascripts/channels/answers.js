App.messages = App.cable.subscriptions.create('AnswersChannel', {
  received: function(data) {
    $("#box-question-" + data.question_id).removeClass('hidden');
    $('.content-text').val('');
    return $("#box-question-" + data.question_id).append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    return data.html;
  }
});
