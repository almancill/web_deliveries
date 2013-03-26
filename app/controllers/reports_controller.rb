class ReportsController < ApplicationController
  def index
  end

  def obtain
  	date = params[:date]
  	@date = date.split('-')
  	@number_deliveries = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?",@date[0],@date[1],@date[2]).count
  	@total_cost_deliveries = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?",@date[0],@date[1],@date[2]).sum('delivery_cost')
  	@total_invoice = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ? AND invoice_cost != null",@date[0],@date[1],@date[2]).sum('delivery_cost')
  	@number_customers = Customer.count
  	
    respond_to do |format|
  		format.xls
	  end
  end
end
