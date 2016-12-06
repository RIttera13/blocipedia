require "rails_helper"

RSpec.describe ChargesControllersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/charges_controllers").to route_to("charges_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/charges_controllers/new").to route_to("charges_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/charges_controllers/1").to route_to("charges_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/charges_controllers/1/edit").to route_to("charges_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/charges_controllers").to route_to("charges_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/charges_controllers/1").to route_to("charges_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/charges_controllers/1").to route_to("charges_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/charges_controllers/1").to route_to("charges_controllers#destroy", :id => "1")
    end

  end
end
