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

		respond_to do |format|
			if @pledge.save
				format.html { redirect_to campaign_path(@pledge.campaign_id), notice: "Pledge saved, dude!" }
	        format.js {}
			else
				format.html { render campaign_path(@pledge.campaign_id), flash.now[:alert] = "Couldn't save pledge. Sorry man..." }
				format.js {}
			end
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:donation_amount, :campaign_id, :reward_id)
	end

end
