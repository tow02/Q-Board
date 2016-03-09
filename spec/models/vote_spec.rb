# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  vote_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @vote1 = Vote.new(answer_id: 1, user_id: 1)
    @vote2 = Vote.new(answer_id: 1, user_id: 1)
    @vote3 = Vote.new(answer_id: 1, user_id: 1)
  end

  it "same user can't vote down more than once" do
    @vote1.vote_type = -1
    @vote2.vote_type = -1
    @vote1.save
    expect(@vote2.save).to be(false)
  end

  it "same user can't vote up more than once" do
    @vote1.vote_type = 1
    @vote2.vote_type = 1
    @vote1.save
    expect(@vote2.save).to be(false)
  end

  it "vote up then vote down" do
    @vote1.vote_type = 1
    @vote2.vote_type = -1
    @vote1.save
    expect(@vote2.save).to be(true)
  end

  it "vote down then vote up" do
    @vote1.vote_type = -1
    @vote2.vote_type = 1
    @vote1.save
    expect(@vote2.save).to be(true)
  end

  it "vote up, vote down, then vote up again" do
    @vote1.vote_type = 1
    @vote2.vote_type = -1
    @vote3.vote_type = 1
    @vote1.save
    @vote2.save
    @vote1.destroy
    expect(@vote3.save).to be(true)
  end

  it "vote down, vote up, then vote down" do
    @vote1.vote_type = -1
    @vote2.vote_type = 1
    @vote3.vote_type = -1
    @vote1.save
    @vote2.save
    @vote1.destroy
    expect(@vote3.save).to be(true)
  end
end
