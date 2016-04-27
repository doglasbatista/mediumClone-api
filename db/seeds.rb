User.create(
  username: 'morcegao'
  email: 'bruce@wayne.corp'
  password: '123123123'
  password_confirmation: '123123123'
)

10.times { Story.create(title: Faker::Name.title, body: Faker::Lorem.sentence(10), user_id: 1) }