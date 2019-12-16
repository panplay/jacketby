class Admin::CategoriesController < ApplicationController
  def create
  	@category = Category.new(category_params)
  	if @category.save
		redirect_to admin_homes_index_path
	else
		redirect_to admin_homes_index_path
	end
	flash[:success] = 'Category was successfully created.'
  end

  def update
  	category = Category.new
     @category = Category.find(params[:id])
    	if @category.update(category_params)
      		redirect_to admin_homes_index_path
    	else
      		redirect_to admin_homes_index_path
    	end
    	flash[:success] = 'Category was successfully updated.'
  end

  def hide
  end

  private
	def category_params
		params.require(:category).permit(:name, item_attributes:[:id, :name, disk_attributes: [:id, :disk_order, song_attributes: [:id, :name]]])
	end

end
