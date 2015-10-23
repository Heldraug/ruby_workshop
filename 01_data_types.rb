require 'awesome_print'

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

ap string
ap fixnum
ap float
puts

ap "Regex"
ap "Valid" if regex =~ 'A01164096'
ap "Invalid" if regex !~ 'B01164096'
puts

ap "Array"
ap array
puts

ap "Hash"
ap hash
