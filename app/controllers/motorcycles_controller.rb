class MotorcyclesController < ApplicationController
  before_filter :get_motorcycle, only: [:edit, :update]

  def index
    @motorcycles = Motorcycle.paginate(per_page: 15, page: params[:page])
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_attributes)
    if @motorcycle.save
      redirect_to :motorcycles, notice: 'Motocicleta Creada Satisfactoriamente'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @motorcycle.update_attributes(motorcycle_attributes)
      redirect_to :motorcycles, notice: 'Motocicleta Actualizada Satisfactoriamente'
    else
      render 'edit'
    end
  end

  private
  def motorcycle_attributes
    params.require(:motorcycle).permit(:name, :messenger_name, :description)
  end

  def get_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end
end
