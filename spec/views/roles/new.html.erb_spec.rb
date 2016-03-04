require 'rails_helper'

RSpec.describe "roles/new", type: :view do
  before(:each) do
    assign(:role, Role.new(
      :name => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", roles_path, "post" do

      assert_select "textarea#role_name[name=?]", "role[name]"

      assert_select "textarea#role_description[name=?]", "role[description]"
    end
  end
end
