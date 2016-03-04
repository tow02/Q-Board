require 'rails_helper'

RSpec.describe "question_tags/new", type: :view do
  before(:each) do
    assign(:question_tag, QuestionTag.new(
      :question => nil,
      :tag => nil
    ))
  end

  it "renders new question_tag form" do
    render

    assert_select "form[action=?][method=?]", question_tags_path, "post" do

      assert_select "input#question_tag_question_id[name=?]", "question_tag[question_id]"

      assert_select "input#question_tag_tag_id[name=?]", "question_tag[tag_id]"
    end
  end
end
