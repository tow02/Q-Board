# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  room_subject_id :integer
#  title           :text
#  content         :text
#  total_vote      :integer
#  total_star      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module QuestionsHelper
end
