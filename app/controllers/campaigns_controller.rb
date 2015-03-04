class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
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

  def new
    @campaign = Campaign.new
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

  private
  def campaign_params
    params.require(:campaign).permit(:title, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:description, :pledge_amount, :_destroy])
  end

end
