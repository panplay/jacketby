class Customers::CartsController < ApplicationController
  #before_action :setup_cart!, only: [:create, :update, :destroy]
  def create
      #@customer = current_customer
  	  @item = Item.find(params[:item_id])
      @newcart = Cart.new(cart_params)
      @newcart.customer_id = current_customer.id
      @newcart.item_id = @item.id
      @newcart.save
      redirect_to customers_item_path(@item)
      #if
      #@newcart.blank?
      #@newcart = current_customer.cart.build(item_id: params[:item_id])
      #end
      #@newcart.quantity += params[:quantity].to_i
      #@newcart.save
  end

  def show
      #@newcarts = current_customer.carts
      @carts = Cart.all
      @item = Item.find(params[:id])
      @cart = Cart.find(params[:id])
      #@customer = current_customer
  end

  def update
  end

  def destroy
  end

  private
  def cart_params
      params.require(:cart).permit(:item_id, :customer_id, :quantity)
  end

  #def setup_cart_item!
    #@newcart = current_customer.cart.find_by(item_id: params[:item_id])
  #end


end
