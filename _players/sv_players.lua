Players = Players or {}

Players["Active"], Players["Disconnected"] = {}, {}
function Players:new(source)
    if (not source) then return false, "player(source): Can't be null" end
    if (Players["Active"][source] ~= nil) then return false, "player(source): Already registered" end

    local _playerData = {
        name = GetPlayerName(source),
        ip = GetPlayerEndpoint(source),
        serverID = source,
        token_count = GetNumPlayerTokens(source),
        tokens = UTIL:GetTokens(source),
        identifier_count = GetNumPlayerIdentifiers(source)
    }

    Players["Active"][source] = {}
    Players["Active"][source].data = _playerData

    Logs:new(source, GetCurrentResourceName(), "Player Joined", "User added to player list.")
end

function Players:assume(data)
    if (not data) then return false, "player(data): Can't be null" end

    local _playerData = {
        name = data.name,
        ip = data.ip,
        serverID = data.id,
        token_count = data.token_count,
        identifier_count = data.identifier_count
    }

    Players["Active"][serverID] = {}
    Players["Active"][serverID].data = _playerData
end

function Players:remove(source)
    if (not source) then return false, "player(source): Can't be null" end
    if (not Players["Active"][source]) then return false, "player(source): Already not active" end

    local _playerData = {
        name = GetPlayerName(source),
        ip = GetPlayerEndpoint(source),
        serverID = source,
        token_count = GetNumPlayersTokens(source),
        identifier_count = GetNumPlayersIdentifiers(source)
    }

    Players["Active"][source] = nil

    Players["Disconnected"][source] = {}
    Players["Disconnected"][source].data = _playerData

    Logs:new(source, GetCurrentResourceName(), "Player Removed", "User removed from player list.")
end

function Players:gather(source, info)
    if (not source) then return false, "player(source): Can't be null" end
    if (not info) then return false, "player(info): Can't be null" end

    local function _getHexId(source)
        for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, 5) == "steam" then
                return v
            end
        end
    end

    if (info == "name") then
        return Players["Active"][source].data.name
    elseif (info == "ip") then
        return Players["Active"][source].data.ip
    elseif (info == "id") then
        return Players["Active"][source].data.serverID
    elseif (info == "tokens") then
        return Players["Active"][source].data.token_count
    elseif (info == "identifiers") then
        return Players["Active"][source].data.identifier_count
    elseif (info == "hex") then
        return _getHexId(source)
    end
end
