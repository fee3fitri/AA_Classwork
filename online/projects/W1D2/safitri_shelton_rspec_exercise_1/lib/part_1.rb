def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, n)
    str * n
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ")
    new_words = []
    
    words.each_with_index do |word, i|
        if i.even?
            new_words << word.upcase
        else
            new_words << word.downcase
        end
    end
    
    new_words.join(" ")
end