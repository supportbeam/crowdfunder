class RewardsController < ApplicationController
	before_filter :load_campaign

	def show
		@reward = Reward.find(params[:id])
	end

	def new
		@reward = Reward.new
	end

	def create
		@reward = @campaign.rewards.build(reward_params)
		if @reward.save
      redirect_to campaigns_url, notice: "Reward successfully made!"
    else
      flash.new[:alert] = "Error creating Reward!"
      render 'campaigns/show'
    end
	end

	def edit
	  @reward = Reward.find(params[:id])
	end

	def update
	  @reward = Reward.find(params[:id])
	  if @reward.update_attributes(reward_params)
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