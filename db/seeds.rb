1.times do |n|
  name = Faker::Artist.name
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation, admin: true)
end

Label.create([
  { name: 'ラベルA' },
  { name: 'ラベルB' },
  { name: 'ラベルC' },
  { name: 'ラベルD' },
  { name: 'ラベルE' }
])
