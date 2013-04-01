class BasesController < ApplicationController
  def index
  	@motorcycle = Motorcycle.find(params[:motorcycle_id])
  	@bases = Base.where(motorcycle_id: params[:motorcycle_id]).paginate(per_page: 15, page: params[:page])
  	@base = @motorcycle.bases.new
  	
  end

  def create
  end

  def update
  end

  def destroy
  end
end
