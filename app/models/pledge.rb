class Pledge < ActiveRecord::Base
  belongs_to :user
	belongs_to :campaign
  belongs_to :reward

  def self.user_total(user)
  	total = 0
  	Pledge.where(user: user).each do |pledge|
  		total += pledge.donation_amount
  	end
  	total
  end

end
