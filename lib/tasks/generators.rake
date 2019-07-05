namespace :generators do
    task :create_rooms => :environment do
        puts "Gnerating rooms..."

        floors = {A: 20, B: 16}
        roomsCount = {A: 26, B: 16}
        bedsInRoomCount = 2

        [:A, :B].each do | building | 
            (1..floors[building]).each do | floor |
                (1..roomsCount[building]).each do |room| 
                    room_str = room.to_s.rjust(2, '0')
                    (1..bedsInRoomCount).each do |bedsInRoom| 
                        Place.create!(building: building, 
                                    floor: floor.to_s, 
                                    cell: "#{building}#{floor}#{room_str}",
                                    room: "#{room_str}",
                                    bed: bedsInRoom.to_s
                        )
                    end
                end
            end
        end
        puts "Gnerated successfully"
    end

    task :generate_users => :environment do
        puts "Gnerating users..."
       
        (1..1000).each do |i| 
            puts "generated #{i/10}%" 
            User.create!(
                {
                    email: "user#{i}@example.com", 
                    password: "123456",
                    fullname: "User #{i}" 
                }
            )
        end
        
        email: "admin@example.com",
        password: "123456",
        admin: true,
    
        puts "Gnerated successfully"
    end

end
