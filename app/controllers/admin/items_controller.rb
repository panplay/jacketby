class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.arrival_items.build
    @item.disks.build
     @item.disks.each do |disks|
      disks.songs.build
     end
    @arrival_item = ArrivalItem.new
    @artists = Artist.all
    @labels = Label.all
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to admin_items_path
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
        redirect_to admin_items_path
    else
        render :edit
    end
    flash[:success] = 'Wear was successfully updated.'
  end

  def hide
  end

  def index
    @item = Item.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :release_date, :comment, :status, :sale, :image, :artist_id, :label_id, :category_id, arrival_items_attributes: [:id, :arrival_count, :arrival_time, :is_deleted], disks_attributes: [:id, :disk_order, :_destroy, songs_attributes: [:id, :name, :song_order, :_destroy]])
  end

end
