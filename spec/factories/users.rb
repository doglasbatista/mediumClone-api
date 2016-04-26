FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password '123123123'
    password_confirmation '123123123'
  end

  factory :batman, class: 'User' do
    username 'morcegao'
    email 'bruce@wayne.corp'
    password '123123123'
    password_confirmation '123123123'
  end
end
