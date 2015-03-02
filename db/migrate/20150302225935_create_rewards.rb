class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :description
      t.integer :pledge_amount
      t.belongs_to :campaign, index: true

      t.timestamps null: false
    end
    add_foreign_key :rewards, :campaigns
  end
end
