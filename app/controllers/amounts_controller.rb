class AmountsController < ApplicationController
  def index
  	@motorcycle = Motorcycle.find(params[:motorcycle_id])
  	@amounts = @motorcycle.amounts.paginate(per_page: 15, page: params[:page])
  	@amount = @motorcycle.amounts.new
  end

  def create
  	if request.xhr?
  		@amount = Amount.new(create_amount_parameters)
  		respond_to do |format|
	  		if @amount.save
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

  private
  def create_amount_parameters

  end

  def update_amount_parameters

  end
end
