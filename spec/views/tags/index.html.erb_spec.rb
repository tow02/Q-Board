require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        :name => "MyText"
      ),
      Tag.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
