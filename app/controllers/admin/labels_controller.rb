class Admin::LabelsController < ApplicationController
  def create
  	@label = Label.new(label_params)
  	if @label.save
		redirect_to admin_homes_index_path
	else
		redirect_to admin_homes_index_path
	end
	flash[:success] = 'Label was successfully created.'
  end

  def update
  	label = Label.new
     @artist = Label.find(params[:id])
    	if @label.update(label_params)
      		redirect_to admin_homes_index_path
    	else
      		redirect_to admin_homes_index_path
    	end
    	flash[:success] = 'Label was successfully updated.'
  end

  def hide
  end

  private
	def label_params
		params.require(:label).permit(:name, item_attributes:[:id, :name, disk_attributes: [:id, :disk_order, song_attributes: [:id, :name]]])
	end

end
