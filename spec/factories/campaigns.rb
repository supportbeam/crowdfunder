FactoryGirl.define do
  factory :campaign do
    title {Faker::Name.name}
    funding_amount {Faker::Number.number(5)}
    start_date {Faker::Date.backward(4)}
    end_date {Faker::Date.between(Date.today, 14.days.from_now)}
  end

end
