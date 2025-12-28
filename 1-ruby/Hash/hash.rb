sample_hash={
  'a' =>1,
  'b' => 2,
  'c'=>3
}

my_detail={
  'name' =>"harsh",
  'favcolor' => "blue",
}

p sample_hash['a']

another_hash={  #here a is symbol not a string
  a:1,
  b:2,
  c:3
}

p another_hash[:a]

p sample_hash.keys
p sample_hash.values



sample_hash.each do |key , value|
  puts "key is #{key} and val is #{value}"
end  


# // add element to hash 
another_hash[:e]="apple"
p another_hash

string_hash=another_hash.select {|k,v| v.is_a?(String)}

p string_hash

#delete from hash
p "---------------------------"
another_hash.each {|k, v| another_hash.delete(k) if v.is_a?(String)}
p another_hash