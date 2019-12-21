class Admin::OrdersController < ApplicationController
  def index
  	  @orders = Order.all.order(created_at: :desc)
  	  total = 0
      sum = 0
      @orders.each do |x|
        total += x.total_price
        x.order_details.each do |y|
          sum += ( y.quantity * y.item.price )
        end
        @sum = sum
      end
      @total = total
  end

  def update
      #@customer = Customer.find(params[:id])
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admin_orders_path
  end

  private
  def order_params
  	  params.require(:order).permit(:customer_id,:status,:payment,:order_time, :total_price,:delivery_charge,:delivery_name,:postal_code, :destination)
  end
end
