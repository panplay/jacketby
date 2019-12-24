class Customers::PostCommentsController < ApplicationController

	def create
		item = Item.find(params[:item_id])
		comment = current_customer.post_comments.new(post_comment_params)
		comment.item_id = item.id
		comment.save
		redirect_to customers_item_path(item)
	end

	def destroy
		post_comment = current_user.post_comments.find_by(post_comment)
		post_comment.destroy
		redirect_to admin_item_path(post_comment.item)
	end

	def edit
		@post_comment = PostComment.find(params[:id])
		@item = Item.find(params[:item_id])
	end

	def update
		@post_comment = PostComment.find(params[:id])
    	@item = @post_comment.item.id
    	@post_comment.customer_id = current_customer.id
    	if @post_comment.update(post_comment_params)
      		redirect_to admin_item_path(@item)
    	else
      		render :edit
    	end
    	flash[:success] = 'CD was successfully updated.'
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:customer_id, :item_id, :comment)
	end

end
