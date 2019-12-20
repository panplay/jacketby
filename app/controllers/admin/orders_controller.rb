class Admin::OrdersController < ApplicationController
  def index
  	  @orders = Order.all
  	  @order_detail = OrderDetail.all
  end

  def update
      #@customer = Customer.find(params[:id])
  end
end
