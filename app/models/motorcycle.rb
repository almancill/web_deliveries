class Motorcycle < ActiveRecord::Base
	has_many :deliveries
	has_many :amounts

	default_scope{order('name ASC')}

	validates :name, :messenger_name, presence: true

	before_validation :format_attributes

	def format_attributes
		self.name = self.name.strip.squeeze(" ").titleize
		self.messenger_name = self.messenger_name.squeeze(" ").titleize
	end
end
