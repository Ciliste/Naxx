miniMapRoomTile   = love.graphics.newImage( "map/forest/minimap/room.png"   )
miniMapNodeTile   = love.graphics.newImage( "map/forest/minimap/node.png"   )
miniMapBossTile   = love.graphics.newImage( "map/forest/minimap/boss.png"   )
miniMapSpawnTile  = love.graphics.newImage( "map/forest/minimap/spawn.png"  )
miniMapVisionTile = love.graphics.newImage( "map/forest/minimap/vision.png" )
miniMapTribeTile  = love.graphics.newImage( "map/forest/minimap/tribe.png"  )
miniMapArenaTile  = love.graphics.newImage( "map/forest/minimap/arena.png"  )
miniMapMineTile   = love.graphics.newImage( "map/forest/minimap/mine.png"   )

function DrawMiniMap()
    
    if biomeMap == nil then return end

    for k, tile in pairs( biomeMap ) do
            
        if tile.name == "room" then
        
            love.graphics.draw( miniMapRoomTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "node" then
           
            love.graphics.draw( miniMapNodeTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "boss" then
            
            love.graphics.draw( miniMapBossTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )
        
        elseif tile.name == "spawn" then
            
            love.graphics.draw( miniMapSpawnTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "vision" then
        
            love.graphics.draw( miniMapVisionTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "tribe" then
            
            love.graphics.draw( miniMapTribeTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "arena" then
            
            love.graphics.draw( miniMapArenaTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        elseif tile.name == "mine" then
            
            love.graphics.draw( miniMapMineTile, width * 0.8 + tile.pos.x * 8, height * 0.8 + tile.pos.y * -8 )

        end

    end


end