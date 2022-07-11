function AddGoblin( posX, posY )

    local entityData = {}

    entityData = {
        posX   = posX,
        posY   = posY,
        speed  = 0.15,
        state  = "idle",
        power  = 15, 
        hp     = 100,
        sprite = nil,
        frame  = 1,
        lastFrame = love.timer.getTime()
    }

    return entityData

end

function UpdateGoblin( k, dt )

    if entitys[ k ].state == "triggered" then 

        if entitys[ k ].posX - player.pos.x < 0 then
            
            entitys[ k ].posX = entitys[ k ].pos.x + ( gameSpeed * entitys[ k ].speed * dt )

        elseif entitys[ k ].posX - player.pos.x > 0 then
            
            entitys[ k ].posX = entitys[ k ].posX - ( gameSpeed * entitys[ k ].speed * dt )

        end

        if entitys[ k ].posY - player.pos.y < 0 then
            
            entitys[ k ].posY = entitys[ k ].posY + ( gameSpeed * entitys[ k ].speed * dt )

        elseif entitys[ k ].posY - player.pos.y > 0 then
            
            entitys[ k ].posY = entitys[ k ].posY - ( gameSpeed * entitys[ k ].speed * dt )

        end

    end

    if math.abs( player.pos.x - entitys[ k ].posX ) * math.abs( player.pos.x - entitys[ k ].posX ) +
       math.abs( player.pos.y - entitys[ k ].posY ) * math.abs( player.pos.y - entitys[ k ].posY ) < 200 * 200 then
        
        entitys[ k ].state = "triggered" 

    end

    if entitys[ k ].state == "idle" then
        


    end

    if entitys[ k ].lastFrame + 0.75 < love.timer.getTime() then
        
        entitys[ k ].lastFrame = love.timer.getTime()
        
        entitys[ k ].frame = entitys[ k ].frame + 1

    end

end