class AddColumnToCampaignForUserId < ActiveRecord::Migration
  def change
    add_reference :campaigns, :user, references: :users, index: true
  end
end
