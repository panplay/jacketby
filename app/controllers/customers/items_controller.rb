class Customers::ItemsController < ApplicationController
  def index
  	@item = Item.new
  	@items = Item.all
  	@favorites = @item.favorites
  end

  def show
  end
end
