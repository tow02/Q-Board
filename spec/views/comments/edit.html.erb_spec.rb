require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :question => nil,
      :answer => nil,
      :user => nil,
      :content => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_question_id[name=?]", "comment[question_id]"

      assert_select "input#comment_answer_id[name=?]", "comment[answer_id]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "textarea#comment_content[name=?]", "comment[content]"
    end
  end
end
