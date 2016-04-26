FactoryGirl.define do
  factory :story do
    title Faker::Name.title
    body Faker::Lorem.sentence(10)
  end
end
