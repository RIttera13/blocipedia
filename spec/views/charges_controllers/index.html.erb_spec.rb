require 'rails_helper'

RSpec.describe "charges_controllers/index", type: :view do
  before(:each) do
    assign(:charges_controllers, [
      ChargesController.create!(),
      ChargesController.create!()
    ])
  end

  it "renders a list of charges_controllers" do
    render
  end
end
