def partition(arr, num)
    new_arr = [[],[]]
    arr.each do |el|
        if el < num
            new_arr[0] << el
        else
            new_arr[1] << el
        end
    end
    new_arr
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v }
    hash2.each { |k, v| new_hash[k] = v }
    new_hash
end


def censored(word)
    vowels = 'aeiou'
    new_word = ''
    word.each_char.with_index do |char, i|
        if vowels.include?(char.downcase)
            new_word += '*'
        else
            new_word += char
        end
    end
    new_word
end

def censor(sent, arr)
    words = sent.split
    censored_words = []
    words.each.with_index do |word, i|
       if arr.any?(word.downcase)
        censored_words << censored(words[i])
       else
        censored_words << words[i]
       end
    end
    censored_words.join(' ')
end

def power_of_two?(num)
    (0...num).each do |n|
        return true if 2**n == num
    end
    false
end

