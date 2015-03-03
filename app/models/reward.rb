class Reward < ActiveRecord::Base
	has_many :pledge
  belongs_to :campaign
  
end
