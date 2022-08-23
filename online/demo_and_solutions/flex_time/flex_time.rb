# Define a method, merge_two_nums(num_1, num_2, &prc), that takes in two numbers and an optional block. 
# It should return the result of the two numbers when passed into the block. 
# If no block is passed in, the method should return the sum of the two numbers.

def merge_two_nums(num_1, num_2, &prc)
  p prc
  # prc = prc || Proc.new { |num_1, num_2| num_1 + num_2 }
  prc ||= Proc.new { |num_1, num_2| num_1 + num_2 }
  prc.call(num_1, num_2)
end


# p merge_two_nums(5, 9) { |num_1, num_2| num_1 * num_2 }   # ==> 45
# p merge_two_nums(-6, 2) { |num_1, num_2| num_2 - num_1 }  # ==> -8
# p merge_two_nums(10, 14)  # ==> 24



# Spaceship operator
# a = 4
# b = 12
# c = 12
# a <=> b 
# b <=> a 
# b <=> c

def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true
    (0...arr.length - 1).each do |i|
      if (arr[i] <=> arr[i+1]) == 1
        arr[i+1], arr[i] = arr[i], arr[i+1]
        sorted = false
      end
    end
  end

  arr
end

p bubble_sort([4, 2, 6, 1, -7, 14, 0])

# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
# 
# Solve this recursively!


def sum_array(array)
  return 0 if array.empty?
  array[0] + sum_array(array[1..-1])
end

# 4 + sum_array([10, -1, 2])
# 4 + 10 + sum_array([-1, 2])
# 4 + 10 - 1 + sum_array([2])
# 4 + 10 - 1 + 2 + sum_array([])
# 4 + 10 - 1 + 2 + 0

# Examples:
#
# p sum_array([])             # => 0
# p sum_array([5])            # => 5
# p sum_array([5, 2])         # => 7
# p sum_array([4, 10, -1, 2]) # => 15


# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.

#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]

def flatten(data)

  return [data] unless data.is_a?(Array)

  flattened_arr = []

  data.each { |el| flattened_arr += flatten(el) }

  flattened_arr

end


p flatten('base case')  # => [ 'base case' ]
#
array_1 = [1, 2, 3, 4]
p flatten(array_1)      # => [ 1, 2, 3, 4 ]
#
array_2 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
p flatten(array_2)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]
#
array_3 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
p flatten(array_3)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]


