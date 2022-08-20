def zip(*arr)
    arr.transpose
end


def prizz_proc(arr, prc1, prc2)
    arr.select { |n| (prc1.call(n) || prc2.call(n)) and !(prc1.call(n) && prc2.call(n)) }
end


def zany_zip(*arrs)
    max = arrs.map { |arr| arr.length }.max
    shorts = arrs.select { |arr| arr.length < max }
    new_arrs = []
    arrs.each_with_index do |arr, i|
        num = max - arr.length
        if arr.length < max
            num.times { arr << nil }
        end
    end
    arrs.transpose
end


def maximum(arr, &prc)
    results = arr.map { |el| prc.call(el) }
    max = results.max
    count = results.count(max)
    if count == 1
        arr.each  { |el| return el if prc.call(el) == max }
    else
        return arr[-1]
    end
end


def my_group_by(arr, &prc)
    hash = Hash.new { |k, v| }
    arr.each do |el|
        result = prc.call(el)
        hash[result] = el
    end
    hash
end


def max_tie_breaker(arr, prc, &blc)
    results1 = arr.map { |el| blc.call(el) }
    max1 = results1.max
    count1 = results1.count(max1)
    if count1 == 1
        arr.each  { |el| return el if blc.call(el) == max1 }
    elsif count1 > 1
        arr.each do |el|
            results2 = arr.map { |el| prc.call(el) } 
            max2 = results2.max
            count2 = results2.count(max2)
            return arr[arr.index(max2)] if count2 == 1
        end
    return arr[0]
    end
end


VOWELS = 'aeiou'

def silly_syllables(sent)
    sent.
        split.
        map { |word| removed(word) }.
        join(' ')
end

def more_than_one_vowels?(word)
    count = 0
    word.each_char { |char| count += 1 if VOWELS.include?(char) }
    return count >= 2
end

def first_last_vowel(word)
    hash = {}
    arr = []
    word.each_char.with_index do |char, i|
        arr << i if VOWELS.include?(char)
    end
    hash[:first] = arr[0]
    hash[:last] = arr[-1]
    hash
end

def removed(word)
    index = first_last_vowel(word)
    first = index[:first]
    last = index[:last]
    return word[first..last] if more_than_one_vowels?(word)
    word
end