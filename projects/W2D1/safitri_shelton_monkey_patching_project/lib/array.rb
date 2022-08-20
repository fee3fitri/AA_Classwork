# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.length == 0
        self.sum / (self.length * 1.0 )
    end

    def median
        sorted = self.sort
        len = sorted.length
        mid = len / 2
        return nil if self.length == 0
        if len.odd?
            return sorted[mid]
        else
            return (sorted[mid - 1] + sorted[mid]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        count
    end

    def my_count(val)
        count = 0
        self.each { |el| count += 1 if el == val}
        count
    end

    def my_index(val)
        els = []
        return nil if !self.include?(val)
        self.each_with_index do |el, i|
            if !els.include?(el) and el == val
                els << i
                return i
            elsif el == val
                return i
            end
        end
    end

    def my_uniq
        unique = []
        self.each { |el| unique << el if !unique.include?(el) }
        unique
    end

    def my_transpose
        width = self[0].length
        height = self.length
        transposed = Array.new(height) { Array.new(width) }
        (0...width).each do |x|
            (0...height).each do |y|
                transposed[x][y] = self[y][x]
            end
        end
        transposed
    end
end