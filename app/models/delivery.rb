class Delivery < ActiveRecord::Base
  belongs_to :address
  
  default_scope{order('created_at DESC')}
  
  #validations
  validates :description, presence: true
  validates :delivery_cost, presence: true, numericality: true
end
