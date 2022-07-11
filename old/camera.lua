testTile1 = love.graphics.newImage( "map/placeholders/tile1-32x32.png" )
testTile2 = love.graphics.newImage( "map/placeholders/tile2-32x32.png" )

function DrawCamera()

    -- Mets à jour les informations de la fenêtre
    width, height, flags = love.window.getMode()
    originX = width  / 2
    originY = height / 2

    originX = originX + ( ( originX - love.mouse.getX() ) / 15 )
    originY = originY + ( ( originY - love.mouse.getY() ) / 15 )

    DrawMap( originX, originY )
    
    DrawPlayer( originX, originY ) 

    DrawEntitys( originX, originY )

    DrawProjectiles( originX, originY )

    DrawMiniMap()

    DrawCursor()

end

function DrawMap( originX, originY )
    
    if currentRoom.tiles == nil then return end

    mapPosX = player.pos.x * -1
    mapPosY = player.pos.y * -1

    for k, tile in pairs( currentRoom.tiles ) do

        if ( tile.pos.x * 32      + originX + mapPosX > 0 and tile.pos.x * 32      + originX + mapPosX < width and tile.pos.y * 32      + originY + mapPosY > 0 and tile.pos.y * 32      + originY + mapPosY < height ) or
           ( tile.pos.x * 32 + 32 + originX + mapPosX > 0 and tile.pos.x * 32 + 32 + originX + mapPosX < width and tile.pos.y * 32 + 32 + originY + mapPosY > 0 and tile.pos.y * 32 + 32 + originY + mapPosY < height ) or
           ( tile.pos.x * 32 - 32 + originX + mapPosX > 0 and tile.pos.x * 32 - 32 + originX + mapPosX < width and tile.pos.y * 32 - 32 + originY + mapPosY > 0 and tile.pos.y * 32 - 32 + originY + mapPosY < height ) or
           ( tile.pos.x * 32 - 32 + originX + mapPosX > 0 and tile.pos.x * 32 - 32 + originX + mapPosX < width and tile.pos.y * 32 + 32 + originY + mapPosY > 0 and tile.pos.y * 32 + 32 + originY + mapPosY < height ) or
           ( tile.pos.x * 32 + 32 + originX + mapPosX > 0 and tile.pos.x * 32 + 32 + originX + mapPosX < width and tile.pos.y * 32 - 32 + originY + mapPosY > 0 and tile.pos.y * 32 - 32 + originY + mapPosY < height ) then
            
            tile:draw( originX + mapPosX, originY + mapPosY )
    
        end

        if debugMode then love.graphics.print( tile.x .. " " .. tile.y, originX + mapPosX + 32 * tile.x, originY + mapPosY + 32 * tile.y ) end
        
    end

end

function DrawEntitys( originX, originY )

    entitysPosX = originX + player.pos.x * -1
    entitysPosY = originY + player.pos.y * -1
    
    for k, entity in pairs( entitys ) do
        
        entity:draw( entitysPosX + entity.pos.x, entitysPosY + entity.pos.y )

    end
    
end

function DrawPlayer( originX, originY )
    
    love.graphics.draw( playerSprite, originX - 16, originY - 16 )
    love.graphics.circle( "line", originX, originY, player.attributs.size / 2 )
    if debugMode then love.graphics.print( player.pos.x .. " " .. player.pos.y, originX, originY ) end

end

function DrawCursor()
    
    -- love.graphics.draw( cursorSprite, love.mouse.getX(), love.mouse.getY() )

    if debugMode then
        love.graphics.print( love.mouse.getX() .. " " .. love.mouse.getY(), love.mouse.getX(), love.mouse.getY() )
    end

end