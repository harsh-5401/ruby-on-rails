arr=[1,2,3,8,6,4]
p arr
# puts
puts arr[0]
puts arr.last



x=1..100 #range from 1 to 100
puts x.class
y=x.to_a  #convert to array
p y

z= (1..10).to_a
p z
p z.reverse!  # use not(!) at end reverse original array 
p z

z<<10   #add it to the end of array

#add to end
z.unshift("harsh")
z.append("harsh2")

#for unique
z.uniq

#check include
puts z.include?("harsh")

#remove from end and save it
b=z.pop
z.push("shiv")  #add to end of array

z.join(",")  # "1,2,3,4" 

# z.split("-") #split by - and convert it to array


p "--------------------"


#iterators 

a=[1,2,3,8,6,4]

for i in a
  p i
end

p "--------------------"


# iteartror 2
a.each {|food| print "#{food+10} " }

p "--------------------"
num=(1..100).to_a.shuffle

odd=num.select {|number| number.odd?}

p odd

puts num.methods