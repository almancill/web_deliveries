class AmountsController < ApplicationController
  def index
  	@motorcycle = Motorcycle.find(params[:motorcycle_id])
  	@amounts = @motorcycle.amounts.paginate(per_page: 15, page: params[:page])
  	@amount = @motorcycle.amounts.new
    cookies['admin'] = current_user.admin
  end

  def create
  	if request.xhr?
  		@amount = Amount.new(create_amount_parameters)
  		respond_to do |format|
	  		if @amount.save
	  			@amount.created_at = @amount.created_at.strftime('%d-%m-%Y %I:%M %p')
          format.json{render json: @amount.to_json, status: :created}
			  else
				  format.json{render json: @amount.errors.to_json, status: :unprocessable_entity}
			  end
		end
	end
  end

  def update
  	if request.xhr?
  		@amount = Amount.find(parameters['id'])
  		respond_to do |format|
        	if @amount.update_attributes(update_amount_parameters)
	          format.json {render json: @amount, status: :ok}
	        else
	          format.json {render json: @amount.errors, status: :unprocessable_entity}
	        end
	    end
	  end
  end

  def destroy
    @amount = Amount.find(params[:id])
    @amount.destroy
    head :ok
  end

  private
  def create_amount_parameters
    params.require(:amount).permit(:motorcycle_id, :money_amount)
  end

  def update_amount_parameters
    params.require(:amount).permit(:money_amount)
  end
end
