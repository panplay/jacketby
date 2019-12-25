class Admin::CustomersController < ApplicationController

  def show
  	@customer = Customer.find(params[:id])
  	@customers =Customer.page(params[:page]).per(2)
  	@orders = Order.where(customer_id: current_customer.id)
  	 #総売上
  	  total = 0
      customer_total = 0
      @orders.each do |x|
        total += x.total_price
        @customer_total = x.total_price
      end
      @total = total
  end


  def hide
  	@customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
  	redirect_to root_path
  end

  def edit
  	@customer = Customer.find(params[:id])
  	@customer.addresses.build
  end

  def index
    @customer =Customer.page(params[:page]).per(1)
     @orders = Order.all
     if params[:vort] == "2"
      @customers = Customer.all
    else
      @customers = Customer.all.order(created_at: :desc)
  end
end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end
private
def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email, addresses_attributes:[:id,:postal_code,:address,:is_deleted])
end
def correct_user
    user = Customer.find(params[:id])
    if current_user != customer
      redirect_to admin_customers_path(current_user)
    end
   end
end
