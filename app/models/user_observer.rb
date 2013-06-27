class UserObserver < ActiveRecord::Observer
	
	def after_create(user)
		UserMailer.sign_up(user).deliver
	end
end
