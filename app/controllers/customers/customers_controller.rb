class Customers::CustomersController < ApplicationController
  def edit
  	@item = Item.find(params[:id])
  	@customer = Customer.find(params[:id])
  end

  def favorites
  end

  def carts
    @customer = Customer.find_by(id: params[:id])
    @carts = Cart.where(customer_id: @customer.id)

  end

end
