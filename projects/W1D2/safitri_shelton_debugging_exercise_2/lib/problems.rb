# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(n)
    return false if n < 2
    (2...n).each do |factor|
        if n % factor == 0
            return false
        end
    end
    true
end

def largest_prime_factor(n)
    primes = (2..n).select { |factor| prime?(factor) && n % factor == 0}
    primes[-1]
end

def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |char|
        count[char] += 1
    end
    !(count.values.any? { |v| v > 1})
end
