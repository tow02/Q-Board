require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :question => nil,
      :answer => nil,
      :user => nil,
      :content => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_question_id[name=?]", "comment[question_id]"

      assert_select "input#comment_answer_id[name=?]", "comment[answer_id]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "textarea#comment_content[name=?]", "comment[content]"
    end
  end
end
