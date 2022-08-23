class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(pos)
        width = @grid.length
        pos.all? { |idx| idx >= 0 and idx < width }
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == '_'
    end

    def place_mark(pos, mark)
        raise 'Invalid position!' if !self.valid?(pos) or !self.empty?(pos)
        row, col = pos
        @grid[row][col] = mark
    end

    def print
        @grid.each { |row| p row.join(' | ') }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        width = @grid.length
        left_to_right = (0...width).all? { |i| @grid[i][i] == mark}
        right_to_left = (0...width).all? do |i|
            row = i
            col = width - 1 - i
            @grid[row][col] == mark
        end

        left_to_right or right_to_left
    end

    def win?(mark)
        self.win_row?(mark) or self.win_col?(mark) or self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |el| el == '_' }
    end

end