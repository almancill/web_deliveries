class Address < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :value
end
