class UserUtil

  def initialize
    populate
  end  
  
  def populate
    
    email = "a@maildrop.cc"
    password = "password"
    
    User.delete_all
    
    #This is specifically designed 
    User.populate(1) do |u|
      u.email         = email
      u.encrypted_password = BCrypt::Password.create(password)  
      
      u.sign_in_count = 0
      u.gender        = ["m", "f", "o"]
      u.locale        = Faker::Config.locale #= 'en-US'
      u.dob           = Faker::Date.between(Date.parse('1st Jan 1920'), Date.parse('1st Jan 1995')) 

      u.first_name    = Faker::Name.first_name
      u.last_name     = Faker::Name.last_name
      u.full_name     = u.first_name + " " + u.last_name
      
      u.timezone      = [-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8]
      
      u.phone_mobile  = Faker::PhoneNumber.cell_phone
      u.phone_other   = Faker::PhoneNumber.phone_number
    end          
end

UserUtil.new