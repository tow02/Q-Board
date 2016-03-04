require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        :name => "MyText",
        :description => "MyText"
      ),
      Role.create!(
        :name => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end