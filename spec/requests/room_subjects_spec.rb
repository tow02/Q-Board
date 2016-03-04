# == Schema Information
#
# Table name: room_subjects
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "RoomSubjects", type: :request do
  describe "GET /room_subjects" do
    it "works! (now write some real specs)" do
      get room_subjects_path
      expect(response).to have_http_status(200)
    end
  end
end
