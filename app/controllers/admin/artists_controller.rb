class Admin::ArtistsController < ApplicationController
  def create
  	@artist = Artist.new(artist_params)
  	@artist.save
  end

  def update
    artist = Artist.new(artist_params)
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  end

  def hide
    @artist = Artist.find(params[:id])
    @artist.update(is_deleted: true)
    redirect_to admin_homes_index_path
  end

  private
	def artist_params
		params.require(:artist).permit(:name, item_attributes:[:id, :name, disk_attributes: [:id, :disk_order, song_attributes: [:id, :name]]])
	end

end
