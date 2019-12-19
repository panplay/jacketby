class Admin::CustomersController < ApplicationController

  def show
  	@customer = Customer.find(params[:id])
  end

  def hide
  	book = Customer.find(params[:id])
    customer.destroy
  	flash[:notice] = "customer was successfully destroyed."
  	redirect_to admin_customers_path(@customer)
  end

  def edit
  	@customer = Customer.find(params[:id])
  	@customer.addresses.build
  end

  def index
    @customers =Customer.page(params[:page]).per(4)
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
