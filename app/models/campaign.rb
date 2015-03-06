class Campaign < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
	belongs_to :user
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  validate :ensure_dates

  def days_left
    days = (end_date - Date.today).to_i 

    if days < 0
      0
    else
      days.to_i
    end
  end

  private
  def ensure_dates
    if start_date > end_date
       errors.add(:end_date, "should not end before it starts")
    end

    if start_date <= Time.now
      errors.add(:start_date, "should not start in the past")
    end

    if end_date <= Time.now
      errors.add(:end_date, "should not end in the past")
    end
  end
end
