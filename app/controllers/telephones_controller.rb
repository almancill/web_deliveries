class TelephonesController < ApplicationController
  before_filter :find_telephone, only: [:destroy]

  def create
    if request.xhr?
      parameters = telephone_params
      @telephone = Telephone.new(parameters)
      @telephones = Customer.find_by_id(parameters.slice(:customer_id)[:customer_id]).telephones
      
      respond_to do |format|
        if @telephone.save
          format.json {render json: @telephone.to_json, status: :created}
        else
          format.json {render json: @telephone.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  def edit
  end

  def update
    if request.xhr?
      p 'LOS PARAMETROS SON!!!!!!'
      p params
    end
  end

  def destroy
    c = @telephone.customer
    @telephone.destroy
    redirect_to customer_path(c), notice: 'Telefono Eliminado Satisfactoriamente'
  end

  private
  def telephone_params
    params.require(:telephone).permit(:customer_id, :number)
  end

  def telephone_get_params
    params.require(:telephone).permit(:id)
  end

  def find_telephone
    @telephone = Telephone.find(telephone_get_params)
  end
end
