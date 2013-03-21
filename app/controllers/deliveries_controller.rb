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
      if @customer.save
        @delivery = @customer.addresses[0].deliveries[0]
        #SE GUARDO HAY QUE MOSTRAR EL PDF PARA IMPRESION
      else

      end
    else
      if params[:customer][:addresses_attributes][:id]
        @addresses = Address.find(params[:customer][:addresses_attributes][:id])
        @delivery = @addresses.deliveries.new(params[:customer][:addresses_attributes][0][:deliveries_attributes][0])
        if @delivery.save
          #SE GUARDO HAY QUE MOSTRAR EL PDF PARA IMPRESION
        else
          #HUBO ERROR
        end
      else
        #@customer = Customer.find()
      end
    end
    # if params[:delivery][:customer][:id].to_i == -1
    #   @customer = Customer.new(name: params[:delivery][:customer][:name])
    #   if @customer.save
    #     @t = @customer.telephones.new(number: params[:delivery][:telephone][:number])
    #     if @t.save
    #       if params[:delivery][:address][:value] == ''
    #         if params[:delivery][:address][:id]
    #           @a = Address.find(params[:delivery][:address][:id])
    #           @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery_cost])
    #           if @d.save
    #             #Ya aqui se va a mandar al render pdf para Impresion
    #           else
    #             @a.destroy

    #             render 'new'
    #           end 
    #         else
    #           render 'new', error: 'Debe Especificar una Dirección'
    #         end
    #       else
    #         @a = @customer.addresses.new(value: params[:delivery][:address][:value])
    #         if @a.save
    #           @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery][:delivery_cost])
    #           if @d.save
    #             #Ya aqui se va a mandar al render pdf para Impresion
    #           else
    #             render 'new'
    #           end
    #         else
    #           render 'new'
    #         end
    #       end
    #     else
    #       @t.destroy
    #       @customer.destroy
    #       render 'new'
    #     end
    #   else
    #     render 'new'
    #   end
    # else
    #   @customer = Customer.find(params[:delivery][:customer][:id])
    #   if params[:delivery][:address][:value] == ''
    #     if params[:delivery][:address][:id]
    #       @a = Address.find(params[:delivery][:address][:id])
    #       @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery][:delivery_cost])
    #       if @d.save
    #         #Ya aqui se va a mandar al render pdf para Impresion
    #       else
    #         render 'new'
    #       end
    #     else
    #       render 'new', error: 'Debe Especificar una Dirección'
    #     end 
    #   else
    #     if params[:delivery][:address][:id]
    #       @a = Address.find(params[:delivery][:address][:id].to_i)
    #       @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery_cost])
    #       if @d.save
    #         #Ya aqui se va a mandar al render pdf para Impresión
    #       else
    #         render 'new'
    #       end 
    #     else
    #       render 'new', error: 'Debe Especificar una Dirección'
    #     end
    #   end  
    # end
  end

  def edit
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

  private
  def create_with_new_customer
    params.require(:customer).permit(:name, telephones_attributes: ['0', :number], addresses_attributes: ['0', :value, deliveries_attributes: [:description, :delivery_cost]])
  end

  def create_without_new_customer
    #params.permit()
  end

end
