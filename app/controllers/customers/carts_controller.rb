class Customers::CartsController < ApplicationController
  def create
      cart = current_customer.carts.new(cart_params)
      cart.customer_id = current_customer.id

      cart.save!
      redirect_to customers_path(current_customer.id)
  end

  def show
      @item = Item.all
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to customers_path(current_customer.id)

  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to customers_path(current_customer.id)
  end

  private
  def cart_params
      params.require(:cart).permit(:customer_id,:item_id,:quantity)
  end

end