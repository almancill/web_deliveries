#Encoding: utf-8
class Customer < ActiveRecord::Base

  has_many :telephones
  has_many :addresses

  default_scope{order('name ASC')}

  #Validations
  validates :name, :escaped_name, presence: true
  validates :email, uniqueness: true, allow_blank: true, allow_nil: true
  validates :email, format: { with: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/}, allow_blank: true


  #Callbacks
  before_validation :format_attributes

  #Methods
  def format_attributes
    self.name = self.name.strip.squeeze(" ").titleize
    self.email.strip.downcase! if self.email
    self.escaped_name = self.name.gsub("&","y")
    self.escaped_name = self.escaped_name.gsub(/[^0-9a-zA-ZáéíóúÁÉÍÓÚÑñ'\s]/,"")
    self.escaped_name = self.escaped_name.gsub("Ñ","ñ")
    self.escaped_name = self.escaped_name.gsub(/[Áá]/,"a")
    self.escaped_name = self.escaped_name.gsub(/[Éé]/,"e")
    self.escaped_name = self.escaped_name.gsub(/[Íí]/,"i")
    self.escaped_name = self.escaped_name.gsub(/[Óó]/,"o")
    self.escaped_name = self.escaped_name.gsub(/[Úú]/,"u")
  end
end