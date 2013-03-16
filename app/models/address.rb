class Address < ActiveRecord::Base
  
  belongs_to :customer

  #validations
  validates :value, presence: true

  #callbacks
  before_validation :format_attributes

  def format_attributes
  	self.value = self.name.strip.squeeze(" ").titleize
  end
end
