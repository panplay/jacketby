class Customers::OrdersController < ApplicationController
  def new
  	  @order = Order.new
  	  @customer = current_customer
  	  #@address = Address.new(address_params)
 
  end

  def create
  	  @order = Order.new(order_params)
  end


  private
  def order_params
  	  params.require(:orders).permit(:delivery_name,:postal_code, :destination,:payment)
  end

  #def address_params
  	  #params.require(:addresses).permit(:postal_code,:address)
  #end

end
