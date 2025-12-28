users=[
  {
    username: "harsh",
    password: "password"
  },
  {
    username: "shivam",
    password: "password1"
  },
  {
    username: "ankit",
    password: "password2"
  },
]

def auth_user(username , password , users)
    
end

puts "welcome to authenticator"
25.times {print "-"}
puts 

attempts=1

while attempts < 4
  print "username: "
  username=gets.chomp
  print "password: "
  password=gets.chomp

  users.each do |user|
    if user[:username]==username && user[:password]==password
      puts user
      break
     
    end
  
  end

  puts "credentials are not correct"

  puts "press n to quit or any other key to continue"
  input=gets.chomp.downcase
  if input=='n'
    break
  end



  attempts+=1


end

puts "you have exceeded the attempts"