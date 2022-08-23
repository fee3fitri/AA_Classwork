class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player #{mark.to_s}, enter two numbers representing a position separated with a space like 4 7"
        pos = gets.chomp.split.map(&:to_i)
       
        num = [1,2,3,4,5,6,7,8,9,0]
        row, col = pos
        
        if !num.include?(row) or !num.include?(col) or pos.length != 2
            raise 'Wrong format! Try again!'
        end

        pos
    end
end