count = 0 

while count < 3
  string = gets.chomp
  if string == “BYE”
    count += 1
    puts “”
  elsif string == string.upcase
  	count = 0
  	puts “No, not since” + (1930 + rand(21)).to_s
  else
  	count = 0
    puts “Huh, speak up”
  end
end