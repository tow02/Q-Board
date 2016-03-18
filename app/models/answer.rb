# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  content     :text
#  is_question :boolean
#  is_accepted :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :images
  has_many :votes
  has_many :answer_tags

  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true

  acts_as_votable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
