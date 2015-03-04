class PledgesController < ApplicationController

	def index
		@pledges = Pledge.all
	end

	def show
		@pledge = Pledge.find(params[:id])
	end

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new(pledge_params)
		if @pledge.save
			redirect_to campaign_path(@pledge.campaign_id), notice: "Pledge saved, dude!"
		else
			flash.now[:alert] = "Couldn't save pledge. Sorry man..."
			render campaign_path(@pledge.campaign_id)
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def pledge_params
		params.require(:pledge).permit(:donation_amount)
	end

end
