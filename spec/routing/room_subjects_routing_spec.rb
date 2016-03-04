# == Schema Information
#
# Table name: room_subjects
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe RoomSubjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/room_subjects").to route_to("room_subjects#index")
    end

    it "routes to #new" do
      expect(:get => "/room_subjects/new").to route_to("room_subjects#new")
    end

    it "routes to #show" do
      expect(:get => "/room_subjects/1").to route_to("room_subjects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/room_subjects/1/edit").to route_to("room_subjects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/room_subjects").to route_to("room_subjects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/room_subjects/1").to route_to("room_subjects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/room_subjects/1").to route_to("room_subjects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/room_subjects/1").to route_to("room_subjects#destroy", :id => "1")
    end

  end
end
