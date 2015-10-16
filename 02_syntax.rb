class Badgers
  attr_accessor :count

  def initialize
    @count = 1
  end

  def count_badgers
    puts 'Counting badgers...'
    (1..@count).each do |n|
      if n % 5 == 0
        puts "Mushroom mushroom!"
      else
        puts "#{n} Badger"
      end
    end
  end
end

b = Badgers.new

puts "Current number of badgers: #{b.count}"
b.count_badgers
puts

b.count = 10
puts "Current number of badgers: #{b.count}"
b.count_badgers
