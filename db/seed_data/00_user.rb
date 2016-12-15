User.delete_all

# Admin - Confirmed E-mail
password = "password"

admin    = "a@maildrop.cc"
User.create(email: admin, password: password, password_confirmation: password, sign_in_count: 0, confirmed_at: Time.now)

user     = "a@mailinator.com"
User.create(email: user, password: password, password_confirmation: password, sign_in_count: 0, confirmed_at: Time.now)


5.times do
  User.create(email: Faker::Internet.email, password: password, password_confirmation: password, sign_in_count: 1, confirmed_at: Time.now)
end
