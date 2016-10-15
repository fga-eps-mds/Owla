module AnswerHelper
  def send_cable answer
    html =  render_answer(answer)

    ActionCable.server.broadcast 'answers',
      html: html,
      question_id: answer.question.id
    head :ok
  end

  def render_answer answer
    ApplicationController.render({
      partial: 'answers/answer',
      locals: { answer: answer }
    })
  end
end
