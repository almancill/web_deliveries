#encoding: utf-8
class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.paginate(per_page: 15, page: params[:page])
  end

  def new
    @customer = Customer.new
    @customer.telephones.build
    @customer.addresses.build.deliveries.build    
  end

  def create
    if params[:customer][:id].to_i == -1
      @customer = Customer.new(create_with_new_customer)
      p = create_without_new_customer
      if @customer.save
        @delivery = @customer.addresses[0].deliveries[0]
        #SE GUARDO HAY QUE MOSTRAR EL PDF PARA IMPRESION
      else
        #HUBO ERROR
        render 'new'
      end
    else
      if params[:customer][:addresses_attributes]['0'][:id]
        @addresses = Address.find(params[:customer][:addresses_attributes]['0'][:id])
        delivery_cost_p = params[:customer][:addresses_attributes]['0'][:deliveries_attributes]['0'][:delivery_cost]
        delivery_description = params[:customer][:addresses_attributes]['0'][:deliveries_attributes]['0'][:description]
        @delivery = @addresses.deliveries.new(description: delivery_description, delivery_cost: delivery_cost_p)
        if @delivery.save
          #SE GUARDO HAY QUE MOSTRAR EL PDF PARA IMPRESION
        else
          #HUBO ERROR
          render 'new'
        end
      else
        @customer = Customer.find(params[:customer][:id])
        @address = Address.new(create_without_new_customer[:addresses_attributes]['0'])
        @address.customer_id = @customer.id
        if @address.save
          @delivery = @address.deliveries[0]
          #SE GUARDO HAY QUE MOSTRAR EL PDF PARA IMPRESION
        else
          render 'new'
        end
      end
    end
  end

  def edit
  end

  def show
    respond_to do |format|
      format.pdf {render layout: false}
    end
  end
  
  def update
  end

  def destroy
  end

  def search
    if request.xhr?
      @customers = Customer.includes(:telephones).where('telephones.number = ?', params[:telephone_number])
      
      render json: @customers.to_json, status: :ok
    end
  end

  def customer_address_deliveries

  end

  private
  def create_with_new_customer
    params.require(:customer).permit(:name, telephones_attributes: ['0', :number], addresses_attributes: ['0', :value, deliveries_attributes: [:description, :delivery_cost]])
  end


  #params.require(:customer).permit(telephones_attributes:[:number])
  def create_without_new_customer
    params.require(:customer).permit(addresses_attributes: [:value, deliveries_attributes: [:description, :delivery_cost]])
  end

end
