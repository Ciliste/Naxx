require( "map/forest/room/generate" )

biomeMap = {}

function GenerateForestBiome()

    biome = {}

    player.pos.x = 0
    player.pos.y = 0

    for x = 0, 5, 1 do
        
        for y = 0, 2, 1 do
        
            table.insert( biome, {
                name = "room",
                pos = {
                    x = x,
                    y = y
                }
            } )

        end

    end

    for x = 3, 8, 1 do
    
        for y = 3, 5, 1 do
        
            table.insert( biome, {
                name = "room",
                pos = {
                    x = x,
                    y = y
                }
            } )

        end

    end

    biome[ math.random( 1, table.getn( biome ) ) ].name = "node"

    for k, room in pairs( biome ) do
        
        if NoNodeNearby( room, biome ) then
            
            room.name = "node"

        end

    end

    for k, room in pairs( biome ) do
    
        if room.name == "node" then
            
            table.remove( biome, k )

            biome = RemoveRoom( room.pos.x + 1, room.pos.y    , biome )
            biome = RemoveRoom( room.pos.x    , room.pos.y - 1, biome )
            biome = RemoveRoom( room.pos.x + 1, room.pos.y - 1, biome )

        end

    end

    for i = 1, 3, 1 do
        
        biomeSave = biome
        for k, room in pairs( biomeSave ) do
            
            if math.random( 1, 3 ) == 1 then biome = AddRoom( room.pos.x + 1, room.pos.y    , biome ) end
            if math.random( 1, 3 ) == 1 then biome = AddRoom( room.pos.x - 1, room.pos.y    , biome ) end
            if math.random( 1, 3 ) == 1 then biome = AddRoom( room.pos.x    , room.pos.y + 1, biome ) end
            if math.random( 1, 3 ) == 1 then biome = AddRoom( room.pos.x    , room.pos.y - 1, biome ) end

        end
    
    end

    for k, room in pairs( biome ) do
        
        if not RoomExist( room.pos.x - 1, room.pos.y    , biome ) and
               RoomExist( room.pos.x    , room.pos.y + 1, biome ) and
               RoomExist( room.pos.x    , room.pos.y    , biome ) and
               RoomExist( room.pos.x    , room.pos.y - 1, biome ) and
               RoomExist( room.pos.x    , room.pos.y - 1, biome ) and
               RoomExist( room.pos.x - 2, room.pos.y - 1, biome ) and
               RoomExist( room.pos.x - 2, room.pos.y    , biome ) and
               RoomExist( room.pos.x - 2, room.pos.y + 1, biome ) and
               RoomExist( room.pos.x - 1, room.pos.y + 1, biome ) then

                AddRoom( room.pos.x - 1, room.pos.y, biome )
        
        end

    end

    roomToRemove = {}
    for k, room in pairs( biome ) do
        
        if RoomExist( room.pos.x + 1, room.pos.y + 1, biome ) and
           RoomExist( room.pos.x + 1, room.pos.y    , biome ) and
           RoomExist( room.pos.x + 1, room.pos.y - 1, biome ) and
           RoomExist( room.pos.x    , room.pos.y - 1, biome ) and
           RoomExist( room.pos.x - 1, room.pos.y - 1, biome ) and
           RoomExist( room.pos.x - 1, room.pos.y    , biome ) and
           RoomExist( room.pos.x - 1, room.pos.y + 1, biome ) and
           RoomExist( room.pos.x    , room.pos.y + 1, biome ) then
        
            table.insert( roomToRemove, {
                x = room.pos.x,
                y = room.pos.y
            } )

        end

    end

    for k, roomRem in pairs( roomToRemove ) do
        
        for index, room in pairs( biome ) do
        
            if room.pos.x == roomRem.x and room.pos.y == roomRem.y then
                
                table.remove( biome, index )

            end

        end

    end

    maxSquareDist = 0
    for k, room in pairs( biome ) do
        
        if room.pos.x * room.pos.x + room.pos.y * room.pos.y > maxSquareDist then 
            maxSquareDist = room.pos.x * room.pos.x + room.pos.y * room.pos.y
        end

    end

    bossRooms = {}
    for k, room in pairs( biome ) do
        
        if room.pos.x * room.pos.x + room.pos.y * room.pos.y == maxSquareDist then
            table.insert( bossRooms, room )
        end

    end

    bossRoom = bossRooms[ math.random( 1, table.getn( bossRooms ) ) ]
    for k, room in pairs( biome ) do
        
        if room.pos.x == bossRoom.pos.x and room.pos.y == bossRoom.pos.y then
            room.name = "boss"
        end

    end

    maxSquareDist = 0
    for k, room in pairs( biome ) do
        
        if ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + 
           ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) ) > maxSquareDist then
               
            maxSquareDist = ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) )

        end

    end

    spawnRooms = {}
    for k, room in pairs( biome ) do
        
        if ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + 
           ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) ) == maxSquareDist then
               
            table.insert( spawnRooms, room )
            
        end

    end

    spawnRoom = spawnRooms[ math.random( 1, table.getn( spawnRooms ) ) ]
    for k, room in pairs( biome ) do
        
        if room.pos.x == spawnRoom.pos.x and room.pos.y == spawnRoom.pos.y then
            room.name = "spawn"
        end

    end

    visionRooms = {}
    for k, room in pairs( biome ) do
        
        if ( ( room.pos.x - spawnRoom.pos.x ) * ( room.pos.x - spawnRoom.pos.x ) ) +
           ( ( room.pos.y - spawnRoom.pos.y ) * ( room.pos.y - spawnRoom.pos.y ) ) == 1 then
        
            table.insert( visionRooms, room )

        end

    end

    if visionRooms[ 1 ] == nil then return end

    visionRoom = visionRooms[ math.random( 1, table.getn( visionRooms ) ) ]
    for k, room in pairs( biome ) do
        
        if room.pos.x == visionRoom.pos.x and room.pos.y == visionRoom.pos.y then
            room.name = "vision"
        end

    end

    for k, room in pairs( biome ) do
        
        if NoSpawnNearby( room, biome ) and NoTribeNearby( room, biome ) and room.name ~= "boss" then
            
            room.name = "tribe"

        end

    end

    minSquareTribeDist = 1000
    for k, room in pairs( biome ) do
        
        if room.name == "tribe" and
           ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + 
           ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) ) < minSquareTribeDist then
               
            minSquareTribeDist = ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) )

        end

    end

    arenaRooms = {}
    for k, room in pairs( biome ) do
      
        if ( ( room.pos.x - bossRoom.pos.x ) * ( room.pos.x - bossRoom.pos.x ) ) + 
           ( ( room.pos.y - bossRoom.pos.y ) * ( room.pos.y - bossRoom.pos.y ) ) == minSquareTribeDist then
               
            table.insert( arenaRooms, room )
            
        end

    end

    arenaRoom = arenaRooms[ math.random( 1, table.getn( arenaRooms ) ) ]
    for k, room in pairs( biome ) do
        
        if room.pos.x == arenaRoom.pos.x and room.pos.y == arenaRoom.pos.y then
            
            room.name = "arena"

        end

    end

    tribeRooms = {}
    for k, room in pairs( biome ) do
        
        if room.name == "tribe" then
            
            table.insert( tribeRooms, room )

        end

    end

    if table.getn( tribeRooms ) < 5 then return end

    while table.getn( tribeRooms ) > 5 do
    
        tribeRoom = tribeRooms[ math.random( 1, table.getn( tribeRooms ) ) ]

        for k, room in pairs( biome ) do
            
            if room.pos.x == tribeRoom.pos.x and room.pos.y == tribeRoom.pos.y then
                
                room.name = "room"

            end

        end

        for k, room in pairs( tribeRooms ) do
        
            if room == tribeRoom then
                
                table.remove( tribeRooms, k )

            end

        end

    end

    minX, maxX, minY, maxY = 1000, -1000, 1000, -1000
    for k, room in pairs( biome ) do
        
        if room.name == "room" then
            
            if room.pos.x < minX and not RoomExist( room.pos.x - 1, room.pos.y, biome ) then
                
                minX = room.pos.x

            end

            if room.pos.x > maxX and not RoomExist( room.pos.x + 1, room.pos.y, biome ) then
                
                maxX = room.pos.x

            end

            if room.pos.y < minY and not RoomExist( room.pos.x, room.pos.y - 1, biome ) then
                
                minY = room.pos.y

            end

            if room.pos.y > maxY and not RoomExist( room.pos.x, room.pos.y + 1, biome ) then
                
                maxY = room.pos.y

            end

        end

    end

    bottomMineRooms = {}
    topMineRooms    = {}
    leftMineRooms   = {}
    rightMineRooms  = {}
    for k, room in pairs( biome ) do
        
        if room.name == "room" and room.pos.y == minY and not RoomExist( room.pos.x, room.pos.y - 1, biome ) then
            
            table.insert( bottomMineRooms, room )

        end

        if room.name == "room" and room.pos.y == maxY and not RoomExist( room.pos.x, room.pos.y + 1, biome ) then
            
            table.insert( topMineRooms, room )

        end

        if room.name == "room" and room.pos.x == minX and not RoomExist( room.pos.x - 1, room.pos.y, biome ) then
            
            table.insert( leftMineRooms, room )

        end

        if room.name == "room" and room.pos.x == maxX and not RoomExist( room.pos.x + 1, room.pos.y, biome ) then
            
            table.insert( rightMineRooms, room )

        end

    end

    bottomMineRoom = bottomMineRooms[ math.random( 1, table.getn( bottomMineRooms ) ) ]
    topMineRoom    = topMineRooms   [ math.random( 1, table.getn( topMineRooms    ) ) ]
    leftMineRoom   = leftMineRooms  [ math.random( 1, table.getn( leftMineRooms   ) ) ]
    rightMineRoom  = rightMineRooms [ math.random( 1, table.getn( rightMineRooms  ) ) ]
    for k, room in pairs( biome ) do
        
        if ( bottomMineRoom.pos.x == room.pos.x and bottomMineRoom.pos.y == room.pos.y ) or
           (    topMineRoom.pos.x == room.pos.x and    topMineRoom.pos.y == room.pos.y ) or
           (   leftMineRoom.pos.x == room.pos.x and   leftMineRoom.pos.y == room.pos.y ) or
           (  rightMineRoom.pos.x == room.pos.x and  rightMineRoom.pos.y == room.pos.y ) then
           
            room.name = "mine"

        end

    end

    for k, room in pairs( biome ) do
    
        room.connection = {}
        if RoomExist( room.pos.x, room.pos.y + 1, biome ) then table.insert( room.connection, "top"    ) print("top") end
        if RoomExist( room.pos.x, room.pos.y - 1, biome ) then table.insert( room.connection, "bottom" ) end
        if RoomExist( room.pos.x + 1, room.pos.y, biome ) then table.insert( room.connection, "right"  ) end
        if RoomExist( room.pos.x - 1, room.pos.y, biome ) then table.insert( room.connection, "left"   ) end

    end

    biome = GenerateForestRooms( biome )
    return biome

