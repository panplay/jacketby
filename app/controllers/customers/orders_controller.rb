class Customers::OrdersController < ApplicationController
  def new
  	  @order = Order.new
  	  @customer = current_customer
  end

  def create
  	  @order = Order.new(order_params)
  end


  private
  def order_params
  	  params.require(:orders).permit(:delivery_name,:postal_code, :destination)
  end
end
