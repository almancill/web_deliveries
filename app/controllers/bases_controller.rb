class BasesController < ApplicationController
  def index
  	@bases = Base.where(motorcycle_id: params[:motorcycle_id])
  	@base = Base.new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
