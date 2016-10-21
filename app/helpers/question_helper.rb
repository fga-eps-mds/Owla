module QuestionHelper
  def send_question question, action
    html =  render_question(question)

    ActionCable.server.broadcast 'questions',
      action: action,
      html: html,
      question_id: question.id,
      topic_id: question.topic.id,
      content: question.content
    head :ok
  end

  def render_question question
    ApplicationController.render({
      partial: 'questions/question',
      locals: { question: question, room: question.topic.room, new_answer: Answer.new, current_member: question.member}
    })
  end
end
