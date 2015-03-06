class Campaign < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
	belongs_to :user
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  def days_available
    (end_date - start_date).to_i
  end

  def days_left
    days = (end_date - Date.today).to_i 
    if days < 0
      0
    else
      days.to_i
    end
  end

end
