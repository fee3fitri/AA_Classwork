class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end

    def attack(pos)
        row, col = pos
        if self[pos] == :S 
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        end

        self[pos] = :X
        false
    end

    def place_random_ships
        total_ships = 0.25 * @size
        ship_count = 0
        while ship_count < total_ships
            row = rand(@grid.length)
            col = rand(@grid[0].length)
            pos = @grid[row][col]
            if pos != :S 
                @grid[row][col] = :S
                ship_count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N 
                else
                    el
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
