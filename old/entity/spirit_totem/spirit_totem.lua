local idleFrames = {}
idleFrames[ 1 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 2 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 3 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 4 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 5 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 6 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 7 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )
idleFrames[ 8 ] = love.graphics.newImage( "entity/spirit_totem/prototype/idle_proto.png" )

function AddSpiritTotem( posX, posY )

    local entity = {}

    entity = {
        name = "spirit_totem",
        pos = {
            x = posX,
            y = posY
        },
        state     = "idle",
        attributs = {
            size = 64,
            health = {
                max = 50,
                current = 50
            }
        },
        sprite    = nil,
        looking   = "right",
        frame     = 1,
        lastFrame = love.timer.getTime(),
        attack    = {
            lastShoot = love.timer.getTime(),
            attackSpeed = 0.5,
            power     = 15
        },
        target = true
    }

    function entity:update()

        if self.state == "dead" then self.target = false return end

        for p, projectile in pairs( allyProjectiles ) do
    
            if ( ( projectile.pos.x - self.pos.x ) * ( projectile.pos.x - self.pos.x ) ) +
               ( ( projectile.pos.y - self.pos.y ) * ( projectile.pos.y - self.pos.y ) )
               <= ( ( projectile.attributs.size / 2 ) + ( projectile.attributs.size / 2 ) ) * ( ( projectile.attributs.size / 2 ) + ( self.attributs.size / 2 ) ) then
                
                self.attributs.health.current = self.attributs.health.current - math.random( projectile.attributs.power / 2, projectile.attributs.power )
    
                table.remove( allyProjectiles, p )
    
                if self.attributs.health.current <= 0 then
                    
                    self.state = "dead"
                    return
    
                end
    
            end
    
        end

        -- Frame
        if self.state == "idle" then
    
            self.sprite = idleFrames[ self.frame ]
    
        end

        -- Attack 1 
        if self.attack.lastShoot + ( 1 / self.attack.attackSpeed ) <= love.timer.getTime() then
            
            AddSpiritTotemProjectile( self )
            self.attack.lastShoot = love.timer.getTime()

        end

        -- Looking Update
        if self.pos.x < player.pos.x then
            
            self.looking = "right"

        else
            
            self.looking = "left"

        end

        -- Frame Time Count
        if self.lastFrame + 0.1 < love.timer.getTime() then
            
            self.lastFrame = love.timer.getTime()
            
            self.frame = self.frame + 1

        end

        -- Update Frame Count
        if self.state == "idle" and self.frame >= 8 then
            
            self.frame = 1

        end

    end

    function entity:draw( posX, posY )

        if self.looking == "left" then
            love.graphics.draw( self.sprite, posX + 32, posY - 32, 0, -1, 1 )
        else
            love.graphics.draw( self.sprite, posX - 32, posY - 32, 0,  1, 1 )
        end
    
        love.graphics.print( "HP : " .. self.attributs.health.current .. "/" .. self.attributs.health.max, posX, posY - 40 )
    
        if debugMode then 
            love.graphics.print( self.pos.x .. " " .. self.pos.y, posX, posY ) 
            love.graphics.circle( "line", posX, posY, self.attributs.size / 2 )
        end

    end

    return entity

end

function AddSpiritTotemProjectile( totem )
    
    newProjectile = {
        owner = totem,
        dir = {
            x = player.pos.x - totem.pos.x,
            y = player.pos.y - totem.pos.y
        },
        pos = {
            x = totem.pos.x,
            y = totem.pos.y
        },
        attributs = {
            speed = 200,
            power = 15,
            size  = math.random( 30, 70 )
        }
    }

    function newProjectile:update( dt )

        self.pos.x = self.pos.x + dt * gameSpeed * self.attributs.speed * ( self.dir.x / ( math.abs( self.dir.x ) + math.abs( self.dir.y ) ) )
        self.pos.y = self.pos.y + dt * gameSpeed * self.attributs.speed * ( self.dir.y / ( math.abs( self.dir.x ) + math.abs( self.dir.y ) ) )

        if ( player.pos.x - self.pos.x ) * ( player.pos.x - self.pos.x ) + 
           ( player.pos.y - self.pos.y ) * ( player.pos.y - self.pos.y ) 
        <= ( player.attributs.size / 2 + self.attributs.size / 2 ) * ( player.attributs.size / 2 + self.attributs.size / 2 ) then
            
            DamagePlayer( self.attributs.power )
            
            table.remove( ennemyProjectiles, indexOf( ennemyProjectiles, self ) )
            return

        end
        
        if self.pos.x > 3000 or self.pos.x < -3000 or
           self.pos.y > 3000 or self.pos.y < -3000 then
        
            table.remove( ennemyProjectiles, indexOf( ennemyProjectiles, self ) )
            return

        end

    end

    function newProjectile:draw( posX, posY )

        love.graphics.circle( "line", posX + self.pos.x, posY + self.pos.y, self.attributs.size / 2 )

    end

    table.insert( ennemyProjectiles, newProjectile )

end