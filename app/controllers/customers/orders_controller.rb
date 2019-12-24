class Customers::OrdersController < ApplicationController

	
  def new
  	  @order = Order.new
  	  @customer = current_customer
      @carts = Cart.where(customer_id: @customer.id)
      @addresses = Address.where(customer_id: @customer.id)
      #@address = current_customer.address.find([])
  end

  def new_address
      @order = Order.new
  	  @customer = current_customer
      @carts = Cart.where(customer_id: @customer.id)
      @addresses = Address.where(customer_id: @customer.id)
  end

  def create
  	 #注文テーブル保存
  	  order = Order.new(order_params)
      order.total_price = params[:total_price]
      order.save!
     #注文詳細テーブル保存
    current_customer.carts.each do |n|
      order_detail = OrderDetail.new
       	order_detail.quantity = n.quantity
       	order_detail.item_id = n.item_id
      order_detail.tax = (order.total_price * 0.1).to_i
      order_detail.order_id = order.id
      order_detail.save!
      #在庫計算
      order_detail.item.stock -= order_detail.quantity
      order_detail.item.update(stock: order_detail.item.stock)
  	end
      #カート削除
      current_customer.carts.where(customer_id:current_customer.id).destroy_all

      redirect_to customers_homes_thanks_path
  end

  def pay
      Payjp.api_key = "sk_test_c3fabecb879eaa80c4f3bb15"
      charge = Payjp::Charge.create(
      :amount => params[:total_price],
      :card => params['payjp-token'],
      :currency => 'jpy',
      )
  end

  private
  def order_params
  	  params.require(:order).permit(:customer_id,:status,:payment,:order_time, :total_price,:delivery_charge,:delivery_name,:postal_code, :destination)
  end

  def address_params
  	  params.require(:addresses).permit(:id,:postal_code,:address)
  end

end
