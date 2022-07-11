-- Load les Mobs
require( "entity/goblin/goblin" )
require( "entity/spirit_totem/spirit_totem" )

entitys = {}

function UpdateEntitys( dt )

    for k, entity in pairs( entitys ) do
        
        entity:update( dt )

    end
    
end

function AddEntity( name, posX, posY )

    entity = {
        name  = name,
        posX  = posX,
        posY  = posY,
        speed = 0
    }

    if name == "ennemy" then 
        
        entity.speed = 0.2
        entity.sprite = love.graphics.newImage( "player/assets/placeholder.png" )

        table.insert( entitys, entity )
    
    elseif name == "goblin" then
        
        table.insert( entitys, AddGoblin( posX, posY ) )

    elseif name == "spirit_totem" then

        table.insert( entitys, AddSpiritTotem( posX, posY ) )

    end
        
end