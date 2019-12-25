class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all.order(created_at: :desc).limit(4)
  	@arrival_items = ArrivalItem.all
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(16).pluck(:item_id))
    @random = Item.order("RANDOM()").limit(8)
    @item_sale = Item.where(sale: 2).order(created_at: :desc).limit(5)
  end

  def index2
    @items = Item.page(params[:page]).per(16)
    @categories = Category.all
  end

  def show
  	@item = Item.find(params[:id])
    @cart = Cart.new
    @post_comment = PostComment.new
  end

  def category
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.id)
    @categories = Category.all
  end

  def search
    @item_or_artist = params[:option]
    if @item_or_artist == "1"
      @items = Item.search(params[:search], @item_or_artist)
      @artists = Artist.all
      @labels = Label.all
      @categories = Category.all
    else
      @artist = Artist.search(params[:search], @item_or_artist)
      @items = Item.all
      @labels = Label.all
      @categories = Category.all
    end
  end
end
