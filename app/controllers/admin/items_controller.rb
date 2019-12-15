class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @song = Song.new
    @disk = Disk.new
    @arrival_item = ArrivalItem.new
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @pitem.save
      redirect_to item_path(@item)
    else
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
    params.require(:item).permit(:name, :price, :release_date, :comment)
  end

end
