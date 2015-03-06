FactoryGirl.define do
  factory :campaign do
    title {Faker::Name.name}
    funding_goal Faker::Number.number(5)
    start_date Time.now
    end_date Faker::Date.between(Time.now.tomorrow, 14.days.from_now)
  end
end
