# Define your methods here. 
VOWEL = 'aeiou'

def first_vowel?(word)
    VOWEL.include?(word[0])
end

def last_vowel?(word)
    VOWEL.include?(word[-1])
end

def first_letter_vowel_count(sent)
    count = 0
    words = sent.downcase.split(' ')
    words.each { |word| count += 1 if first_vowel?(word) } 
    count
end

def count_true(arr, prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) } 
    count
end

def procformation(arr, prc1, prc2, prc3)
    results = []
    arr.each do |el|
        if prc1.call(el)
            results << prc2.call(el)
        else
            results << prc3.call(el)
        end
    end
    results
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(sentence)
    new_sent = []

    sentence.split.each do |word|
        if (!first_vowel?(word)) && (!last_vowel?(word))
            new_sent << word.reverse
        else
            new_sent << word
        end
    end

    new_sent.join(' ')
end

def hash_missing_keys(hash, *args)
    arr = args.select { |arg| !hash.has_key?(arg) } 
    arr
end