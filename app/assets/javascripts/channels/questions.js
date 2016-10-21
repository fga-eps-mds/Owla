App.questionChannel = App.cable.subscriptions.create('QuestionsChannel', {
  received: function(data) {
    if (data.action === 'create'){
      return this.createQuestion(data);
    }
    else if (data.action === 'update'){
      return this.updateMessage(data);
    }
    else if (data.action === 'delete'){
      return this.deleteMessage(data);
    }
  },
  createMessage: function(data) {
   // $("#box-question-" + data.question_id).removeClass('hidden');
   // $('.content-text').val('');
   // this.updateQuestionCounter(data);
   // return $("#box-question-" + data.question_id).append(data.html);
  },
  updateMessage: function(data) {
   // return $("#answer-content-" + data.answer_id).html(data.content);
  },
  deleteMessage: function(data) {
   // this.updateQuestionCounter(data);
   // return $("#box-answer-" + data.answer_id).hide();
  },
  updateQuestionCounter: function(data) {
   // return $("#question-answers-counter-" + data.question_id).html(data.question_answers_counter);
  }
});
