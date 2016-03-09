require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :user => nil,
      :room => nil,
      :title => "MyText"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_user_id[name=?]", "question[user_id]"

      assert_select "input#question_room_id[name=?]", "question[room_id]"

      assert_select "textarea#question_title[name=?]", "question[title]"
    end
  end
end
