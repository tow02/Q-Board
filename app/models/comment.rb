# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  validates :answer_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
