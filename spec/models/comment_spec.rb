# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @comment1 = Comment.new(content: "a"*50)
    @comment2 = Comment.new(content: "a"*50)
  end

  it "A comment must belongs to an answer" do
    @comment1.user_id = 1
    expect(@comment1.save).to be(false)
  end

  it "A comment must have the owner" do
    @comment1.answer_id = 1
    expect(@comment1.save).to be(false)
  end

  it "content should be present" do
    @comment1.answer_id = 1
    @comment1.user_id = 1
    @comment1.content = ""
    expect(@comment1.save).to be(false)
  end

  it "comment should have maximum length" do
    @comment1.answer_id = 1
    @comment1.user_id = 1
    @comment1.content = "a"*601
    expect(@comment1.save).to be(false)
  end

  it "successfully create a comment" do
    @comment1.answer_id = 1
    @comment1.user_id = 1
    expect(@comment1.save).to be(true)
  end

  it "A user can have many comments and answer can have many comments" do
    @comment1.answer_id = 1
    @comment1.user_id = 1
    @comment1.save

    @comment2.answer_id = 1
    @comment2.user_id = 1
    expect(@comment2.save).to be(true)
  end
end
