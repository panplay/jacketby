class Admin::ArrivalItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@arrival_item = ArrivalItem.new(arrival_item_params)
  	@arrival_item.save
		redirect_to admin_items_path
	flash[:success] = 'Artist was successfully created.'
  end

  def update
  end

  def arrival_item_params
		params.require(:arrival_item).permit(:arrival_count, :arrival_time)
  end
end
