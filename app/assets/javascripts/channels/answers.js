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
    this.updateQuestionCounter(data);
    $("#box-question-" + data.question_id).append(data.html);
    console.log(data.is_anonymous);
    console.log("member_id: " + getCookie("member_id"));
    console.log("answer_member_id: " + data.answer_member);
    if (getCookie("member_id") != data.answer_member && data.is_anonymous){
      console.log("entrou");
      return $("box-answer-" + data.answer_id + " #username").html('Anonymous');
    }
  },
  updateMessage: function(data) {
    if(data.answer_created_at !== data.answer_updated_at){
      $('#answer-' + data.answer_id + '-datetime .edited').removeClass('hidden');
    }
    return $("#answer-content-" + data.answer_id).html(data.content);
  },
  deleteMessage: function(data) {
    this.updateQuestionCounter(data);
    return $("#box-answer-" + data.answer_id).hide();
  },
  updateQuestionCounter: function(data) {
    return $("#question-answers-counter-" + data.question_id).html(data.question_answers_counter);
  }
});
