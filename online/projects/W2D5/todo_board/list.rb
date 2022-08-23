require_relative './item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = nil)
        # description ||= 

        new_item = Item.new(title, deadline, description)
        
        return false if !Item.valid_date?(deadline)

        @items << new_item
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
    end
end