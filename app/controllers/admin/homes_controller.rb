class Admin::HomesController < ApplicationController
  def index
  	@artist = Artist.new
  	@artists = Artist.where(is_deleted: false)
  	@label = Label.new
  	@labels = Label.where(is_deleted: false)
  	@category = Category.new
  	@categories = Category.where(is_deleted: false)
  end


end
