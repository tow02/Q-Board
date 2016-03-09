require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :user => nil,
      :room => nil,
      :title => "MyText"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_user_id[name=?]", "question[user_id]"

      assert_select "input#question_room_id[name=?]", "question[room_id]"

      assert_select "textarea#question_title[name=?]", "question[title]"
    end
  end
end
