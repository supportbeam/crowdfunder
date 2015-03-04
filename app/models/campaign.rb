class Campaign < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
end
