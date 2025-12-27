class Student
  attr_accessor :firstname, :lastname, :email ,:password  # automically give me both getter and setter
  attr_reader :username  #only allow getter not setter for this

  @firstname
  @lastname
  @email
  @username
  @password

  def initialize(firstname , lastname , email , password)
    @firstname=firstname   #similar to constructor
    @lastname=lastname
    @email=email
    @password=password
  end
  

  # def first_name=(name)   #setter
  #   @firstname=name
  # end

  # def first_name  #getter 
  #   @firstname
  # end

  def to_s
    puts "first name is #{@firstname}"
  end

end

# harsh=Student.new
# harsh.firstname="shivam"
# harsh.email="harsh@mail.com"
# harsh.lastname="singh"
# p harsh

shivam=Student.new("shivam" , "aloo" , "kalu" , "namo")
p shivam


