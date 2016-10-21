module AnswerHelper
  def send_cable answer, action
    html =  render_answer(answer)

    ActionCable.server.broadcast 'answers',
      action: action,
      html: html,
      question_id: answer.question.id,
      answer_id: answer.id,
      content: answer.content,
      question_answers_counter: answer.question.answers.count,
      answer_created_at: answer.created_at,
      answer_updated_at: answer.updated_at
    head :ok
  end

  def render_answer answer
    ApplicationController.render({
      partial: 'answers/answer',
      locals: { answer: answer, room: answer.question.topic.room }
    })
  end
end
