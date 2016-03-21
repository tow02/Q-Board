# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  before(:each) do
    @user1 = User.first
    @user2 = User.second
    @user3 = User.third

    @room1 = Room.first

    @q1 = Question.new(title: "a"*50)
  end

  it "A question must belongs to a room" do
    expect(@q1.save).to be(false)
  end

  it "A question must have the owner" do
    @q1.room_id = @room1
    expect(@q1.save).to be(false)
  end

  it "A question must have title" do
    @question = Question.create(user_id: @user1.id, room_id: @room1.id)
    expect(@question.save).to be(false)
  end

  it "A question must have maximum length of title" do
    @question = Question.create(user_id: @user3.id, room_id: @room1.id, title: "a"*201)
    expect(@question.save).to be(false)
  end

  it "create question successfully" do
    @question = Question.create(user_id: @user2.id, room_id: @room1.id, title: "b"*150)
    expect(@question.save).to be(true)
  end

end
