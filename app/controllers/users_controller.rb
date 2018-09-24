class UsersController < Clearance::UsersController
	def new
	end

	def show
	end

	private
	def user_from_params
		email = user_params.delete(:email)
		password = user_params.delete(:password)
		first_name = user_params.delete(:first_name)
		
		Clearance.configuration.user_model.new(user_params).tap do |user|
		  user.email = email
		  user.password = password
		  user.first_name = first_name
		end
	end	

end