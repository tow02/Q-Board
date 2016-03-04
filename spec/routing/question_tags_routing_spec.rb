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

require "rails_helper"

RSpec.describe QuestionTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/question_tags").to route_to("question_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/question_tags/new").to route_to("question_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/question_tags/1").to route_to("question_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/question_tags/1/edit").to route_to("question_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/question_tags").to route_to("question_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/question_tags/1").to route_to("question_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/question_tags/1").to route_to("question_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/question_tags/1").to route_to("question_tags#destroy", :id => "1")
    end

  end
end
