# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Room, type: :model do
  before(:each) do
    @room1 = Room.new(name: "Art")
    @room2 = Room.new(name: "art")
  end

  it "Room name should be unique" do
    @room1.save
    expect(@room2.save).to be(false)
  end

  it "successfully create room" do
    @room1.save
    @room2.name = "Music"
    expect(@room2.save).to be(true)
  end
end
