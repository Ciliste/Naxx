require( "map/forest/generate" )

currentMap  = {}
currentRoom = {}

function GenerateTestField( range )
    
    newMap = { 
        biome = "TestField", 
        tiles = {} 
    }
    newMap.tiles[1] = {
        x = 0,
        y = 0
    }
    
    for i = 1, range, 1 do
        
        oldTiles = {}
        for k, tile in pairs( newMap.tiles ) do
            table.insert( oldTiles, tile )
        end
        
        for k, tile in pairs( oldTiles ) do
            
            if not TileExist( newMap.tiles, tile.x + 1, tile.y ) then
                table.insert( newMap.tiles, {
                    x = tile.x + 1,
                    y = tile.y
                } )
            end

            if not TileExist( newMap.tiles, tile.x - 1, tile.y ) then
                table.insert( newMap.tiles, {
                    x = tile.x - 1,
                    y = tile.y
                } )
            end
            
            if not TileExist( newMap.tiles, tile.x, tile.y + 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x,
                    y = tile.y + 1
                } )
            end

            if not TileExist( newMap.tiles, tile.x, tile.y - 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x,
                    y = tile.y - 1
                } )
            end

            if not TileExist( newMap.tiles, tile.x + 1, tile.y + 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x + 1,
                    y = tile.y + 1
                } )
            end

            if not TileExist( newMap.tiles, tile.x + 1, tile.y - 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x + 1,
                    y = tile.y - 1
                } )
            end

            if not TileExist( newMap.tiles, tile.x - 1, tile.y + 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x - 1,
                    y = tile.y + 1
                } )
            end

            if not TileExist( newMap.tiles, tile.x - 1, tile.y - 1 ) then
                table.insert( newMap.tiles, {
                    x = tile.x - 1,
                    y = tile.y - 1
                } )
            end

        end

        minX = newMap.tiles[ 1 ].x
        maxX = newMap.tiles[ 1 ].x

        minY = newMap.tiles[ 1 ].y
        maxY = newMap.tiles[ 1 ].y
        
        for k, tile in pairs( newMap.tiles ) do
            
            if tile.x < minX then minX = tile.x end
            if tile.x > maxX then maxX = tile.x end

            if tile.y < minY then minY = tile.y end
            if tile.y > maxY then maxY = tile.y end

        end

        newMap.minX = minX
        newMap.maxX = maxX

        newMap.minY = minY
        newMap.maxY = maxY

    end

    currentMap = newMap
    
end

function TileExist( tilesTab, x, y )
    
    for k, tile in pairs( tilesTab ) do
        
        if tile.x == x and tile.y == y then
            return true
        end

    end

    return false

end