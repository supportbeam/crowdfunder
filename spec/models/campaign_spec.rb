require 'rails_helper'

RSpec.Campaign do
  describe "Days left" do
    let(:campaign) {FactoryGirl.create(:campaign)}

    it "Should return 0 if end_date has passed" do
      expect(campaign.days_available).to eq(0)
  end
end
