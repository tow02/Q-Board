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

class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  validates_uniqueness_of :answer_id, :scope => [:user_id, :vote_type]
end
