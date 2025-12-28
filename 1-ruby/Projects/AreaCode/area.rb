dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}


def get_city_name(somehash)
  somehash.keys
end

def get_area_code(somehash , key)
  somehash[key]
end


loop do

  puts "Do you want to lookup an area code based on city? (Y/N)"
  answer=gets.chomp.downcase
  break if answer!='y'
  puts "which city do you want area code for"
  puts get_city_name(dial_book)
  puts "enter your selection"
  prompt=gets.chomp
  if dial_book.include?(prompt) 
    # do something
    puts "area code for #{prompt} is #{get_area_code(dial_book ,prompt)}"
  else
    puts "you enter wrong city"
  end

end