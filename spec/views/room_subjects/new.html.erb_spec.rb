require 'rails_helper'

RSpec.describe "room_subjects/new", type: :view do
  before(:each) do
    assign(:room_subject, RoomSubject.new(
      :name => "MyText"
    ))
  end

  it "renders new room_subject form" do
    render

    assert_select "form[action=?][method=?]", room_subjects_path, "post" do

      assert_select "textarea#room_subject_name[name=?]", "room_subject[name]"
    end
  end
end
