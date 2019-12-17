class Admin::CustomersController < ApplicationController
  def show
  	@customer = Customer.find(params[:id])
  end

  def hide
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def index
    @customers =Customer.all
  end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
end
private 
def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email)
end
def correct_user
    user = Customer.find(params[:id])
    if current_user != customer
      redirect_to admin_customer_path(current_user)
    end
  end
