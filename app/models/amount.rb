class Amount < ActiveRecord::Base
  belongs_to :motorcycle
  
  default_scope{ order('id DESC')}

  validates :money_amount, numericality: true
end
