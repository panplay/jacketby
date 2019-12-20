class Customers::FavoritesController < ApplicationController
	 before_action :item_params
  def create
    @favorite = Favorite.create(customer_id: current_customer.id, item_id: @item.id)
  end

  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, item_id: @item.id).destroy
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end

end
