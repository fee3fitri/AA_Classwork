# Define your methods here.
def string_map!(str, &blc)
    str.each_char.with_index { |char, i| str[i] = blc.call(char) }
    str
end

def three?(arr, &blc)
    true_el = arr.select { |el| blc.call(el) }
    true_el.length == 3
end

def nand_select(arr, prc1, prc2)
    arr.reject { |el| prc1.call(el) && prc2.call(el) }
end

def hash_of_array_sum(hash)
    sums = 0
    hash.each { |k, v| sums += v.sum } 
    sums
end

def abbreviate(sent)
    words = sent.split
    new_words = []
    words.each do |word|
        if word.length > 4
            new_words << removed_vowels(word)
        else
            new_words << word
        end
    end
    new_words.join(' ')
end

def removed_vowels(word)
    vowels = 'aeiou'
    removed = ''
    word.each_char { |char| removed += char if !vowels.include?(char.downcase) }
    removed
end

def hash_selector(hash, *args)
    new_hash = {}
    return hash if args.length == 0
    args.each { |arg| new_hash[arg] = hash[arg] }
    new_hash
end