# == Schema Information
#
# Table name: answer_tags
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AnswerTag, type: :model do
  before(:each) do
    @room1 = Room.first

    @user = User.first

    @tag1 = Tag.create(name: "java")
    @tag2 = Tag.create(name: "ruby")

    @question1 = Question.create(title: "a"*10, user_id: @user.id, room_id: @room1.id)
    @answer1 = Answer.create(question_id: @question1.id, user_id: @user.id, content: "a"*20)
    @at1 = AnswerTag.create(answer_id: @answer1.id, tag_id: @tag1.id)
    @at2 = AnswerTag.create(answer_id: @answer1.id, tag_id: @tag1.id)
  end

  it "answer_id and tag_id should be unique together" do
    @at1.save
    expect(@at2.save).to be(false)
  end

  it "create answer_tag successfully" do
    @at1.save
    @at2.tag_id = @tag2.id
    expect(@at2.save).to be(true)
  end
end
