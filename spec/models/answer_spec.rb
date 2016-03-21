# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  content     :text
#  is_question :boolean
#  is_accepted :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  before(:each) do
    @user = User.first
    @room = Room.first
    @question = Question.create(title: "a"*50, user_id: @user.id, room_id: @room.id)
    @answer = Answer.new(content: "a"*50)
  end

  it "answer should belong to a question" do
    @question.user_id = @question.user_id
    expect(@answer.save).to be(false)
  end

  it "answer should have its owner" do
    @answer.question_id = @question.id
    expect(@answer.save).to be(false)
  end

  it "answer should have content" do
    @answer.question_id = @question.id
    @answer.user_id = @user.id
    @answer.content = ""
    expect(@answer.save).to be(false)
  end

  it "create answer successfully" do
    @answer.question_id = @question.id
    @answer.user_id = @user.id
    expect(@answer.save).to be(true)
  end

end
