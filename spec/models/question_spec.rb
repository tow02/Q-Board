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
    @q1 = Question.new(title: "a"*50)
    @q2 = Question.new(title: "a"*50)
  end

  it "A question must belongs to a room" do
    expect(@q1.save).to be(false)
  end

  it "A question must have the owner" do
    @q1.room_id = 1
    expect(@q1.save).to be(false)
  end

  # it "room_id and user_id must be unique together" do
  #   @q1.room_id = 1
  #   @q1.user_id = 1
  #   @q1.save
  #
  #   @q2.room_id = 1
  #   @q2.user_id = 1
  #
  #   expect(@q2.save).to be(false)
  # end

  it "A question must have title" do
    @q1.room_id = 1
    @q1.user_id = 1
    @q1.title = ""
    expect(@q1.save).to be(false)
  end

  it "A question must have maximum length of title" do
    @q1.title = "a"*151
    @q1.room_id = 1
    @q1.user_id = 1
    expect(@q1.save).to be(false)
  end

  it "create question successfully" do
    @q1.room_id = 1
    @q1.user_id = 1
    @q1.save

    @q2.room_id = 1
    @q2.user_id = 2

    expect(@q2.save).to be(true)
  end

end
