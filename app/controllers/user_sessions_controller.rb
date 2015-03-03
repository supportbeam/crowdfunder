class UserSessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
      auto_login(@user)
  		redirect_back_or_to(:signup, notice: "Login successful")
  	else
  		flash.new[:alert] = "Login failed"
  		render action: "new"
  	end
  end

  def destroy
  	logout
  	redirect_to(:users, notice: "Logged out!")
  end
end