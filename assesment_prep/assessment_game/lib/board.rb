class Board
    attr_reader :max_height

    def self.build_stacks(stack_num)
        Array.new(stack_num) { Array.new }
    end

    def initialize(stack_num, max_height)
        if stack_num < 4 or max_height < 4      # should initialize this first
            raise 'rows and cols must be >= 4'
        end

        @max_height = max_height
        @stacks = Board.build_stacks(stack_num)
    end

    def add(token, stack_i)
        return false if @stacks[stack_i].length == @max_height
        
        @stacks[stack_i] << token
        true
    end

    def vertical_winner?(token)
        @stacks.map { |row| row.count(token) == @max_height }.any?(true)
    end

    def horizontal_winner?(token)
        max_width = @stacks.length
        
        @stacks.each.with_index do |row, i| 
            if row.length != @max_height
                (row.length...@max_height).each do |j|
                    @stacks[i][j] = nil
                end
            end
        end

        transposed = @stacks.transpose
        transposed.map { |col| col.count(token) == max_width }.any?(true)
    end

    def winner?(token)
        vertical_winner?(token) or horizontal_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
