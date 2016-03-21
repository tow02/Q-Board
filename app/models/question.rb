# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :answers

  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  # validates_uniqueness_of :user_id, :scope => :room_id
end
