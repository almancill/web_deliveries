class Base < ActiveRecord::Base
  belongs_to :motorcycle

  default_scope{order('id DESC')}

  validates :amount, numericality: true
end