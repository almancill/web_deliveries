class User < ActiveRecord::Base
  authenticates_with_sorcery!

  default_scope {order('id ASC')}

  #Accessors (Virtual attributes)
  attr_accessor :password, :password_confirmation

  #Validations
  validates :name, :username, :email, presence: true, uniqueness: true 
  validates :username, format: {with: /^[\w\d-]*$/}
  validates :email, format: {with: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/}

  #On create validations
  validates :password, presence:true, on: :create

  #On update validations
  validates :password, confirmation: true, on: :update if :password 

  #Callbacks
  before_save :format_attributes
  before_validation :random_password, on: :create

  #Methods
  private
  def format_attributes
    self.username.strip.downcase!
    self.email.strip.downcase!
    self.name = self.name.strip.titleize.squeeze(" ")
  end

  def random_password
    #self.password = SecureRandom.hex(5) if User.count >= 1
    self.password = '123456'
  end
end