class ReportsController < ApplicationController
  def index
  end

  def obtain
  	date = params[:date]
  	@date = date.split('-')
  	
    #For Using in Development Environment
    #@number_deliveries = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?",@date[0],@date[1],@date[2]).count
  	#@total_cost_deliveries = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?",@date[0],@date[1],@date[2]).sum('delivery_cost')
  	#@total_invoice = Delivery.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?",@date[0],@date[1],@date[2]).sum('invoice_cost')
  	
    #For Using In Production Environment
    @number_deliveries = Delivery.where("to_char(created_at,'%d') = ? AND to_char(created_at,'%m') = ? AND to_char(created_at,'%Y') = ?",@date[0],@date[1],@date[2]).count
    @total_cost_deliveries = Delivery.where("to_char(created_at,'%d') = ? AND to_char(created_at,'%m') = ? AND to_char(created_at,'%Y') = ?",@date[0],@date[1],@date[2]).sum('delivery_cost')
    @total_invoice = Delivery.where("to_char(created_at,'%d') = ? AND to_char(created_at,'%m') = ? AND to_char(created_at,'%Y') = ?",@date[0],@date[1],@date[2]).sum('invoice_cost')
    
    @number_customers = Customer.count
  	@motorcycles = Motorcycle.all

    @motorcycles.map do |m|
      m.setting_daily_attrs(date)
    end
    
    respond_to do |format|
  		format.xls
	  end
  end
end
