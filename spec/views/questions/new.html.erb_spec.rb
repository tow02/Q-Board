require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :user => nil,
      :room_subject => nil,
      :title => "MyText",
      :content => "MyText",
      :total_vote => 1,
      :total_star => 1
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_user_id[name=?]", "question[user_id]"

      assert_select "input#question_room_subject_id[name=?]", "question[room_subject_id]"

      assert_select "textarea#question_title[name=?]", "question[title]"

      assert_select "textarea#question_content[name=?]", "question[content]"

      assert_select "input#question_total_vote[name=?]", "question[total_vote]"

      assert_select "input#question_total_star[name=?]", "question[total_star]"
    end
  end
end
