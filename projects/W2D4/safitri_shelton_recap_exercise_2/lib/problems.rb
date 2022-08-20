# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    max_num = num_1 * num_2
    common_mult = (num_1..max_num).select do |n|
        (n % num_1 == 0) and (n % num_2 == 0)
    end

    common_mult[0]
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)
    
    (0...str.length - 1).each do |i|
        bigram = str[i] + str[i + 1]
        count[bigram] += 1
    end
    
    val = count.each_value.max
    count.key(val)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each { |k, v| new_hash[v] = k }
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        start_i = 0
        len = self.length

        (start_i...len).each do |i|
            (i...len).each do |j|
                count += 1 if self[i] + self[j] == num
            end
            start_i += 1
        end

        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc = Proc.new (0...self.length).each do |i|
            
        end
    end
end
