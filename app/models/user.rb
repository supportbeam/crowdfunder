class User < ActiveRecord::Base
	has_many :pledges
	has_many :backers, through: :pledges, class_name: 'Campaign'
	has_many :owners, class_name: 'Campaign'


  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def pledge_total
  	total = 0
  	Pledge.where(user: self).each do |pledge|
  		total += pledge.donation_amount
  	end
  	total
  end

  def campaigns_pledged_to
		def title(id)
			Campaign.find(id).title
		end
  	totals = {}
		campaigns_pledged_to = self.pledges.map{|p| p.campaign_id}.uniq
		campaigns_pledged_to.each do |id|
  		# totals[title(id)] = 0
  		totals[id] = 0
			self.pledges.where(campaign_id: id).each do |pledge|
				# totals[title(id)] += pledge.donation_amount
				totals[id] += pledge.donation_amount
			end
		end
		totals
  end
end
