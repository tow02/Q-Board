require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      :name => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do

      assert_select "textarea#role_name[name=?]", "role[name]"

      assert_select "textarea#role_description[name=?]", "role[description]"
    end
  end
end
