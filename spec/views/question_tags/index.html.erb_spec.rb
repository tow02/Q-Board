require 'rails_helper'

RSpec.describe "question_tags/index", type: :view do
  before(:each) do
    assign(:question_tags, [
      QuestionTag.create!(
        :question => nil,
        :tag => nil
      ),
      QuestionTag.create!(
        :question => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of question_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
