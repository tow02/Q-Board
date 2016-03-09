# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserRole, type: :model do

  before(:each) do
    @user1_role1 = UserRole.new(user_id: 1, role_id: 1)
    @user1_role_2 = UserRole.new(user_id: 1, role_id: 1)
  end

  it "user_id and role_id should be unique together" do
    @user1_role1.save
    expect(@user1_role_2.save).to be(false)
  end

  it "create user's role successfully" do
    @user1_role1.save
    @user1_role_2.role_id = 2
    expect(@user1_role_2.save).to be(true)
  end
end
