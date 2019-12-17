class Admin::CustomersController < ApplicationController
  def show
  	@customer = Customer.find(params[:id])
  end

  def hide
  end

  def edit
  end

  def index
  	@customer = current_user
    @customers =Customer.all
  end

  def update
  end
end
