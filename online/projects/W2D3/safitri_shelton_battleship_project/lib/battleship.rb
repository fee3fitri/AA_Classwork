require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        p @board.print
    end

    def lose?
       if @remaining_misses <= 0
        p 'you lose'
        return true
       end
       false
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        end
        false
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        pos = @player.get_move
        @remaining_misses -= 1 if !@board.attack(pos)
        
        p @board.print
        p @remaining_misses
    end
end
