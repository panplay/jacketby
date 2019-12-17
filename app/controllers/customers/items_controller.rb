class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all.order(created_at: :desc).limit(4)
  	@arrival_items = ArrivalItem.all
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))
    @random = Item.order("RANDOM()").limit(8)
  end

  def show
  	@item = Item.find(params[:id])
    @cart = Cart.new
  end
end
