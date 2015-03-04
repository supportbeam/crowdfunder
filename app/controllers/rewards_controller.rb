class RewardsController < ApplicationController
	before_filter :load_campaign

	def show
		@reward = Reward.find(params[:id])
	end

	def new
		@reward = Reward.new
	end

	def create
		@rewards = @campaign.rewards.build(reward_params)
		if @reward.save
      redirect_to campaigns_url, notice: "Reward successfully made!"
    else
      flash.now[:alert] = "Error creating Reward!"
      render 'campaigns/show'
    end
	end

	def edit
	  @reward = Reward.find(params[:id])
	end

	def update
	  if @campaign.update_attributes(params[:campaign])
	    redirect_to reward_path(@reward)
	  else
	    render :edit
	  end
	end

	def destroy
	  @reward = Reward.find(params[:id])
	  @reward.destroy
	  redirect_to rewards_path
	end

	private
	def reward_params
	  params.require(:reward).permit(:description, :pledge_amount)
	end

	def load_compaign
		@campaign = Campaign.find(params[:campaign_id])
	end
end