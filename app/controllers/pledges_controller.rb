class PledgesController < ApplicationController
	def find_pledge
		Pledge.find(params[:id])
	end

	def show
		@pledge = find_pledge
	end

	def create
		@pledge = Pledge.new(pledge_params)
		@pledge.user = current_user

		if @pledge.save
			redirect_to campaign_path(@pledge.campaign_id), notice: "Pledge saved, dude!"
		else
			flash.now[:alert] = "Couldn't save pledge. Sorry man..."
			render campaign_path(@pledge.campaign_id)
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:donation_amount, :campaign_id, :reward_id)
	end

end
