class Admin::ArrivalItemsController < ApplicationController
  def index
  end

  def new
    @arrival_item = ArrivalItem.new
    @arrival_items = ArrivalItem.all
    @item = Item.all
  end

  def create
  	@arrival_item = ArrivalItem.new(arrival_item_params)
    @arrival_item.save
  	# new = @arrival_item.arrival_count + @arrival_item.item.stock
   #  @arrival_item.item.stock = @arrival_item.arrival_count + @arrival_item.item.stock
    @arrival_item.item.stock += @arrival_item.arrival_count
    @arrival_item.item.save
  end

  def update
  end

  def arrival_item_params
		params.require(:arrival_item).permit(:arrival_count, :arrival_time, :item_id)
  end
end
