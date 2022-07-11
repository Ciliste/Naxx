-- Requires
require( "player/player"   ) 
require( "entity/entity"   )
require( "console/console" )
require( "projectile/projectile" )
require( "cursor/cursor" )
require( "healthbar/healthbar" )
require( "minimap/minimap" )
require( "map/map"   )
require( "camera"    )
require( "keyboard"  )
require( "lib/utils" )

-- https://itch.io/profile/henrysoftware

function love.load()

    math.randomseed( os.time() )

    keyStr = ""
    gameSpeed = 1
    width, height, flags = love.window.getMode( )

    console = false

    love.window.setFullscreen( true )

    GenerateTestField( 20 )

end

function love.update( dt )
    
    -- Mise à jour des projectiles 
    UpdateProjectiles( dt )

    -- Mise à jour des Entités
    UpdateEntitys( dt )

    -- Mise à jour du Joueur
    UpdatePlayer( dt )

end

function love.draw()

    -- Mets à jour les informations de la fenêtre
    width, height, flags = love.window.getMode()

    -- Affiche le contenu de la camera
    DrawCamera()

    -- La touche
    love.graphics.print( keyStr, 10, 10 )
    love.graphics.print( love.timer.getTime( ), 10, 25 )

    -- Affiche la console
    PrintConsole()

    --Affiche les FPS
    love.graphics.print( love.timer.getFPS() .. " fps", width - 100, 100 )

    -- Affiche la HealthBar
    DrawHealthBar()

end

function love.keypressed( key )
    
    KeyBoard( key )
    
end