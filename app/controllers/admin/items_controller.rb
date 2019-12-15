class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.disks.build
    @item.disks.first.songs.build
    @arrival_item = ArrivalItem.new
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to customers_items_path
    else
      @artists = Artist.all
      @labels = Label.all
      @categories = Category.all
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def hide
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :release_date, :comment, :status, :sale, :image_id, :artist_id, :label_id, :category_id)
  end

end