end

function NoSpawnNearby( currentRoom, biome )
    
    for k, room in pairs( biome ) do
        
        if room.name == "spawn" and 
           ( ( room.pos.x - currentRoom.pos.x ) * ( room.pos.x - currentRoom.pos.x ) ) +
           ( ( room.pos.y - currentRoom.pos.y ) * ( room.pos.y - currentRoom.pos.y ) ) < 7 * 7 then
               
            return false

        end

    end

    return true

end

function NoTribeNearby( currentRoom, biome )
    
    for k, room in pairs( biome ) do
        
        if room.name == "tribe" and 
           ( ( room.pos.x - currentRoom.pos.x ) * ( room.pos.x - currentRoom.pos.x ) ) +
           ( ( room.pos.y - currentRoom.pos.y ) * ( room.pos.y - currentRoom.pos.y ) ) < 5 * 5 then
               
            return false

        end

    end

    return true

end

function AddRoom( x, y, biome )
    
    if RoomExist( x, y, biome ) then return biome end

    table.insert( biome, {
        name = "room",
        pos = {
            x = x,
            y = y
        }
    } )
    return biome

end

function RoomExist( x, y, biome )
    
    for k, room in pairs( biome ) do
        
        if room.pos.x == x and room.pos.y == y then
            return true
        end

    end

    return false

end

function NoNodeNearby( currentTile, biome )
    
    for k, tile in pairs( biome ) do
        
        if tile.name == "node" and ( ( tile.pos.x - currentTile.pos.x ) * ( tile.pos.x - currentTile.pos.x ) ) + 
                                   ( ( tile.pos.y - currentTile.pos.y ) * ( tile.pos.y - currentTile.pos.y ) ) <= 3 * 3 then
        
            return false

        end

    end

    return true

end

function RemoveRoom( x, y, biome )
    
    for k, tile in pairs( biome ) do
        
        if tile.pos.x == x and tile.pos.y == y then
            
            table.remove( biome, k )

        end

    end

    return biome

end