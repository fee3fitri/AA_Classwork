def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

def nth_prime(num)
    primes = []
    i = 0
    while primes.length < num
        primes << i if is_prime?(i)
        i += 1
    end
    primes[num - 1]
end

def prime_range(min, max)
    (min..max).select { |n| is_prime?(n) }
end