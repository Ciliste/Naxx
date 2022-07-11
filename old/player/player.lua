-- Initialisation des attributs
player = {
    pos = {
        x = 0,
        y = 0
    },
    attack = {
        attackSpeed = 500,
        velocity    = 1,
        lastShoot   = love.timer.getTime()
    },
    attributs = {
        speed = 500,
        size  = 32,
        health = {
            max     = 100,
            current = 100
        }
    }
}

playerPlaceHolder = love.graphics.newImage( "player/assets/placeholder.png" )

function UpdatePlayer( dt )
    
    PlayerMove( dt )

    PlayerShoot()

end

function PlayerMove( dt )
    
    if console then return end
    
    -- Variation de position à 0
    dX = 0
    dY = 0 

    if love.keyboard.isDown( "z" ) then
        dY = dY - player.attributs.speed * gameSpeed
    end

    if love.keyboard.isDown( "s" ) then
        dY = dY + player.attributs.speed * gameSpeed
    end

    if love.keyboard.isDown( "q" ) then
        dX = dX - player.attributs.speed * gameSpeed
    end

    if love.keyboard.isDown( "d" ) then
        dX = dX + player.attributs.speed * gameSpeed
    end

    if dX ~= 0 or dY ~= 0 then
        
        -- Test de collision
        if PlayerCollisionWithTerrain( player.pos.x + ( dX * dt ), player.pos.y ) then dX = 0 end
        if PlayerCollisionWithTerrain( player.pos.x, player.pos.y + ( dY * dt ) ) then dY = 0 end

        player.pos.x = player.pos.x + ( dX * dt )
        player.pos.y = player.pos.y + ( dY * dt )

    end

    playerSprite = playerPlaceHolder

end

function PlayerShoot()
    
    if next( entitys ) ~= nil then
        
        if love.timer.getTime() >= player.attack.lastShoot + ( 1 / player.attack.attackSpeed ) then

            shootPosX = nil
            shootPosY = nil

            for k, entity in pairs( entitys ) do

                if entity.target == true then
                    
                    if shootPosX == nil and shootPosY == nil then
                        
                        shootPosX = entity.pos.x
                        shootPosY = entity.pos.y

                    elseif ( shootPosX - player.pos.x ) * ( shootPosX - player.pos.x ) + ( shootPosY - player.pos.y ) * ( shootPosY - player.pos.y ) > 
                           ( entity.pos.x - player.pos.x ) * ( entity.pos.x - player.pos.x ) + ( entity.pos.y - player.pos.y ) * ( entity.pos.y - player.pos.y ) then
                    
                        if entity.target == true then shootPosX = entity.pos.x shootPosY = entity.pos.y end

                    end
                
                end

            end

            if shootPosX ~= nil and shootPosY ~= nil then
                
                AddPlayerProjectile( shootPosX, shootPosY )
                player.attack.lastShoot = love.timer.getTime()

            end

        end

    end

end

function DamagePlayer( amount )

    player.attributs.health.current = player.attributs.health.current - math.random( amount / 2, amount ) 
    
end

function PlayerCollisionWithTerrain( playerPosX, playerPosY )

    for k, tile in pairs( currentRoom.tiles ) do
    
        if tile.collision then
            
            if tile:collision( playerPosX, playerPosY, player.attributs.size ) == true then return true end

        end

    end

    return false

end