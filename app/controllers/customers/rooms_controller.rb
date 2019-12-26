class Customers::RoomsController < ApplicationController
  def show
  	  @room = Room.find(params[:id])
  	  @posts = @room.posts
  end

  def create
	  @room = Room.new(room_params)
	  @room.save
	  current_customer.customer_rooms.create(room_id: @room.id)
	  redirect_to customers_room_path(@room)
  end

  private
  def room_params
  	  params.require(:room).permit(:name)
  end
end
