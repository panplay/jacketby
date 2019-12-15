class Customers::HomesController < ApplicationController
  def about
  	@q = Item.ransack
  	@q.build_condition if @q.conditions.empty?
  end

  def thanks
  end

  def unsubscribe
  end
end
