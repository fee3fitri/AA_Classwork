def palindrome?(str)
    backwards = ''
    i = 0
    while i < str.length
        backwards = str[i] + backwards
        i += 1
    end
    backwards == str
end

def substrings(str)
    arr = []
    (0...str.length).each do |start_i|
        (start_i...str.length).each do |end_i|
            arr << str[start_i..end_i]
        end
    end
    arr
end


def palindrome_substrings(str)
    substrings(str).select { |word| palindrome?(word) && word.length > 1 }
end