function indexOf( array, value )

    for k, v in pairs( array ) do
        
        if value == v then return k end

    end

    return nil

end