require_relative 'board'
require_relative 'human_player'

class Game 
    def initialize(mark_1, mark_2)
        @player_1 = Player.new(mark_1)
        @player_2 = Player.new(mark_2)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
    end

    def play
        while @board.empty_positions?
            pos = @current_player.get_position
            mark = @current_player.mark

            @board.print
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                p 'GAME OVER!'
                p "#{mark.to_s} has won!"
                return
            end
            switch_turn
        end

        p 'Game Over'
        p 'DRAW'
    end
end