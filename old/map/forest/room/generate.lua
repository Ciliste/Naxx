grassTile    = love.graphics.newImage( "map/forest/room/grass.png"    )
grassBisTile = love.graphics.newImage( "map/forest/room/grassBis.png" )
rockTile     = love.graphics.newImage( "map/forest/room/rock.png"     )
centerTile   = love.graphics.newImage( "map/forest/room/center.png"   ) 
rockBisTile  = love.graphics.newImage( "map/forest/room/rockBis.png"  )

rockSprites = {}
rockSprites[ "0000" ] = love.graphics.newImage( "map/forest/room/rock0000.png" )
rockSprites[ "1000" ] = love.graphics.newImage( "map/forest/room/rock1000.png" )

shadow = love.graphics.newImage( "map/forest/room/shadow.png" )

function GenerateForestRooms( biome )

    for k, room in pairs( biome ) do
        
        if room.name == "spawn" then
            
            room = GenerateForestSpawn( room, math.random( 30, 40 ) )

        end

    end

    return biome

end

function GenerateForestSpawn( spawnRoom, roomSize )

    tiles = {}
    for i = -roomSize, roomSize, 1 do
        
        tiles[ i ] = {}
        for j = -roomSize, roomSize, 1 do
        
            tile = {
                name = "undefined",
                pos = {
                    x = j,
                    y = i
                }
            }

            tiles[ i ][ j ] = tile

        end

    end

    -- Placer les premiers murs
    for k1, line in pairs( tiles ) do
        
        for k2, tile in pairs( line ) do
            
            if math.abs( tile.pos.x ) == roomSize or math.abs( tile.pos.y ) == roomSize then
                
                tile.name = "rock"
                goto skip1

            end

            if math.random( math.max( math.abs( tile.pos.x ), math.abs( tile.pos.y ) ), roomSize ) == roomSize then
                
                tile.name = "rock"
                goto skip1

            end

            ::skip1::
        end

    end

    -- Eliminer les murs isolés
    for k1, line in pairs( tiles ) do
        
        for k2, tile in pairs( line ) do
            
            if tile.name == "rock" and math.abs( tile.pos.x ) ~= roomSize and math.abs( tile.pos.y ) ~= roomSize then
                
                if tiles[ k1 ][ k2 - 1 ].name == "rock" then goto skip2 end
                if tiles[ k1 ][ k2 + 1 ].name == "rock" then goto skip2 end
                if tiles[ k1 - 1 ][ k2 ].name == "rock" then goto skip2 end
                if tiles[ k1 + 1 ][ k2 ].name == "rock" then goto skip2 end

                tile.name = "undefined"

            end

            ::skip2::
        end

    end

    for i = 1, 3, 1 do
        
        for k1, line in pairs( tiles ) do
        
            for k2, tile in pairs( line ) do
                
                if tile.name == "rock" and math.abs( tile.pos.x ) ~= roomSize and math.abs( tile.pos.y ) ~= roomSize then
                    
                    if math.random( 1, 3 ) < 3 then tiles[ k1 - 1 ][ k2 - 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1 - 1 ][ k2 + 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1 + 1 ][ k2 - 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1 + 1 ][ k2 + 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1     ][ k2 - 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1     ][ k2 + 1 ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1 - 1 ][ k2     ].name = "toRock" end
                    if math.random( 1, 3 ) < 3 then tiles[ k1 + 1 ][ k2     ].name = "toRock" end
    
                end

            end
    
        end

        for k1, line in pairs( tiles ) do
        
            for k2, tile in pairs( line ) do
                
                if tile.name == "toRock" then tile.name = "rock" end

            end
    
        end 

    end

    repeat

        tileAdded = 0
        for k1, line in pairs( tiles ) do
            
            for k2, tile in pairs( line ) do
                
                if tile.name == "undefined" and math.abs( tile.pos.x ) ~= roomSize and math.abs( tile.pos.y ) ~= roomSize then
                    
                    cpt = 0
                    if tiles[ k1 ][ k2 - 1 ].name == "rock" then cpt = cpt + 1 end
                    if tiles[ k1 ][ k2 + 1 ].name == "rock" then cpt = cpt + 1 end
                    if tiles[ k1 - 1 ][ k2 ].name == "rock" then cpt = cpt + 1 end
                    if tiles[ k1 + 1 ][ k2 ].name == "rock" then cpt = cpt + 1 end

                    if cpt > 2 then tile.name = "rock" tileAdded = tileAdded + 1 goto skip3 end

                    if tiles[ k1 - 1 ][ k2 - 1 ].name == "rock" and tiles[ k1 + 1 ][ k2 + 1 ].name == "rock" then tile.name = "rock" tileAdded = tileAdded + 1 goto skip3 end
                    if tiles[ k1 + 1 ][ k2 - 1 ].name == "rock" and tiles[ k1 - 1 ][ k2 + 1 ].name == "rock" then tile.name = "rock" tileAdded = tileAdded + 1 goto skip3 end

                end

                if tile.name == "rock" and math.abs( tile.pos.x ) ~= roomSize and math.abs( tile.pos.y ) ~= roomSize then

                    cpt = 0
                    if tiles[ k1 ][ k2 - 1 ].name == "undefined" then cpt = cpt + 1 end
                    if tiles[ k1 ][ k2 + 1 ].name == "undefined" then cpt = cpt + 1 end
                    if tiles[ k1 - 1 ][ k2 ].name == "undefined" then cpt = cpt + 1 end
                    if tiles[ k1 + 1 ][ k2 ].name == "undefined" then cpt = cpt + 1 end

                    if cpt > 2 then tile.name = "undefined" end

                end

                ::skip3::
            end

        end

    until tileAdded == 0

    for k1, line in pairs( tiles ) do
            
        for k2, tile in pairs( line ) do
            
            if tile.name == "undefined" then tile.name = "grass" end

        end

    end

    --[[
    for k1, line in pairs( tiles ) do
            
        for k2, tile in pairs( line ) do
            
            if tile.name == "undefined" then

                if math.random( 1, 20 ) == 20 then tile.name = "grass" end

            end

        end

    end 

    for i = 1, 2, 1 do
        
        for k1, line in pairs( tiles ) do
            
            for k2, tile in pairs( line ) do
                
                if tile.name == "grass" then
    
                    if math.random( 1, 3 ) < 3 and tiles[ k1 - 1 ][ k2 - 1 ].name == "undefined" then tiles[ k1 - 1 ][ k2 - 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1 - 1 ][ k2 + 1 ].name == "undefined" then tiles[ k1 - 1 ][ k2 + 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1 + 1 ][ k2 - 1 ].name == "undefined" then tiles[ k1 + 1 ][ k2 - 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1 + 1 ][ k2 + 1 ].name == "undefined" then tiles[ k1 + 1 ][ k2 + 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1     ][ k2 - 1 ].name == "undefined" then tiles[ k1     ][ k2 - 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1     ][ k2 + 1 ].name == "undefined" then tiles[ k1     ][ k2 + 1 ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1 - 1 ][ k2     ].name == "undefined" then tiles[ k1 - 1 ][ k2     ].name = "toGrass" end
                    if math.random( 1, 3 ) < 3 and tiles[ k1 + 1 ][ k2     ].name == "undefined" then tiles[ k1 + 1 ][ k2     ].name = "toGrass" end
    
                end
    
            end
    
        end 

        for k1, line in pairs( tiles ) do
            
            for k2, tile in pairs( line ) do
                
                if tile.name == "toGrass" then tile.name = "grass" end
    
            end
    
        end 

    end 
    ]]

    -- Connection aux autres salles
    for index, dir in pairs( spawnRoom.connection ) do
    
        if dir == "top" then
            
            tolerance = 6
            repeat

                tolerance = tolerance + 1

                topTiles = {}
                for k, tile in pairs( tiles[ -roomSize ] ) do
                    
                    if math.abs( tile.pos.x ) <= roomSize * 0.7 and math.abs( tile.pos.x ) + 1 <= roomSize * 0.7 then
                        
                        cpt1 = 0
                        for i = -roomSize, roomSize, 1 do
                            
                            if tiles[ i ][ tile.pos.x ].name == "rock" then cpt1 = cpt1 + 1
                            else goto skipCpt1 end

                        end
                        ::skipCpt1::

                        cpt2 = 0
                        for i = -roomSize, roomSize, 1 do
                            
                            if tiles[ i ][ tile.pos.x + 1 ].name == "rock" then cpt2 = cpt2 + 1
                            else goto skipCpt2 end

                        end
                        ::skipCpt2::

                        if cpt1 < tolerance and cpt2 < tolerance and cpt1 == cpt2 then table.insert( topTiles, tile ) end

                    end
            
                end

            until table.getn( topTiles ) > 0

            originTile = topTiles[ math.random( 1, table.getn( topTiles ) ) ]
            
            cpt = 0
            while tiles[ originTile.pos.y + cpt ][ originTile.pos.x ].name == "rock" or tiles[ originTile.pos.y + cpt ][ originTile.pos.x + 1 ].name == "rock" do
            
                tiles[ originTile.pos.y + cpt ][ originTile.pos.x     ].name = "grass"
                tiles[ originTile.pos.y + cpt ][ originTile.pos.x + 1 ].name = "grass"

                cpt = cpt + 1

            end

        elseif dir == "bottom" then

            tolerance = 6
            repeat

                tolerance = tolerance + 1

                bottomTiles = {}
                for k, tile in pairs( tiles[ roomSize ] ) do
                    
                    if math.abs( tile.pos.x ) <= roomSize * 0.7 and math.abs( tile.pos.x ) + 1 <= roomSize * 0.7 then
                        
                        cpt1 = 0
                        for i = roomSize, -roomSize, -1 do
                            
                            if tiles[ i ][ tile.pos.x ].name == "rock" then cpt1 = cpt1 + 1
                            else goto skipCpt1 end

                        end
                        ::skipCpt1::

                        cpt2 = 0
                        for i = roomSize, -roomSize, -1 do
                            
                            if tiles[ i ][ tile.pos.x + 1 ].name == "rock" then cpt2 = cpt2 + 1
                            else goto skipCpt2 end

                        end
                        ::skipCpt2::

                        if cpt1 < tolerance and cpt2 < tolerance and cpt1 == cpt2 then table.insert( bottomTiles, tile ) end

                    end
            
                end

            until table.getn( bottomTiles ) > 0

            originTile = bottomTiles[ math.random( 1, table.getn( bottomTiles ) ) ]
            
            cpt = 0
            while tiles[ originTile.pos.y - cpt ][ originTile.pos.x ].name == "rock" or tiles[ originTile.pos.y - cpt ][ originTile.pos.x + 1 ].name == "rock" do
            
                tiles[ originTile.pos.y - cpt ][ originTile.pos.x     ].name = "grass"
                tiles[ originTile.pos.y - cpt ][ originTile.pos.x + 1 ].name = "grass"

                cpt = cpt + 1

            end
            
        elseif dir == "right" then

            tolerance = 6
            repeat

                tolerance = tolerance + 1
            
                rightTiles = {}
                for i = -roomSize, roomSize, 1 do
                    
                    if math.abs( i ) <= roomSize * 0.7 and math.abs( i - 1 ) <= roomSize * 0.7 then
                        
                        cpt1 = 0
                        for j = roomSize, -roomSize, -1 do
                            
                            if tiles[ i ][ j ].name == "rock" then cpt1 = cpt1 + 1
                            else goto skipCpt1 end

                        end
                        ::skipCpt1::

                        cpt2 = 0
                        for j = roomSize, -roomSize, -1 do
                            
                            if tiles[ i - 1 ][ j ].name == "rock" then cpt2 = cpt2 + 1
                            else goto skipCpt2 end

                        end
                        ::skipCpt2::

                        if cpt1 < tolerance and cpt2 < tolerance and cpt1 == cpt2 then table.insert( rightTiles, tile ) end

                    end
            
                end

            until table.getn( rightTiles ) > 0

            originTile = rightTiles[ math.random( 1, table.getn( rightTiles ) ) ]
            
            tiles[ originTile.pos.y     ][ originTile.pos.x ].name = "grass"
            tiles[ originTile.pos.y - 1 ][ originTile.pos.x ].name = "grass"
            
        elseif dir == "left" then
            
            leftTiles = {}
            for i = -roomSize, roomSize, 1 do
                
                if math.abs( tiles[ i ][ -roomSize ].pos.y ) <= roomSize * 0.7 then
                    
                    table.insert( leftTiles, tiles[ i ][ -roomSize ] )

                end
        
            end

            originTile = leftTiles[ math.random( 1, table.getn( leftTiles ) ) ]
            
            tiles[ originTile.pos.y ][ originTile.pos.x ].name = "grass"
            print( "Left." )

        end

    end

    -- Attribution des sprites
    for k1, line in pairs( tiles ) do
        
        for k2, tile in pairs( line ) do
            
            if tile.name == "grass" then
                
                function tile:draw( posX, posY )
                    
                    love.graphics.draw( grassTile, -16 + posX + 32 * self.pos.x, -16 + posY + 32 * self.pos.y )
    
                end

            elseif tile.name == "rock" then

                if math.max( math.abs( tile.pos.x ), math.abs( tile.pos.y ) ) == roomSize then
                    
                    function tile:draw( posX, posY )
                    
                        love.graphics.draw( rockTile, -16 + posX + 32 * self.pos.x, -16 + posY + 32 * self.pos.y )
        
                    end

                else
                    
                    if tiles[ k1 + 1 ][ k2 ].name == "grass" then 
                        sprite = rockBisTile 
                        goto skip5 
                    end

                    case = ""
                    if tiles[ k1 - 1 ][ k2 ].name == "grass" then case = case .. "1" else case = case .. "0" end
                    if tiles[ k1 ][ k2 + 1 ].name == "grass" then case = case .. "1" else case = case .. "0" end
                    if tiles[ k1 + 1 ][ k2 ].name == "grass" then case = case .. "1" else case = case .. "0" end
                    if tiles[ k1 ][ k2 - 1 ].name == "grass" then case = case .. "1" else case = case .. "0" end

                    if rockSprites[ case ] then sprite = rockSprites[ case ] else sprite = rockTile end
                    if case == "1000" then sprite = rockSprites[ "1000" ] end

                    ::skip5::
                    function tile:draw( posX, posY )
                    
                        love.graphics.draw( sprite, -16 + posX + 32 * self.pos.x, -16 + posY + 32 * self.pos.y )
        
                    end
                end

                grassNear = false
                if math.abs( k1 ) == roomSize or math.abs( k2 ) == roomSize then goto skip4 end
                if tiles[ k1 - 1 ][ k2 - 1 ].name == "grass" then grassNear = true end
                if tiles[ k1 - 1 ][ k2 + 1 ].name == "grass" then grassNear = true end
                if tiles[ k1 + 1 ][ k2 - 1 ].name == "grass" then grassNear = true end
                if tiles[ k1 + 1 ][ k2 + 1 ].name == "grass" then grassNear = true end
                if tiles[ k1     ][ k2 - 1 ].name == "grass" then grassNear = true end
                if tiles[ k1     ][ k2 + 1 ].name == "grass" then grassNear = true end
                if tiles[ k1 - 1 ][ k2     ].name == "grass" then grassNear = true end
                if tiles[ k1 + 1 ][ k2     ].name == "grass" then grassNear = true end
                ::skip4::

                if grassNear == true then
                    
                    function tile:collision( playerPosX, playerPosY, size )
                        
                        if ( ( ( self.pos.x * 32 - 16 ) - playerPosX ) * ( ( self.pos.x * 32 - 16 ) - playerPosX ) ) + ( ( ( self.pos.y * 32 - 16 ) - playerPosY ) * ( ( self.pos.y * 32 - 16 ) - playerPosY ) ) <= ( size / 2 ) * ( size / 2 ) then return true end
                        if ( ( ( self.pos.x * 32 - 16 ) - playerPosX ) * ( ( self.pos.x * 32 - 16 ) - playerPosX ) ) + ( ( ( self.pos.y * 32 + 16 ) - playerPosY ) * ( ( self.pos.y * 32 + 16 ) - playerPosY ) ) <= ( size / 2 ) * ( size / 2 ) then return true end
                        if ( ( ( self.pos.x * 32 + 16 ) - playerPosX ) * ( ( self.pos.x * 32 + 16 ) - playerPosX ) ) + ( ( ( self.pos.y * 32 - 16 ) - playerPosY ) * ( ( self.pos.y * 32 - 16 ) - playerPosY ) ) <= ( size / 2 ) * ( size / 2 ) then return true end
                        if ( ( ( self.pos.x * 32 + 16 ) - playerPosX ) * ( ( self.pos.x * 32 + 16 ) - playerPosX ) ) + ( ( ( self.pos.y * 32 + 16 ) - playerPosY ) * ( ( self.pos.y * 32 + 16 ) - playerPosY ) ) <= ( size / 2 ) * ( size / 2 ) then return true end
                        
                        if playerPosX + size / 2 >= self.pos.x * 32 - 16 and playerPosX + size / 2 <= self.pos.x * 32 + 16 and playerPosY >= self.pos.y * 32 - 16 and playerPosY <= self.pos.y * 32 + 16 then return true end
                        if playerPosX - size / 2 >= self.pos.x * 32 - 16 and playerPosX - size / 2 <= self.pos.x * 32 + 16 and playerPosY >= self.pos.y * 32 - 16 and playerPosY <= self.pos.y * 32 + 16 then return true end
                        if playerPosX >= self.pos.x * 32 - 16 and playerPosX <= self.pos.x * 32 + 16 and playerPosY + size / 2 >= self.pos.y * 32 - 16 and playerPosY + size / 2 <= self.pos.y * 32 + 16 then return true end
                        if playerPosX >= self.pos.x * 32 - 16 and playerPosX <= self.pos.x * 32 + 16 and playerPosY - size / 2 >= self.pos.y * 32 - 16 and playerPosY - size / 2 <= self.pos.y * 32 + 16 then return true end

                        return false

                    end

                end

                if math.abs( tile.pos.x ) ~= roomSize and math.abs( tile.pos.y ) ~= roomSize then
                    
                    if tiles[ k1 + 1 ][ k2 ].name == "grass" then
                        
                        function tile:draw( posX, posY )
                    
                            love.graphics.draw( rockBisTile, -16 + posX + 32 * self.pos.x, -16 + posY + 32 * self.pos.y )
            
                        end

                    end

                end

            elseif tile.name == "center" then
                
                function tile:draw( posX, posY )
                    
                    love.graphics.draw( centerTile, -16 + posX + 32 * self.pos.x, -16 + posY + 32 * self.pos.y )
    
                end

            end

        end
    
    end

    spawnRoom.tiles = {}
    for k, line in pairs( tiles ) do
        
        for j, tile in pairs( line ) do
            
            table.insert( spawnRoom.tiles, tile )

        end

    end

    return spawnRoom

end