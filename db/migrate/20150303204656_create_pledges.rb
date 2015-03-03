class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :donation_amount,       null: false
      t.belongs_to :user, index: true
      t.belongs_to :campaign, index: true
      t.belongs_to :reward, index: true

      t.timestamps null: false
    end
    add_foreign_key :pledges, :rewards
    add_foreign_key :pledges, :users
    add_foreign_key :pledges, :campaigns
  end
end
