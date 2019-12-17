class Customers::FavoritesController < ApplicationController
   def create
       @favorite = current_customer.favorites.create(item_id: params[:item_id])
       @item = Item.find(params[:item_id])
       render :create
   end
   def destroy
       @favorite = Favorite.find_by(item_id: params[:item_id], customer_id: current_customer.id)
       @favorite.destroy
       @item = Item.find(params[:item_id])
       render :destroy
   end
end
