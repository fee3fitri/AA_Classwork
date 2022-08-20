def reverser(str, &blk)
    blk.call(str.reverse)
end

def word_changer(sentence, &blk)
    words = sentence.split
    new_words = words.map { |word| blk.call(word) }
    new_words.join(" ")
end

def greater_proc_value(n, prc_1, prc_2)
    if prc_1.call(n) > prc_2.call(n)
        return prc_1.call(n)
    else
        return prc_2.call(n)
    end
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |el| prc_1.call(el) && prc_2.call(el) }
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |el, i|
        if i.even?
            new_arr << prc_1.call(el)
        elsif
            new_arr << prc_2.call(el)
        end
    end
    new_arr
end