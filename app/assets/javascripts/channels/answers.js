App.messages = App.cable.subscriptions.create('AnswersChannel', {
  received: function(data) {
    if (data.action === 'create'){
      return this.createMessage(data);
    }
    else if (data.action === 'update'){
      return this.updateMessage(data);
    }
    else if (data.action === 'delete'){
      return this.deleteMessage(data);
    }
  },
  createMessage: function(data) {
    $("#box-question-" + data.question_id).removeClass('hidden');
    $('.content-text').val('');
    return $("#box-question-" + data.question_id).append(data.html);
  },
  updateMessage: function(data) {
    return $("#answer-content-" + data.answer_id).html(data.content);
  },
  deleteMessage: function(data) {
    return $("#box-answer-" + data.answer_id).hide();
  },
  incrementQuestionCounter(data) {
    
  },
  decrementQuestionCounter(data) {
    
  },
});
