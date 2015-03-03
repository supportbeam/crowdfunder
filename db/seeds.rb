# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Campaign.create!(
  title: "Campaign 1",
  description: "Description 1",
  funding_goal: 500,
  start_date: 2015-03-20,
  end_date: 2015-04-20
  )