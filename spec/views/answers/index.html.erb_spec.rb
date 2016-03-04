require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :question => nil,
        :user => nil,
        :content => "MyText",
        :total_vote => 1,
        :is_accepted => false
      ),
      Answer.create!(
        :question => nil,
        :user => nil,
        :content => "MyText",
        :total_vote => 1,
        :is_accepted => false
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
