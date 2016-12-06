require 'rails_helper'

RSpec.describe "charges_controllers/edit", type: :view do
  before(:each) do
    @charges_controller = assign(:charges_controller, ChargesController.create!())
  end

  it "renders the edit charges_controller form" do
    render

    assert_select "form[action=?][method=?]", charges_controller_path(@charges_controller), "post" do
    end
  end
end
