class AddressesController < ApplicationController
  def new
  end

  def show
  	@customer = Customer.find(params[:customer_id])
  	@address = @customer.addresses.find(params[:id])
  	@deliveries = 'Varios Deliveries'
  end

  def create 
    if request.xhr?
      @address = Address.new(address_params)

      respond_to do |format|
        if @address.save
          format.json {render json: @address.to_json, status: :created}
        else
          format.json {render json: @address.errors.to_json, status: :unprocessable_entity}
        end
      end
    end 
  end

  def update
    if request.xhr?
      @address = Address.find(params[:id])

      respond_to do |format|
        if @address.update_attributes(value: params[:edit_address][:value])
          format.json {render json: @address.to_json, status: :ok}
        else
          format.json {render json: @address.errors.to_json, status: :unprocessable_entity}
        end
      end

    end
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :value)
  end
end
