User.create! name: "phuong", email: "thaiphuong1@gmail.com",
  password: "123123", password_confirmation: "123123",
  avatar: "avatar.png", phone: "03434343", role: 2

User.create! name: "User 2", email: "thaiphuong2@gmail.com",
  password: "123123", password_confirmation: "123123",
  avatar: "avatar.png", phone: "97434343", role: 1

20.times do |n|
  _name = "phuong"
  _pass = "123123"
  _email = "example-#{n+1}@railstutorial.org"
  User.create! name: _name, email: _email,
    password: _pass, password_confirmation: _pass,
    avatar: "avatar.png", phone: "3493473743", role: 0
end
