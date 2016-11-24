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

    end          
  end
end

UserUtil.new