class Customers::HomesController < ApplicationController
  def about
  end

  def thanks
  end

  def unsubscribe
  end

  def top
  	if customer_signed_in?
    @room = Room.new
    @rooms = current_customer.rooms
    @nonrooms = Room.where(id: CustomerRoom.where.not(customer_id: current_customer.id).pluck(:id))
  end
  end
end
