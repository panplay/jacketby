class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all.order(created_at: :desc).limit(4)
  	@arrival_items = ArrivalItem.all
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
    @random = Item.order("RANDOM()").limit(8)
  end

  def index2
    @items = Item.page(params[:page]).per(2)
    @categories = Category.all
  end

  def show
  	@item = Item.find(params[:id])
    @cart = Cart.new
  end

  def category
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.id)
    @categories = Category.all
  end
end
