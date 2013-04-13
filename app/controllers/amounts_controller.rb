class AmountsController < ApplicationController
  def index
  	@motorcycle = Motorcycle.find(params[:motorcycle_id])
  	@amounts = @motorcycle.amounts.paginate(per_page: 15, page: params[:page])
  	@amount = @motorcycle.amounts.new
  end

  def create
  end
end
