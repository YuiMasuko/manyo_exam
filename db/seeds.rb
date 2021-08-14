1.times do |n|
  name = Faker::Artist.name
  email = Faker::Internet.email
  password_digest = "password"
  User.create!(name: name, email: email, password_digest: "password")
end
