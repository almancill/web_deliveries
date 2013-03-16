class TelephonesController < ApplicationController

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
      parameters = update_telephone_params
      @telephone = Telephone.find(parameters['id'])

      respond_to do |format|
        if @telephone.update_attributes(parameters['edit_telephone'])
          format.json {render json: @telephone, status: :ok}
        else
          format.json {render json: @telephone.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  def destroy
      @telephone = Telephone.find_by_id(params[:id])
      @telephone.destroy
      p @telephone
      head :ok
  end

  private
  def update_telephone_params
    params.permit(:id, edit_telephone: [:number])
  end

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
