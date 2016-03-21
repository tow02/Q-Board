# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Role, type: :model do
  before(:each) do
    @role = Role.create(name: "Member", description: "a"*50)
  end

  it "role should have name" do
    @role.name = ""
    expect(@role.save).to be(false)
  end

  it "role should have description" do
    @role.description = ""
    expect(@role.save).to be(false)
  end

  it "create role successfully" do
    expect(@role.save).to be(true)
  end

end
