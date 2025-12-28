module Crud

  require 'bcrypt'

  # users = [
  #           { username: "mashrur", password: "password1" },
  #           { username: "jack", password: "password2" },
  #           { username: "arya", password: "password3" },
  #           { username: "jonshow", password: "password4" },
  #           { username: "heisenberg", password: "password5" }
  #         ]

  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  # puts create_secure_users(users)

  def self.authenticate_user(username , password , list_of_users)
      list_of_users.each do |user_record|
        if user_record[:user_record]==username && verify_hash_digest(user_record[:password]==password)
          return user_record
        end
      end  
      "Credential were wrong"
  end

    
end

