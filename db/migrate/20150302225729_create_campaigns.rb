class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
