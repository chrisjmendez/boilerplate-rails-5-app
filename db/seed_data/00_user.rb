User.delete_all

# Admin - Confirmed E-mail
email = "a@maildrop.cc"
password = "password"
User.populate(1) do |u|
  u.email         = email
  u.encrypted_password = BCrypt::Password.create(password)
  u.sign_in_count = 0
  u.confirmed_at = Time.now
end

# Admin - Non-Confirmed E-mail
email = "a@mailinator.com"
password = "password"
User.populate(1) do |u|
  u.email         = email
  u.encrypted_password = BCrypt::Password.create(password)
  u.sign_in_count = 0
end

# Fake Accounts
User.populate(3) do |u|
  u.email = Faker::Internet.email
  u.encrypted_password = BCrypt::Password.create( Faker::Internet.password(8, 20, true) )  
  u.sign_in_count = 0
end

