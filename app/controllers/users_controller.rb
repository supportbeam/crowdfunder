class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
		# binding.pry
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			auto_login(@user)
  		redirect_back_or_to(campaigns_url, notice: "Created!")
		else
			render "new"
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
	end

end
