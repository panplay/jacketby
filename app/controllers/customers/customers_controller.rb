class Customers::CustomersController < ApplicationController
  def edit
  	@item = Item.find(params[:id])
  	@customer = Customer.find(params[:id])
  end

  def favorites
    @favorites = Favorite.where(customer_id: current_customer.id)
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
  end

  def carts
    @customer = Customer.find_by(id: params[:id])
    @carts = Cart.where(customer_id: @customer.id)
  end

end
