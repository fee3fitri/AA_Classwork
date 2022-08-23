require_relative 'board'
require_relative 'human_player'

class Game 
    def initialize(mark_1, mark_2)
        @player1 = HumanPlayer.new(mark_1)
        @player2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print

            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)

            if @board.win?(@current_player.mark)
                p "#{@current_player.mark.to_s} has won!"
                return
            else
                switch_turn
            end
        end

        p 'GAME OVER'
        p 'DRAW'
    end
end