require 'rails_helper'

RSpec.describe "charges_controllers/show", type: :view do
  before(:each) do
    @charges_controller = assign(:charges_controller, ChargesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
