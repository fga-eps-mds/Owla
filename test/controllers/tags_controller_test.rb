require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")

    @room = Room.new(name: "calculo 1", description: "teste1")
    @room.owner = @member
    @room.save


    @topic = @room.topics.new(name: "limites", description: "description1")
    @topic.save

    @question = @topic.questions.new(content: "How did I get here?")
    @question.member = @member
    @question.save

    @tag = Tag.new(content: "CONTENT TEST", color: "#FF0000")
    @tag.member = @member
    @question.tags << @tag
    @tag.save

    sign_in_as @member
  end

   test "should create tag" do
     post question_tags_path(@question), params: {
       tag: {
         content: "Integration Test", color: "#FF0000"
       }
     }
     assert_redirected_to topic_path(@question.topic)
   end

   test "should edit tag" do
     tag_id = @tag.id
     tag_content = @tag.content
     tag_color = @tag.color
     patch "/tags/#{tag_id}", params: {
       tag: { content: "Bla bla bla", color: "#FFFFFF" }
     }

     @tag.reload

     assert_not_equal tag_content, @tag.content
     assert_not_equal tag_color, @tag.color
   end

   test "should not edit tag when member is not logged in" do
    sign_out_as @member
    tag_id = @tag.id
    tag_content = @tag.content
    tag_color = @tag.color
    patch "/tags/#{tag_id}", params: {
      tag: { content: "new content?", color: "#FFFFFF" }
    }

    @tag.reload

    assert_equal tag_content, @tag.content
    assert_equal tag_color, @tag.color
  end

  test "should delete tag" do
    assert_difference('Tag.count', -1) do
      delete "/tags/#{@tag.id}", params: {
        question_id: @question.id
      }

      assert_redirected_to question_tags_path(@question)
    end
  end

  test "should not delete the tag if user is not logged in" do
    sign_out_as @member
    delete "/tags/#{@tag.id}"
    assert_redirected_to root_path
  end

  test "should remove tag from a question" do
    post "/tags/#{@tag.id}/remove_tag_from_question", params: {
      question_id: @question.id
    }
    @question.reload
    assert_not @question.tags.include? @tag
    assert_redirected_to topic_path(@question.topic)
  end
end
