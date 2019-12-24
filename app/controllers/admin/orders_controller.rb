class Admin::OrdersController < ApplicationController
  def index
    if params[:sort] == "1"
      @orders = Order.where(status: "受付").page(params[:page]).per(5).order(created_at: :desc)
    elsif params[:sort] == "2"
      @orders = Order.where(status: "商品準備中").page(params[:page]).per(5).order(created_at: :desc)
    elsif params[:sort] == "3"
      @orders = Order.where(status: "出荷済").page(params[:page]).per(5).order(created_at: :desc)
    else
      @orders = Order.page(params[:page]).per(5).order(created_at: :desc)
    end
      #総売上
  	  total = 0
      customer_total = 0
      @orders.each do |x|
        total += x.total_price
        @customer_total = x.total_price
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
