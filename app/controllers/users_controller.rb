class UsersController < Clearance::UsersController
	def new
		@user = User.new
	end

	def create

		@user = user_from_params
		if @user.save
			flash[:success] = "You have successfully create new user"
			redirect_to user_path(@user.id)
		else
			flash[:error] = "User was not saved"
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_from_params
		avatar = user_params.delete(:avatar)
		email = user_params.delete(:email)
		password = user_params.delete(:password)
		first_name = user_params.delete(:first_name)
		
		Clearance.configuration.user_model.new(user_params).tap do |user|
		  user.email = email
		  user.password = password
		  user.first_name = first_name
		  user.avatar = avatar
		end
	end	

end