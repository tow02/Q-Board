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

require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "GET /answers" do
    it "works! (now write some real specs)" do
      get answers_path
      expect(response).to have_http_status(200)
    end
  end
end
