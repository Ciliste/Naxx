allyProjectiles   = {}
ennemyProjectiles = {}

function AddPlayerProjectile( dirX, dirY )
    
    local newProjectile = {
        pos = {
            x = player.pos.x,
            y = player.pos.y
        },
        dir = {
            x = dirX - player.pos.x,
            y = dirY - player.pos.y
        },
        attributs = {
            speed = 1000 * player.attack.velocity,
            power = 5,
            size  = 10
        }
    }

    function newProjectile:update( dt )

        self.pos.x = self.pos.x + dt * gameSpeed * self.attributs.speed * ( self.dir.x / ( math.abs( self.dir.x ) + math.abs( self.dir.y ) ) )
        self.pos.y = self.pos.y + dt * gameSpeed * self.attributs.speed * ( self.dir.y / ( math.abs( self.dir.x ) + math.abs( self.dir.y ) ) )

        if ProjectileCollisionWithTerrain( self.pos.x, self.pos.y, self.attributs.size ) then
            table.remove( allyProjectiles, indexOf( allyProjectiles, self ) )
            return
        end

        if self.pos.x > 3000 or self.pos.x < -3000 or
           self.pos.y > 3000 or self.pos.y < -3000 then
        
            table.remove( allyProjectiles, indexOf( allyProjectiles, self ) )

        end

    end

    table.insert( allyProjectiles, newProjectile )

end

function UpdateProjectiles( dt )
    
    for k, projectile in pairs( allyProjectiles ) do
        
        projectile:update( dt )

    end

    for k, projectile in pairs( ennemyProjectiles ) do
    
        projectile:update( dt )

    end

end

function DrawProjectiles( posX, posY )
    
    projectilesPosX = posX + player.pos.x * -1
    projectilesPosY = posY + player.pos.y * -1

    for k, projectile in pairs( allyProjectiles ) do
        
        love.graphics.circle( "line", projectilesPosX + projectile.pos.x, projectilesPosY + projectile.pos.y, projectile.attributs.size / 2 )

    end

    for k, projectile in pairs( ennemyProjectiles ) do
    
        projectile:draw( projectilesPosX, projectilesPosY )

    end

end

function ProjectileCollisionWithTerrain( projectilePosX, projectilePosY, size )

    for k, tile in pairs( currentRoom.tiles ) do
    
        if tile.collision then
            
            if tile:collision( projectilePosX, projectilePosY, size ) == true then return true end

        end

    end

    return false

end