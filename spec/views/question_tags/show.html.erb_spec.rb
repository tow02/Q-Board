require 'rails_helper'

RSpec.describe "question_tags/show", type: :view do
  before(:each) do
    @question_tag = assign(:question_tag, QuestionTag.create!(
      :question => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
