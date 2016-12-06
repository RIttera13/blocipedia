require 'rails_helper'

RSpec.describe "charges_controllers/new", type: :view do
  before(:each) do
    assign(:charges_controller, ChargesController.new())
  end

  it "renders new charges_controller form" do
    render

    assert_select "form[action=?][method=?]", charges_controllers_path, "post" do
    end
  end
end
