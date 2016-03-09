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
    @at1 = AnswerTag.new(answer_id: 1, tag_id: 1)
    @at2 = AnswerTag.new(answer_id: 1, tag_id: 1)
  end

  it "answer_id and tag_id should be unique together" do
    @at1.save
    expect(@at2.save).to be(false)
  end

  it "create answer_tag successfully" do
    @at1.save
    @at2.tag_id = 2
    expect(@at2.save).to be(true)
  end
end
