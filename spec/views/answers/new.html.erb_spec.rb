require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :question => nil,
      :user => nil,
      :content => "MyText",
      :total_vote => 1,
      :is_accepted => false
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_user_id[name=?]", "answer[user_id]"

      assert_select "textarea#answer_content[name=?]", "answer[content]"

      assert_select "input#answer_total_vote[name=?]", "answer[total_vote]"

      assert_select "input#answer_is_accepted[name=?]", "answer[is_accepted]"
    end
  end
end
