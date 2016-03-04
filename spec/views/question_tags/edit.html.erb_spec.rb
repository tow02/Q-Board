require 'rails_helper'

RSpec.describe "question_tags/edit", type: :view do
  before(:each) do
    @question_tag = assign(:question_tag, QuestionTag.create!(
      :question => nil,
      :tag => nil
    ))
  end

  it "renders the edit question_tag form" do
    render

    assert_select "form[action=?][method=?]", question_tag_path(@question_tag), "post" do

      assert_select "input#question_tag_question_id[name=?]", "question_tag[question_id]"

      assert_select "input#question_tag_tag_id[name=?]", "question_tag[tag_id]"
    end
  end
end
