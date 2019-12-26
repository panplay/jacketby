class Admin::ArrivalItemsController < ApplicationController
  def index
    if params[:sort] == "2"
      @arrival_items = ArrivalItem.page(params[:page]).per(20).order(arrival_time: :asc, created_at: :asc)
    else
      @arrival_items = ArrivalItem.page(params[:page]).per(20).order(arrival_time: :desc, created_at: :desc)
    end
  end

  def new
    @arrival_item = ArrivalItem.new
    @arrival_items = ArrivalItem.all
    @items = Item.page(params[:page]).per(20).order(created_at: :desc)
  end

  def create
  	@arrival_item = ArrivalItem.new(arrival_item_params)
    @arrival_item.save
    # new = @arrival_item.arrival_count + @arrival_item.item.stock
   #  @arrival_item.item.stock = @arrival_item.arrival_count + @arrival_item.item.stock
    @arrival_item.item.stock += @arrival_item.arrival_count
    @arrival_item.item.update(stock: @arrival_item.item.stock)
  end

  def search
    @item_or_artist = params[:option]
    if @item_or_artist == "1"
      @arrival_item = ArrivalItem.new
      @arrival_items = ArrivalItem.all.order(arrival_time: :desc, created_at: :desc)
      @items = Item.search(params[:search], @item_or_artist).order(created_at: :desc)
      @artists = Artist.all
    else
      @arrival_item = ArrivalItem.new
      @arrival_items = ArrivalItem.all.order(arrival_time: :desc, created_at: :desc)
      @artist = Artist.search(params[:search], @item_or_artist)
      @items = Item.all.order(created_at: :desc)
    end
  end

  def history_search
    @item_or_artist = params[:option]
    if @item_or_artist == "1"
      @arrival_item = ArrivalItem.new
      @arrival_items = ArrivalItem.all.order(arrival_time: :desc, created_at: :desc)
      @items = Item.search(params[:search], @item_or_artist).order(created_at: :desc)
      @artists = Artist.all
    else
      @arrival_item = ArrivalItem.new
      @arrival_items = ArrivalItem.all.order(arrival_time: :desc, created_at: :desc)
      @artist = Artist.search(params[:search], @item_or_artist)
      @items = Item.all.order(created_at: :desc)
    end
  end

  def update
  end

  def arrival_item_params
		params.require(:arrival_item).permit(:arrival_count, :arrival_time, :item_id)
  end
end
