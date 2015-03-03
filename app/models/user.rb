class User < ActiveRecord::Base
	has_many :pledges
	has_many :owned_projects, class_name: 'Campaign'
	has_many :backed_projects, throught: pledges, class_name: 'Campaign'

  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
