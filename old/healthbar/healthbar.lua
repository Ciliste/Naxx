function DrawHealthBar()
    
    love.graphics.print( "HP : " .. player.attributs.health.current .. "/" .. player.attributs.health.max, width * 0.05, height * 0.3 )

end