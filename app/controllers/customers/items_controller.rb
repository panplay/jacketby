class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all.order(created_at: :desc).limit(4)
  	@arrival_items = ArrivalItem.all
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
    @favorite = Favorite.new
  end

  def show
  	@item = Item.find(params[:id])
  end
end
