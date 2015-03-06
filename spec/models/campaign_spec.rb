require 'rails_helper'

describe Campaign do
	let(:campaign) {build(:campaign)}

	describe "#ensure_dates" do
    it "should not be valid date" do
    	campaign.end_date = 28.days.ago

    	campaign.valid?

  		expect(campaign.errors.full_messages).to eq(["End date should not end before it starts", "End date should not end in the past", "Start date should not start in the past"])
    end
  end

	describe "#days_left" do
    it "should return not return a negative number" do
      expect(campaign.days_left).to be >= 0
    end
  end
end
