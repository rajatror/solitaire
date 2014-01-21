class Cipher 
  def initialize(keystream)
    @keystream = keystream
    #below creates a hash of A-Z as keys and 65-90 as values 
    @char_hash = Hash[(65..90).map { |i| [i.chr, i] }] 
  end

  def sanitize
    puts "Input string to be ciphered"
    string_array = gets.chomp.gsub!(/[^A-Za-z]+/,'').upcase!.scan(/.{1,5}/)
  
    string_array.map! do |string|
      string.ljust(5,'X')
    end
 
    return string_array 
  end

  def process(s_arr)
   keystream_num_arr = convert_to_num(@keystream)
   input_num_arr = convert_to_num(s_arr)
   result = [input_num_arr, keystream_num_arr].transpose.map { |x| x.reduce(:+) % 26}

  end

  def convert_to_num(s_arr)
    num_array = s_arr.map { |c| (@char_hash[c]) }
    num_array.map! { |i| i - 64 }
  end


end
