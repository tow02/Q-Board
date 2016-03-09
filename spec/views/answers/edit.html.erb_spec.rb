require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :question => nil,
      :user => nil,
      :content => "MyText",
      :is_question => false,
      :is_accepted => false
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_user_id[name=?]", "answer[user_id]"

      assert_select "textarea#answer_content[name=?]", "answer[content]"

      assert_select "input#answer_is_question[name=?]", "answer[is_question]"

      assert_select "input#answer_is_accepted[name=?]", "answer[is_accepted]"
    end
  end
end
