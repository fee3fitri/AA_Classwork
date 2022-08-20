class Hangman
  attr_reader :guess_word, 
    :attempted_chars, 
    :remaining_incorrect_guesses


  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    idx = DICTIONARY.index(@secret_word)
    len = DICTIONARY[idx].length
    @guess_word = Array.new(len, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(guessed_char)
    @attempted_chars.include?(guessed_char)
  end

  def get_matching_indices(guessed_char)
    idx = []
    if @secret_word.include?(guessed_char)
      @secret_word.each_char.with_index do |char, i| 
        idx << i if char == guessed_char
      end
    end
    idx
  end

  def fill_indices(guessed_char, indices)
    indices.each do |i|
      @guess_word[i] = guessed_char
    end
  end

  def try_guess(guessed_char)
    if self.already_attempted?(guessed_char)
      p 'that has already been attempted'
      return false
    end

    @attempted_chars << guessed_char

    matched_i = self.get_matching_indices(guessed_char)
    self.fill_indices(guessed_char, matched_i)

    @remaining_incorrect_guesses -= 1 if matched_i.empty?

    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    guessed_char = gets.chomp
    self.try_guess(guessed_char)
  end

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    end
    false
  end

  def lose?
    if  @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if self.win? or self.lose?
      p @secret_word
      return true
    end
    false
  end
  
end
