class Admin::CustomersController < ApplicationController
  def show
  end

  def hide
  end

  def index
  	@customers = Customer.page(params[:page]).reverse_order
  end

  def update
  end
end
