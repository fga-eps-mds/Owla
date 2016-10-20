App.messages = App.cable.subscriptions.create('AnswersChannel', {
  received: function(data) {
    if (data.action === 'create'){
      $("#box-question-" + data.question_id).removeClass('hidden');
      $('.content-text').val('');
      return $("#box-question-" + data.question_id).append(this.renderMessage(data));
    }
    else if (data.action === 'update'){
      return $("#answer-content-" + data.answer_id).html(data.content);
    }
  },
  renderMessage: function(data) {
    return data.html;
  }
});
