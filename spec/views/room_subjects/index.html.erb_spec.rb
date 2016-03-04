require 'rails_helper'

RSpec.describe "room_subjects/index", type: :view do
  before(:each) do
    assign(:room_subjects, [
      RoomSubject.create!(
        :name => "MyText"
      ),
      RoomSubject.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of room_subjects" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
