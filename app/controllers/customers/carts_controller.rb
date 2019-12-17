class Customers::CartsController < ApplicationController
  before_action :setup_cart!, only: [:create, :update, :destroy]
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
  end

  def destroy
    item = Item.find(params[:item_id])
    cart = current_customer.carts.find_by(item_id: item.id)
    cart.destroy
    reLdirect_to customers_item_path(item)
  end

  private
  #def cart_params
      #params.require(:cart).permit(:item_id, :customer_id, :quantity)
  #end

  def setup_cart
    @cart_item = current_cart.cart.find_by(item_id: params[:item_id])
  #end


end
