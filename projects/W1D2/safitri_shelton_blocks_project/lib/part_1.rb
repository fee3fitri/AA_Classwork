def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |el| el.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    new_word = ''
    
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_word += word[1..i] + 'b' + char
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end