require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(
        :name => "MyText"
      ),
      Room.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
