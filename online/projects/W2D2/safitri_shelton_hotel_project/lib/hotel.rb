require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(guest, capacities_hash)
        @name = guest
        @rooms = {}

        capacities_hash.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end
    
    def name
        @name.split.map(&:capitalize).join(' ')
    end

    def room_exists?(room)
        @rooms.keys.any?(room)
    end

    def check_in(guest, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(guest)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
        p 'sorry, room does not exist'
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    # def list_rooms
    #     @rooms.each do |room_name, room|
    #         puts room_name + ':' + room.available_space
    #     end
    # end

    def list_rooms
        @rooms.each do |room_name, capacity|
            puts "#{room_name}: #{capacity.available_space.to_s}"
        end
    end
end
