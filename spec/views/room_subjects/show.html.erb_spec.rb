require 'rails_helper'

RSpec.describe "room_subjects/show", type: :view do
  before(:each) do
    @room_subject = assign(:room_subject, RoomSubject.create!(
      :name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
