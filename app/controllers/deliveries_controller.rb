class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.paginate(per_page: 15, page: params[:page])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
