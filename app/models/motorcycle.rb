class Motorcycle < ActiveRecord::Base
	attr_accessor :daily_amounts, :daily_deliveries

	has_many :deliveries
	has_many :amounts

	default_scope{order('name ASC')}

	validates :name, :messenger_name, presence: true

	before_validation :format_attributes

	def setting_daily_attrs(date)
		date = date.split('-')
		
		#For Use in Production Environment
		self.daily_amounts = self.amounts.where("to_char(created_at,'%d') = ? AND to_char(created_at,'%m') = ? AND to_char(created_at,'%Y') = ?", date[0], date[1], date[2])
		self.daily_deliveries = self.deliveries.where("to_char(created_at,'%d') = ? AND to_char(created_at,'%m') = ? AND to_char(created_at,'%Y') = ?", date[0], date[1], date[2]) 
		
		#For Use in Development Environment
		#self.daily_amounts = self.amounts.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?", date[0], date[1], date[2])
		#self.daily_deliveries = self.deliveries.where("STRFTIME('%d', created_at) = ? AND STRFTIME('%m', created_at) = ? AND STRFTIME('%Y', created_at) = ?", date[0], date[1], date[2])
	end

	def total_deliveries_income
		self.daily_deliveries.sum('delivery_cost')
	end

	def total_deliveries_cost
		self.daily_deliveries.sum('invoice_cost')
	end

	def total_daily_amounts
		self.daily_amounts.sum('money_amount')
	end

	private
	def format_attributes
		self.name = self.name.strip.squeeze(" ").titleize
		self.messenger_name = self.messenger_name.squeeze(" ").titleize
	end
end
