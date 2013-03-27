class Delivery < ActiveRecord::Base
  belongs_to :address
  belongs_to :motorcycle
  
  default_scope{order('created_at DESC')}
  
  #validations
  validates :description, presence: true
  validates :delivery_cost, presence: true, numericality: true
end
