class ChargesController < ApplicationController
  before_action :set_charges_controller, only: [:show, :edit, :update, :destroy]

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 1500,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    if charge.paid
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      current_user.premium!
      redirect_to wikis_path(current_user) # or wherever
    end


    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Membership - #{current_user.email}",
    amount: 1500
    }
  end

  def down_grade
      current_user.standard!
      current_user.wikis.each do |wiki|
        wiki.private = false
        wiki.save
      end

      redirect_to wikis_path(current_user)
  end
end
