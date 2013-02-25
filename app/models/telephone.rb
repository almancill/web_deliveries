class Telephone < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :number
end
