class Campaign < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
	belongs_to :user

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true


  def total
    pledges.map {|p| p.donation_amount}.reduce(:+)
  end
end
