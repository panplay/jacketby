class Customers::CartsController < ApplicationController
  def create
  	  item = Item.find(params[:item_id])
      cart = current_customer.carts.new(cart_params)
      cart.item_id = item.id
      cart.save
      redirect_to customers_item_path(item)
  end

  def show
      @item = Item.all
  end

  def update
    item = Item.find(params[:item_id])
    cart = current_customer.carts.find_by(item_id: item.id)
    cart.update
    redirect_to customers_path(item)

  end

  def destroy
    item = Item.find(params[:item_id])
    cart = current_customer.carts.find_by(item_id: item.id)
    cart.destroy
    redirect_to customers_path(item)
  end

  private
  def cart_params
      params.require(:cart).permit(:item_id, :customer_id, :quantity)
  end
end