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
    @user1 = User.first
    @user2 = User.second
    @user3 = User.third
    @admin_role = Role.first
    @moderator_role = Role.second
    @member_role = Role.third
    @user1_role_1 = UserRole.where(user_id: @user1.id, role_id: @admin_role.id).first
    @user2_role_2 = UserRole.where(user_id: @user2.id, role_id: @moderator_role.id).first
    @user3_role_3 = UserRole.where(user_id: @user3.id, role_id: @member_role.id).first
  end

  it "Retrieved user should be admin" do
    expect(@user1_role_1.admin?).to be(true)
  end

  it "Retrieved user should be moderator" do
    expect(@user2_role_2.moderator?).to be(true)
  end

  it "Retrieved user should be moderator" do
    expect(@user3_role_3.member?).to be(true)
  end

end
