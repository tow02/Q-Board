# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :text
#  reputation             :integer          default("0")
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(username: "tow02",
                      email: "user1@gmail.com",
                      password: "12345678",
                      password_confirmation: "12345678")
    @user2 = User.new(username: "TOw02",
                      email: "user2@gmail.com",
                      password: "12345678",
                      password_confirmation: "12345678")
  end

  it "user1 should be able to sign up" do
    expect(@user1.save).to be(true)
  end

  it "username should be presence" do
    @user2.username = ""
    expect(@user2.save).to be(false)
  end

  it "username should be unique and incase-sensitive" do
    @user1.username = "tow02"
    @user1.save
    @user2.username = "TOw02"
    expect(@user2.save).to be(false)
  end

  it "password should have minimum length" do
    @user1.password = "a"*5
    @user1.password_confirmation = "a"*5
    expect(@user1.save).to be(false)
  end

  it "password and password_confirmation should match when sign up" do
    @user1.password = "a"*8
    @user1.password_confirmation = "b"*8
    expect(@user1.save).to be(false)
  end

  it "sign up should be valid" do
    @user1.username = "user1"
    expect(@user1.save).to be(true)
    @user2.username = "user2"
    expect(@user2.save).to be(true)
  end

end
