# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user do
    email                 "factory@maildrop.cc"
    password              "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
end
