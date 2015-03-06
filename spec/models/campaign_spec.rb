require 'rails_helper'

describe Campaign do
	let!(:campaign) {create(:campaign)}

	describe "#days_left" do
    it "should return not return a negative number" do
      expect(campaign.days_left).to be >= 0
    end
  end
end
