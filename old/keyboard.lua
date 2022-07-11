function KeyBoard( key )
    
    keyStr = key

    if not console then

        if key == "e" then
            
            AddEntity( "spirit_totem", math.random( -500, 500 ), math.random( -500, 500 ) )
            AddEntity( "spirit_totem", math.random( -500, 500 ), math.random( -500, 500 ) )
            AddEntity( "spirit_totem", math.random( -500, 500 ), math.random( -500, 500 ) )
            AddEntity( "spirit_totem", math.random( -500, 500 ), math.random( -500, 500 ) )
            AddEntity( "spirit_totem", math.random( -500, 500 ), math.random( -500, 500 ) )

        end

        if key == "m" then
            
            biomeMap = GenerateForestBiome()

            if biomeMap == nil then return end
            for k, room in pairs( biomeMap ) do
                if room.name == "spawn" then
                    currentRoom = room
                end
            end
        end

        if key == "c" then
            
            entitys = {}
            allyProjectiles = {}

            player.attributs.health.current = player.attributs.health.max

        end

        if key == "return" then
            
            console = true

        end
    
    else
    
        if key == "lshift" then

            if capsLock then
                capsLock = false
            else
                capsLock = true
            end

            return

        end

        if key == "backspace" then
            RemoveToConsole( 1 )
            return
        end
        
        if key == "return" then
            
            ExecuteConsole()
            console = false

        else
        
            AddToConsole( key )

        end

    end

    if key == "escape" then
        love.window.close()
    end

end