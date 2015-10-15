string = "This is a string"
fixnum = 1
float = 1.0
regex = /A\d+/

array = Array.new
array[0] = 'element 1'
array[1] = 'element 2'

hash = Hash.new()
hash[:key_a] = 1
hash[:key_b] = 2

puts string
puts fixnum
puts float
puts
puts "Regex"
puts "Valid" if regex =~ 'A01164096'
puts "Invalid" if regex !~ 'B01164096'
puts
puts "Array"
puts array
puts
puts "Hash"
puts hash
