require 'byebug'
require 'benchmark'



arr = []
20000.times do
  arr.push(rand(100))
end

def deleter(array)
  while array[1]
    array.delete_at(1)
  end
end


# Benchmark.bm do |bm|
#     puts "Time test"
#     bm.report do
#       deleter(arr)
#     end
# end



# class Emerald
#   attr_reader :value
#   attr_accessor :next
#   attr_accessor :prev

#   def initialize(value)
#     @value = value
#     @next = nil
#     @prev = nil
#   end
# end


# class Diamond
#   # attr_accessor :value

#   def initialize(emerald)
#     @first_emerald = emerald
#   end

#   def add(emerald)
#     last_emerald = @first_emerald

#     while last.emerald.next != nil
#       last_emerald = last_emerald.next
#     end

#     last_emerald.next = emerald
#     emerald.prev = last_emerald
#   end

#   def remove
#     third emerald = @first_emerald.next.next

#     if third_emerald
#       @first_emerald.next = third_emerald
#       third_emerald.prev = @first_emerald
#     else

#   end
# end



class Emerald
  attr_accessor :next, :prev

  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end
end

class Diamond
  attr_reader :first_emerald

  def initialize(emerald)
    @first_emerald = emerald
  end

  def add_emerald(emerald)
    last_emerald = @first_emerald

    while last_emerald.next != nil
      last_emerald = last_emerald.next
    end

    last_emerald.next = emerald
    emerald.prev = last_emerald
  end

  def remove_emerald
    third_emerald = @first_emerald.next.next

    if third_emerald
      @first_emerald.next = third_emerald
      third_emerald.prev = @first_emerald
    else
      @first_emerald.next = nil
    end
  end
end


first_emerald = Emerald.new(1)
diamond = Diamond.new(first_emerald)
19999.times { diamond.add_emerald(Emerald.new(1)) }

arr = (1..20000).to_a

Benchmark.bm do |bm|
  puts "Removal of elements from array"
  bm.report do
    while (arr.size > 1) do
      arr.slice!(1, 1)
    end
  end

  puts "Removal of Emeralds from Diamond"
  bm.report do
    # === Insert your code to remove Emeralds from Diamonds here ===
    while (diamond.first_emerald.next != nil)
      diamond.remove_emerald
    end
  end
end




# byebug

# puts 'byebug'






