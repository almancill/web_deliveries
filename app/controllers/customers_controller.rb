class CustomersController < ApplicationController
  before_filter :find_customer, only:[:show, :edit, :update]
  skip_before_filter :require_admin

  def index
    @customers = Customer.paginate(per_page: 15, page: params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Usuario Creado Satisfactoriamente'
    else
      render 'new'
    end 
  end

  def show
    @telephone = @customer.telephones.new
    @address = @customer.addresses.new
    @telephones = @customer.telephones
    @addresses = @customer.addresses
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      redirect_to customers_path, notice: 'Usuario Editado Satisfactoriamente'
    else
      render 'edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email)
  end
  
  def find_customer
    @customer = Customer.find(params[:id])
  end
end
