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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
