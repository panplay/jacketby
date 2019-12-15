class Customers::ItemsController < ApplicationController
  def index
  	@result = @q.result(distinct: true)
  end

  def show
  end
end
