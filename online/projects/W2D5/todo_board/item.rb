class Item
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date)
        date_arr = date.split('-')
        len = date_arr.length
        yy = date_arr[0].to_i
        mm = date_arr[1].to_i
        dd = date_arr[2].to_i

        (yy > 1900 && yy <= 2022) and (mm >= 1 && mm <= 12) and (dd >= 1 && dd <= 31)
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        raise 'Sorry, invalid date T_T' if !Item.valid_date?(@deadline)
    end

    # def deadline
    #     @deadline
    #     @deadline if !Item.valid_date?(@deadline)
    # end

    # def deadline=(new_deadline)
    #     @deadline = new_deadline
    #     raise 'Sorry, invalid date T_T' if !Item.valid_date?(@deadline)
    # end
end