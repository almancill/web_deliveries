class Telephone < ActiveRecord::Base
  belongs_to :customer
  
  #Validations
  validates :number, numericality: true, presence: true, length: {in: 7..9}

end
