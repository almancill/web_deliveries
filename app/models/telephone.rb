class Telephone < ActiveRecord::Base
  belongs_to :customer
  
  #Validations
  validates :number, numericality: true, presence: true

end
