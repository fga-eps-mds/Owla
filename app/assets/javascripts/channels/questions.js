App.questionChannel = App.cable.subscriptions.create('QuestionsChannel', {
  received: function(data) {
    if (data.action === 'create'){
      return this.createQuestion(data);
    }
    else if (data.action === 'update'){
      return this.updateQuestion(data);
    }
    else if (data.action === 'delete'){
      return this.deleteQuestion(data);
    }
  },
  createQuestion: function(data) {
   return $("#topic-question-box-" + data.topic_id).append(data.html);
  },
  updateQuestion: function(data) {
   // return $("#answer-content-" + data.answer_id).html(data.content);
  },
  deleteQuestion: function(data) {
   // this.updateQuestionCounter(data);
   // return $("#box-answer-" + data.answer_id).hide();
  },
});
