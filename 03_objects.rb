require 'awesome_print'

ap('This is a string'.reverse)
ap(1.odd?)
ap(1.25.denominator)
ap(/A\d+/.match 'A01164096')
ap([1, 2, 3, 4, 5].shuffle)
ap({key_a: 1, key_b: 2}.merge({key_b: 2.5, key_c: 3}))
