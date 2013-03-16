class Delivery < ActiveRecord::Base
  belongs_to :address
  attr_accessible :delivery_cost, :description, :invoice_cost, :invoice_number, :note
end
