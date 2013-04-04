class Amount < ActiveRecord::Base
  belongs_to :motorcycle
  attr_accessible :description, :money_amount
end
