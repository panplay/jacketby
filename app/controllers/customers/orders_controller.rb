class Customers::OrdersController < ApplicationController
  def new
  	  @order = Order.new
  	  @customer = current_customer
  	  #@address = Address.new(address_params)
 
  end

  def create
  	  @order = Order.new(order_params)

      @order_detail = @order.order_detail
      @order_detail.save
      @order_detail.item.stock -= @oder_detail.quantity
      @order_detail.item.save
  end


  private
  def order_params
  	  params.require(:orders).permit(:delivery_name,:postal_code, :destination,:payment,  :item_id)
  end

  #def address_params
  	  #params.require(:addresses).permit(:postal_code,:address)
  #end

end
