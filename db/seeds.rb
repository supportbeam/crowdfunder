# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Campaign.destroy_all

100.times do
	Campaign.create({
		title: Faker::Company.name,
		description: Faker::Company.bs << " " << Faker::Company.catch_phrase,
		funding_goal: Faker::Number.number(6),
		start_date: Faker::Date.between(Date.today, 25.days.from_now), 
		end_date: Faker::Date.between(25.days.from_now, 50.days.from_now)
	})
end

4.times do
	User.create!({
		email: Faker::Internet.safe_email(),
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: "password",
		password_confirmation: "password"
	})
end