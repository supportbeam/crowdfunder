class UserSessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(campaigns_url, notice: "Login successful")
  	else
  		flash.new[:alert] = "Login failed"
  		render action: "new"
  	end
  end

  def destroy
  	logout
  	redirect_to(campaigns_url, notice: "Logged out!")
  end
end
