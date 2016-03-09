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
    @answer1 = Answer.new
    @answer1.content = "a"*50
  end

  it "answer should belong to a question" do
    @answer1.user_id = 1
    expect(@answer1.save).to be(false)
  end

  it "answer should have its owner" do
    @answer1.question_id = 1
    expect(@answer1.save).to be(false)
  end

  it "answer should have content" do
    @answer1.question_id = 1
    @answer1.user_id = 1
    @answer1.content = ""
    expect(@answer1.save).to be(false)
  end

  it "create answer successfully" do
    @answer1.question_id = 1
    @answer1.user_id = 1
    expect(@answer1.save).to be(true)
  end

end
