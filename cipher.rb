puts "Input string to be ciphered"
string_array = gets.chomp.gsub!(/[^A-Za-z]+/,'').upcase!.scan(/.{1,5}/)
string_array.map! do |string|
string.ljust(5,'X')
end
puts "The array is: " + string_array