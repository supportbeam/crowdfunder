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

end
