class AnswersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'answers'
  end
end
