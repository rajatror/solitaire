class Cipher 
  def initialize(keystream)
    @keystream = keystream
    @char_hash = Hash[(65..90).map { |i| [i.char, i] }] 
  end

# convert input into 5 char words
  def sanitize
    puts "Input string to be ciphered"
    string_array = gets.chomp.gsub!(/[^A-Za-z]+/,'').upcase!.scan(/.{1,5}/)
  
    string_array.map! do |string|
      string.ljust(5,'X')
    end
 
    return string_array 
  end

  def process(s_arr)
   keystream_num = convert_to_num(@keystream)
   input_num_arr = convert_to_num(s_arr)
   

  end

  def convert_to_num(s_arr)
    num_array = s_arr.map { |c| (@char_hash[c]) }
    num_array.map! { |i| i - 64 }
  end


end
