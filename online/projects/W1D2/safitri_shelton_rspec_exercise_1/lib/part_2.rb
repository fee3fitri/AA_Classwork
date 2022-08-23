VOWELS = "aeiou"
ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def hipsterfy(word)
    vowels = word.split.select { |char| VOWELS.include?(char) }
end

def vowel_counts(sentence)
    count = Hash.new(0)

    sentence.downcase.each_char do |char|
        count[char] += 1 if VOWELS.include?(char)
    end

    count
end

def caesar_cipher(message, n)
    new_message = ""

    message.each_char.with_index do |char, i|
        if ALPHABET.include?(char)
            new_message += ALPHABET[(ALPHABET.index(char) + n) % 26]
        else
            new_message += char
        end
    end

    new_message
end