class Delivery < ActiveRecord::Base
  belongs_to :address
  
  #validations
  validates :description, presence: true
  validates :delivery_cost, presence: true, numericality: true
end
