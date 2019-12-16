class Admin::HomesController < ApplicationController
  def index
  	@artist = Artist.new
  	@artists = Artist.all
  	@label = Label.new
  	@labels = Label.all
  	@category = Category.new
  	@categories = Category.all
  end


end
