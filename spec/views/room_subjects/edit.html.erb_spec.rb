require 'rails_helper'

RSpec.describe "room_subjects/edit", type: :view do
  before(:each) do
    @room_subject = assign(:room_subject, RoomSubject.create!(
      :name => "MyText"
    ))
  end

  it "renders the edit room_subject form" do
    render

    assert_select "form[action=?][method=?]", room_subject_path(@room_subject), "post" do

      assert_select "textarea#room_subject_name[name=?]", "room_subject[name]"
    end
  end
end
