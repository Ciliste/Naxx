consoleContent = ""

mobFocus = ""

function ExecuteConsole()
    
    if consoleContent == "debug" then 
        if debugMode == true then
            debugMode = false
        else
            debugMode = true
        end
    elseif consoleContent == "testfield" then

        GenerateTestField( 10 )

    end
        
    consoleContent = ""

end

function AddToConsole( key )
    
    consoleContent = consoleContent .. key

end

function RemoveToConsole( charNumber )

    for i = 1, charNumber, 1 do
        consoleContent = consoleContent:sub(1, -2) 
    end

end

function PrintConsole()

    if console then
       
        love.graphics.print( consoleContent .. "|", width * 0.1, height * 0.8 )

    end

end