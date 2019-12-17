class Customers::CartsController < ApplicationController
  before_action :setup_cart!, only: [:create, :update, :destroy]
  def create
      #@customer = current_customer
      #@item = Item.find(params[:item_id])
      #@newcart = Cart.new(cart_params)
      #@newcart.customer_id = current_customer.id
      #@newcart.item_id = @item.id
      #@newcart.save
      #redirect_to customers_item_path(@item)
      if
      @cart_item.blank?
      @cart_item = current_cart.cart.build(item_id: params[:item_id])
      end
      @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
      redirect_to current_cart
  end

  def show
      @cart_items = current_cart.carts
      #carts = Cart.all
      #@item = Item.find(params[:id])
      #@cart = Cart.find(params[:id])
      #@customer = current_customer
  end

  def update
  end

  def destroy
  end

  private
  #def cart_params
      #params.require(:cart).permit(:item_id, :customer_id, :quantity)
  #end

  def setup_cart
    @cart_item = current_cart.cart.find_by(item_id: params[:item_id])
  #end


end
