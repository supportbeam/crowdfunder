require 'rails_helper'

describe Campaign do
  describe "days left" do
    let!(:campaign) {FactoryGirl.create(:campaign)}

    it "should return 0 if end_date has passed" do
      expect(campaign.days_available).to eq(0)
    end

    it "should return not return a negative number" do
      expect(campaign.days_available).to be > 0
    end

    

  end
end
