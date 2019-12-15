class Customers::CartsController < ApplicationController
  
  def create
  	  @customer = current_customer
      @item = Item.find(params[:item_id])
      newcart = Cart.new(cart_params)
      newcart.customer_id = current_customer.id
      newcart.item_id = @item.id
      newcart.save
      redirect_to new_customer_orders_path(newcart.id)
  end

  def show
      newcart = Cart.new
      carts = Cart.all
      # @item = Item.find(params[:id])
      @customer = current_customer
  end

  def update
  end

  def destroy
  end

  private
  def cart_params
      params.require(:cart).permit(:item_id, :customer_id, :quantity)
  end


end
