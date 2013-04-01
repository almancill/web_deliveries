class Base < ActiveRecord::Base
  belongs_to :motorcycle

  validates :amount, numericality: true
end