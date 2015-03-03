class Pledge < ActiveRecord::Base
  belongs_to :user
	belongs_to :campaign
  belongs_to :reward
end
