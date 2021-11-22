DATABASE = DATABASE or {}

DATABASE.createPlayer = function(pSource)
    -- Create player here
end

DATABASE.gatherPlayerInfo = function(pSource)
    -- Gather player info here
    pIdentifier = GetPlayerIdentifiers(pSource)[1]
    sQuery = "SELECT * FROM char WHERE identifier = ?"
    return SQL.execute(sQuery, pIdentifier) or nil or ""
end
