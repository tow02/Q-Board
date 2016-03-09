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

require 'rails_helper'

RSpec.describe AnswerTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
