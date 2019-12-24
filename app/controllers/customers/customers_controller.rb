class Customers::CustomersController < ApplicationController
  def edit
  	@customer = Customer.find(params[:id])
    @customer.addresses.build
    @customers =Customer.page(params[:page]).per(2)
    #@customer.addresses.build
    @orders = Order.where(customer_id: current_customer.id)
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


  def favorites
    @favorites = Favorite.where(customer_id: current_customer.id)
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
  end

  def carts
    @customer = Customer.find_by(id: params[:id])
    @carts = Cart.where(customer_id: @customer.id)
  end

  def hide
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to edit_customers_customer_path(@customer)
  end

private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email, addresses_attributes:[:id,:postal_code,:address,:_destroy])
  end
end