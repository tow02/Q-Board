# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  before(:each) do
    @tag1 = Tag.new(name: "a")
    @tag2 = Tag.new(name: "a")
  end

  it "tag's name should be unique" do
    @tag1.save
    expect(@tag2.save).to be(false)
  end

  it "create tag successfully" do
    @tag1.save
    @tag2.name = "b"
    expect(@tag2.save).to be(true)
  end
end
