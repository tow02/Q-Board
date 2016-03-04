# == Schema Information
#
# Table name: question_tags
#
#  id          :integer          not null, primary key
#  question_id :integer
#  tag_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe "QuestionTags", type: :request do
  describe "GET /question_tags" do
    it "works! (now write some real specs)" do
      get question_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
