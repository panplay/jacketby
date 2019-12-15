class Admin::ArtistsController < ApplicationController
  def create
  	@artist = Artist.new(artist_params)
  	if @artist.save
		redirect_to admin_homes_index_path
	else
		redirect_to admin_homes_index_path
	end
	flash[:success] = 'Artist was successfully created.'
  end

  def update
  	artist = Artist.new
     @artist = Artist.find(params[:id])
    	if @artist.update(artist_params)
      		redirect_to admin_homes_index_path
    	else
      		redirect_to admin_homes_index_path
    	end
    	flash[:success] = 'Artist was successfully updated.'
  end

  def hide
  end

  private
	def artist_params
		params.require(:artist).permit(:name)
	end

end
