# == Schema Information
#
# Table name: answer_tags
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerTag < ActiveRecord::Base
  belongs_to :answer
  belongs_to :tag
end
