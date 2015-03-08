class CampaignsController < ApplicationController
	before_filter :load_campaign, except: [:index, :new, :create, :make_pledge]

  def index
    @campaigns = Campaign.order("campaigns.title").page(params[:page])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_url, notice: "Campaign successfully made!"
    else
      flash.new[:alert] = "Error creating Campaign!"
      render :new
    end
  end

  def make_pledge
    reward = Reward.find(params[:reward_id])
    @pledge = reward.campaign.pledges.build(user: current_user, donation_amount: reward.pledge_amount, reward: reward)

    @pledge.save
  end

  def new
    @campaign = Campaign.new
  end

  def show
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render('edit')
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:description, :pledge_amount, :_destroy, :id])
  end

	def load_campaign
		@campaign = Campaign.find(params[:id])
	end

end
