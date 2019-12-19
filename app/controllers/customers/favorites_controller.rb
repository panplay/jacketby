class Customers::FavoritesController < ApplicationController
	before_action :create, only: [:create1, :create2]
	before_action :destroy, only: [:destroy1, :destroy2]

    def create1
		redirect_to customers_items_path
	end

	def create2
		redirect_to customers_item_path(params[:item_id])
	end

	def destroy1
		redirect_to customers_items_path
	end

	def destroy2
		redirect_to customers_item_path(params[:item_id])
	end

	private
	def create
		item = Item.find(params[:item_id])
		favorite = current_customer.favorites.new(item_id: item.id)
		favorite.save
    end

    def destroy
		item = Item.find(params[:item_id])
		favorite = current_customer.favorites.find_by(item_id: item.id)
		favorite.destroy
    end

end
