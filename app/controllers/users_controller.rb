class UsersController < Clearance::UsersController
	private
	def user_from_params
		email = user_params.delete(:email)
		password = user_params.delete(:password)
		first_name = user_params.delete(:first_name)
		address = user_params.delete(:address)


		Clearance.configuration.user_model.new(user_params).tap do |user|
		  user.email = email
		  user.password = password
		  user.first_name = first_name
		  user.address = address
		end
	end	

end