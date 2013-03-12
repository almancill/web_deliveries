class TelephonesController < ApplicationController
  before_filter 

  def create
    if request.xhr?
      @telephone = Telephone.new(telephone_params)
      if @telephone.save
        head :created
      else
        head :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    c = @telephone.customer
    @telephone.destroy
    redirect_to c, notice: 'Telefono Eliminado Satisfactoriamente'
  end

  private
  def telephone_params
    params.require(:telephone).permit(:customer_id, :number, :username, :admin)
  end

  def telephone_get_params
    params.require(:telephone).permit(:id)
  end

  def find_telephone
    @telephone = Telephone.find(telephone_get_params)
  end
end
