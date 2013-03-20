#encoding: utf-8
class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.paginate(per_page: 15, page: params[:page])
  end

  def new
    @customer = Customer.new
    @t = Telephone.new
    @a = Address.new
    @d = Delivery.new
  end

  def create
    if params[:delivery][:customer][:id].to_i == -1
      @customer = Customer.new(name: params[:delivery][:customer][:name])
      if @customer.save
        @t = @customer.telephones.new(number: params[:delivery][:telephone][:number])
        if @t.save
          if params[:delivery][:address][:value] == ''
            if params[:delivery][:address][:id]
              @a = Address.find(params[:delivery][:address][:id])
              @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery_cost])
              if @d.save
                #Ya aqui se va a mandar al render pdf para Impresion
              else
                render 'new'
              end 
            else
              render 'new', error: 'Debe Especificar una Dirección'
            end
          else
            @a = @customer.addresses.new(value: params[:delivery][:address][:value])
            if @a.save
              @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery][:delivery_cost])
              if @d.save
                #Ya aqui se va a mandar al render pdf para Impresion
              else
                render 'new'
              end
            else
              render 'new'
            end
          end
        else
          render 'new'
        end
      else
        render 'new'
      end
    else
      @customer = Customer.find(params[:delivery][:customer][:id])
      if params[:delivery][:address][:value] == ''
        if params[:delivery][:address][:id]
          @a = Address.find(params[:delivery][:address][:id])
          @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery][:delivery_cost])
          if @d.save
            #Ya aqui se va a mandar al render pdf para Impresion
          else
            render 'new'
          end
        else
          render 'new', error: 'Debe Especificar una Dirección'
        end 
      else
        if params[:delivery][:address][:id]
          @a = Address.find(params[:delivery][:address][:id].to_i)
          @d = @a.deliveries.new(description: params[:delivery][:description], delivery_cost: params[:delivery_cost])
          if @d.save
            #Ya aqui se va a mandar al render pdf para Impresión
          else
            render 'new'
          end 
        else
          render 'new', error: 'Debe Especificar una Dirección'
        end
      end  
    end
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
end
