class Admin::ArrivalItemsController < ApplicationController
  def index
    @arrival_items = ArrivalItem.all
    @item = Item.all
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
    @arrival_item.save
    #redirect_to admin_arrival_items_path
  end

  def update
  end

  def arrival_item_params
		params.require(:arrival_item).permit(:arrival_count, :arrival_time, :item_id)
  end
end
