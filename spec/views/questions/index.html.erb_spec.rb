require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :user => nil,
        :room_subject => nil,
        :title => "MyText",
        :content => "MyText",
        :total_vote => 1,
        :total_star => 2
      ),
      Question.create!(
        :user => nil,
        :room_subject => nil,
        :title => "MyText",
        :content => "MyText",
        :total_vote => 1,
        :total_star => 2
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
